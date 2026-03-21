// const showTestPopups = () => {
//    document.querySelectorAll(".test-popup").forEach((popup) => {
//       popup.classList.add("active");
//    });
// };

// const selectTheoraticalExam = () => {
//    document.querySelector(".exam-popup.practical").classList.remove("active");
//    document.querySelector(".exam-popup.theoratical").classList.add("active");
//    document.querySelector(".practical-selected").classList.remove("active");
//    document.querySelector(".theoratical-selected").classList.add("active");
// };

// const startTheoraticalExam = () => {
//    document.querySelector(".slider-inner").classList.add("top");
// };

// const selectPracticalExam = () => {
//    document.querySelector(".exam-popup.practical").classList.add("active");
//    document.querySelector(".exam-popup.theoratical").classList.remove("active");
//    document.querySelector(".practical-selected").classList.add("active");
//    document.querySelector(".theoratical-selected").classList.remove("active");
// };

// const startPracticalExam = () => {
//    document.querySelector(".slider-inner").classList.add("bottom");
// };

// const hideExamPopup = () => {
//    document.querySelectorAll(".exam-popup").forEach((popup) => {
//       popup.classList.remove("active");
//    });
// };

// const showSuccess = () => {
//    document.querySelector(".slider-inner").classList.add("right");
// };

// const showFail = () => {
//    document.querySelector(".slider-inner").classList.add("left");
// };

let SelectedExam = null;
let TheoreticalExamData = [ ];
let CurrentQuestionIndex = 0;
let ActiveQuestion = null;
let MistakeCounter = 0;
let RemainingTime = null;
let Timer = null;
let Licenses = [ ];
let Prices = [ ];

function ShowQuestion() {
    let QuestionData = TheoreticalExamData.Questions[CurrentQuestionIndex];
    window.$('#questionindex').html(CurrentQuestionIndex + 1);
    window.$('#examtime').html(MsToTable());
    window.$('#questiontitle').html(QuestionData.Question);
    window.$('#firstanswer').html(QuestionData.Answers[0].Text);
    window.$('#secondanswer').html(QuestionData.Answers[1].Text);
    window.$('#thirdanswer').html(QuestionData.Answers[2].Text);
    ActiveQuestion = QuestionData;
}

function MsToTable() {
    let seconds = parseInt((RemainingTime / 1000) % 60);
    let minutes = parseInt((RemainingTime / (1000 * 60)) % 60);
    minutes = (minutes < 10) ? '0' + minutes : minutes;
    seconds = (seconds < 10) ? '0' + seconds : seconds;
    return minutes + ':' + seconds;
}

function StartTimer() {
    Timer = setInterval(function() {
        RemainingTime = RemainingTime - 1000;
        window.$('#examtime').html(MsToTable());
        if (RemainingTime == 0) {
            window.$('.slider-inner').addClass('left');
            clearInterval(Timer);
        }
    }, 1000);
}

function SelecteAnswer(number) {
    switch (number) {
        case 1:
            if (ActiveQuestion.Answers[0].Right) {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('correct');
            } else {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('false');
                MistakeCounter++;
            }
            break;
        case 2:
            if (ActiveQuestion.Answers[1].Right) {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('correct');
            } else {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('false');
                MistakeCounter++;
            }
            break;
        case 3:
            if (ActiveQuestion.Answers[2].Right) {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('correct');
            } else {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('false');
                MistakeCounter++;
            }
            break;
    }
    if (CurrentQuestionIndex == TheoreticalExamData.Questions.length - 1) {
        if (MistakeCounter > TheoreticalExamData.MistakeMax) {
            window.$('.slider-inner').addClass('left');
        } else {
            window.$('.slider-inner').addClass('right');
            window.$.post(`https://${GetParentResourceName()}/addLicense`, JSON.stringify({
                exam: SelectedExam
            }));
        }
        clearInterval(Timer);
    } else {
        CurrentQuestionIndex++;
        ShowQuestion();
    }
}

function StartPracticalTimer() {
    Timer = setInterval(function() {
        RemainingTime = RemainingTime - 1000;
        window.$('#missiontimer').html(MsToTable());
        if (RemainingTime == 0) {
            window.$.post(`https://${GetParentResourceName()}/missionFailed`, JSON.stringify({}));
            clearInterval(Timer);
        }
    }, 1000);
}

window.$(document).ready(function() {

    window.$('#showTestPopups').on('click', function() {
        window.$('.test-popup').addClass('active');
    });

    window.$('#selectTheoraticalExam').on('click', function() {
        if (Licenses.theoretical == 1) return;
        window.$('.exam-popup.practical').removeClass('active');
        window.$('.exam-popup.theoratical').addClass('active');
    });

    window.$('#selectPracticalExam').on('click', function() {
        if (Licenses.practical == 1) return;
        if (Licenses.theoretical == 0) return;
        window.$('.exam-popup.theoratical').removeClass('active');
        window.$('.exam-popup.practical').addClass('active');
    });

    window.$('#theoreticalno').on('click', function() {
        window.$('.exam-popup').removeClass('active');
    });

    window.$('#practicalno').on('click', function() {
        window.$('.exam-popup').removeClass('active');
    });

    window.$('#startTheoraticalExam').on('click', function() {
        window.$.post(`https://${GetParentResourceName()}/checkBalance`, JSON.stringify({
            price: Prices.Theoretical
        }), function(result) {
            if (result) {
                SelectedExam = 'theoretical';
                window.$('.exam-popup').removeClass('active');
                window.$('.slider-inner').addClass('top');
                CurrentQuestionIndex = 0;
                ActiveQuestion = null;
                MistakeCounter = 0;
                RemainingTime = TheoreticalExamData.ExamTime * 60000;
                window.$('.questions').html('');
                for (let idx = 0; idx < TheoreticalExamData.Questions.length; idx++) {
                    window.$('.questions').append(`<div class='question' id='question-`+(idx + 1)+`'>`+(idx + 1)+`</div>`);
                }
                ShowQuestion();
                StartTimer();
            }
        });
    });

    window.$('#startPracticalExam').on('click', function() {
        window.$.post(`https://${GetParentResourceName()}/checkBalance`, JSON.stringify({
            price: Prices.Practical
        }), function(result) {
            if (result) {
                SelectedExam = 'practical';
                window.$.post(`https://${GetParentResourceName()}/startPractical`, JSON.stringify({ }), function(canStart) {
                    if (canStart) {
                        window.$('.slider-inner').addClass('bottom');
                        window.$('.exam-popup').removeClass('active');
                    }
                });
            }
        });
    });

    window.$('#firstanswer').on('click', function() {
        SelecteAnswer(1);
    });

    window.$('#secondanswer').on('click', function() {
        SelecteAnswer(2);
    });

    window.$('#thirdanswer').on('click', function() {
        SelecteAnswer(3);
    });

    window.$('#failaccept').on('click', function() {
        window.$('.slider-inner').removeClass('left');
        window.$('.slider-inner').removeClass('right');
        window.$('.slider-inner').removeClass('top');
        window.$('.slider-inner').removeClass('bottom');
    });

    window.$('#passaccept').on('click', function() {
        window.$('.slider-inner').removeClass('left');
        window.$('.slider-inner').removeClass('right');
        window.$('.slider-inner').removeClass('top');
        window.$('.slider-inner').removeClass('bottom');
    });

    window.addEventListener('message', event => {
        switch (event.data.type) {
            case 'ShowUI':
                window.$('.slider').css('display', 'initial');
                TheoreticalExamData = event.data.theoreticalExam;
                Licenses = event.data.licenses;
                Prices = event.data.prices;
                window.$('#total').html('€'+(Prices.Theoretical + Prices.Practical));
                window.$('#theoreticalprice').html('€'+(Prices.Theoretical));
                window.$('#theoraticalexamprice').html('€'+(Prices.Theoretical));
                window.$('#practicalprice').html('€'+(Prices.Practical));
                window.$('#practicalexamprice').html('€'+(Prices.Practical));
                if (Licenses.theoretical == 1) {
                    window.$('.theoratical-selected').addClass('active');
                }
                if (Licenses.practical == 1) {
                    window.$('.practical-selected').addClass('active');
                }
                break;
            case 'UpdateLicenses':
                Licenses = event.data.licenses;
                if (Licenses.theoretical == 1) {
                    window.$('.theoratical-selected').addClass('active');
                }
                if (Licenses.practical == 1) {
                    window.$('.practical-selected').addClass('active');
                }
                break;
            case 'UpdateMission':
                window.$('#missiontitle').html(event.data.currentMission + ' Opdracht');
                window.$('#missiontext').html(event.data.missionText);
                if (event.data.examTime) {
                    RemainingTime = event.data.examTime * 60000;
                    StartPracticalTimer();
                }
                break;
            case 'HideMission':
                window.$('.slider-inner').removeClass('bottom');
                if (event.data.result) {
                    window.$('.slider-inner').addClass('right');
                } else {
                    window.$('.slider-inner').addClass('left');
                }
                clearInterval(Timer);
                break;
        }
    });

    window.$(document).keyup(function(e) {
        if (e.keyCode == 27) {
            window.$('.slider').css('display', 'none');
            window.$('.license-popup').removeClass('active');
            window.$('.exam-popup').removeClass('active');
            window.$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        }
    });

});