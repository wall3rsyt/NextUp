$(function () {
    let Config = {};
    let checkboxHidden = false;
    let checkboxJobOnly = false;

    function display(bool) {
        if (bool) {
            $(".container").fadeIn(400);
        } else {
            $(".container").fadeOut(400);
        }
    }

    function displayPreview(bool) {
        if (bool) {
            $(".preview").fadeIn(400);
        } else {
            $(".preview").fadeOut(400);
        }
    }

    function StringContains(string, substring) {
        return string.includes(substring);
    }

    $(".container").hide();
    $(".preview").hide();
    $("#error_link").hide();

    var slider = document.getElementById("myRange");
    var output = document.getElementById("demo");
    var canPressEnter = true;

    window.addEventListener('message', function(event) {
        if (event.data.action === 'setConfig') {
            Config = event.data.config;
            if (Config.framework != "esx" && Config.framework != "qb") {
                $(".checkboxContainer").hide();
            }
            if (!Config.images.enableHiddenImages) {
                const checkbox = document.getElementById('checkbox1');
                const label = document.querySelector('label[for="checkbox1"]');
                // Hide the checkbox and its label
                checkbox.style.display = 'none';
                label.style.display = 'none';
            }
            if (!Config.images.enableJobOnlyImages) {
                const checkbox = document.getElementById('checkbox2');
                const label = document.querySelector('label[for="checkbox2"]');

                // Hide the checkbox and its label
                checkbox.style.display = 'none';
                label.style.display = 'none';
            }
            adjustSliderValue(Config.offsetSliderAmount);
        }
    });

    function adjustSliderValue(sliderValue) {
        document.getElementById("myRange").step = `${sliderValue}`;
    }

    window.addEventListener('message', (event) => {
        var item = event.data;
        if (item.type === 'ui') {
            if (item.status === true) {
                display(true);
            } else {
                display(false);
            }
        }
        if (item.type === 'preview') {
            if (item.status === true) {
                displayPreview(true);
            } else {
                displayPreview(false);
            }
        }
        if (item.type === 'clipboard') {
            function copyToClipboard(text) {
                const el = document.createElement('textarea');
                el.value = text;
                document.body.appendChild(el);
                el.select();
                document.execCommand('copy');
                document.body.removeChild(el);
            }
            copyToClipboard(item.data)
        }
    });

    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            display(false);
            displayPreview(false);
            $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
            slider.value = 0;
            document.getElementById("inputField").value = "";
            return;
        }
    };

    $("#close").click(function () {
        display(false);
        $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));

        document.getElementById("inputField").value = "";

        return;
    });

    document.addEventListener('keydown', function(event) {
        if (!canPressEnter) return;

        const container = document.querySelector('.container');
        const preview = document.querySelector('.preview');
        const style = window.getComputedStyle(container);
        const previewStyle = window.getComputedStyle(preview);
        const isContainerVisible = style.display !== 'none' && style.visibility !== 'hidden' && style.opacity !== '0';
        const isPreviewVisible = previewStyle.display !== 'none' && previewStyle.visibility !== 'hidden' && previewStyle.opacity !== '0';

        // Check if the key pressed is the Enter key
        if (event.key === 'Enter' && isContainerVisible) {
            SubmitImage();
            preventMultiplePresses();
            return;
        }

        if (event.key === 'Enter' && isPreviewVisible) {
            displayPreview(false);
            $.post(`https://${GetParentResourceName()}/confirm`, JSON.stringify({}));
            slider.value = 0;
            preventMultiplePresses();
            return;
        }

        // Check for left and right arrow keys for slider adjustment
        if (event.key === 'ArrowLeft') {
            adjustSlider(Config.offsetSliderAmount * -1);
        } else if (event.key === 'ArrowRight') {
            adjustSlider(Config.offsetSliderAmount);
        }
    });

    $("#yes").click(function () {
        displayPreview(false);
        $.post(`https://${GetParentResourceName()}/confirm`, JSON.stringify({}));
        slider.value = 0;
        return;
    });

    $("#no").click(function () {
        displayPreview(false);
        $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
        slider.value = 0;
        return;
    });

    // When the user clicks on the submit button, it will run
    $("#submit").click(function () {
        SubmitImage();
        return;
    });

    output.innerHTML = slider.value;

    slider.oninput = function() {
        let roundedValue = parseFloat(this.value).toFixed(1);
        output.innerHTML = roundedValue;
        $.post(`https://${GetParentResourceName()}/slider`, JSON.stringify({
            number: roundedValue,
        }));
    };

    function adjustSlider(amount) {
        let newValue = parseFloat(slider.value) + amount;
        newValue = Math.min(Math.max(newValue, parseFloat(slider.min)), parseFloat(slider.max));
        let roundedValue = newValue.toFixed(3);
        slider.value = roundedValue;
        output.innerHTML = roundedValue;
        $.post(`https://${GetParentResourceName()}/slider`, JSON.stringify({
            number: roundedValue,
        }));
    }

    function preventMultiplePresses() {
        canPressEnter = false;
        setTimeout(() => {
            canPressEnter = true;
        }, 1000);
    }

    function SubmitImage() {
        let inputValue = $("#inputField").val();
        let checkboxHidden = $("#checkbox1").is(":checked");
        let checkboxJobOnly = $("#checkbox2").is(":checked");

        if (StringContains(inputValue, 'http') === false) {
            $.post(`https://${GetParentResourceName()}/fileMain`, JSON.stringify({
                text: inputValue,
                hidden: checkboxHidden,
                jobOnly: checkboxJobOnly
            }));
            document.getElementById("inputField").value = "";
            output.innerHTML = 0.0;
            return;
        }

        $("<img/>").attr('src', inputValue)
            .on('load', function() {
                var width = this.width;
                var height = this.height;

                $.post(`https://${GetParentResourceName()}/main`, JSON.stringify({
                    text: inputValue,
                    width: width,
                    height: height,
                    hidden: checkboxHidden,
                    jobOnly: checkboxJobOnly
                }));
            });

        document.getElementById("inputField").value = "";
        slider.value = 0.0;

        output.innerHTML = 0.0;
        document.getElementById("checkbox1").checked = false;
        document.getElementById("checkbox2").checked = false;

        if (!Config.gif.enable && StringContains(inputValue, ".gif") || StringContains(inputValue, ".gif") && StringContains(inputValue, "http") && !Config.gif.enableLinks) {
            return;
        }
        displayPreview(true);

        return;
    }
});
