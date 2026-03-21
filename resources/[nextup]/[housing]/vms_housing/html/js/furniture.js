const batchSize = 24;
let loadedCount = 0;

$(document).on('click', '.property_furniture > div > .menu > #categories > #elements > div', function(e) {
    if ($(this).hasClass('active')) {
        $('.property_furniture > div > .menu > #categories > #elements > div').removeClass('active');
    } else {
        $('.property_furniture > div > .menu > #categories > #elements > div').removeClass('active');
        $(this).addClass('active');
    }
    applyFurnitureMenuFilter();
})

$(document).on('click', '.property_furniture > div > .menu > #items > #elements > div', function(e) {
    let theme = $(this).data('theme');
    let furnitureModel = $(this).data('model');
    let furnitureId = $(this).data('id');

    if (furnitureId == 'edit') {
        $.post(`https://${GetParentResourceName()}/propertyFurniture:edit`, JSON.stringify({}));
        
    } else if (theme) {
        $.post(`https://${GetParentResourceName()}/propertyTheme:edit`, JSON.stringify({theme: theme}));

    } else {
        $.post(`https://${GetParentResourceName()}/propertyFurniture:placeNew`, JSON.stringify({
            model: furnitureModel,
            id: furnitureId,
        }));

    }
})

$('.property_furniture .menu > #items > #search > input').on('keyup', function() {
    applyFurnitureMenuFilter();
});

function applyFurnitureMenuFilter() {
    const tag = $('.property_furniture > div > .menu > #categories > #elements > div.active').data('tag')
    const searchText = $('.property_furniture .menu > #items > #search > input').val().toLowerCase();

    Property.FilteredFurniture = Property.LoadedFurniture.filter(item => {
        const matchTag = !tag || item.tag === tag;
        const matchSearch = !searchText || (item.name || item.theme).toLowerCase().includes(searchText.toLowerCase());
        return matchTag && matchSearch;
    });

    loadedCount = 0;
    $('.property_furniture #items > #elements').empty();
    renderFurnitureMenuBatch();
}

function applyFurnitureOrderFilter() {
    const selectedTag = $('.housing_manage div[data-type="order-furniture"] select[name="furniture-tag"]').val();
    const searchValue = $('.housing_manage div[data-type="order-furniture"] #search input').val().toLowerCase();
    const selectedEnvironment = $('.housing_manage div[data-type="order-furniture"] select[name="furniture-environment"]').val();
    
    Property.FilteredFurniture = Property.LoadedFurniture.filter(item => {
        const matchTag = selectedTag == '0' || item.tag === selectedTag;
        const matchSearch = !searchValue || (item.name).toLowerCase().includes(searchValue.toLowerCase());
        const matchEnvironment = selectedEnvironment == '0' || ((selectedEnvironment === 'inside' && item.isInside === '1') || (selectedEnvironment === 'outside' && item.isOutside === '1'));

        return matchTag && matchSearch && matchEnvironment;
    });

    loadedCount = 0;
    $('.housing_manage div[data-type="order-furniture"] > div > .side-boxes > .box > .furniture-list').empty();
    renderFurnitureOrderBatch();
}

function renderFurnitureMenuBatch() {
    const container = $('.property_furniture #items > #elements');
    const nextBatch = Property.FilteredFurniture.slice(loadedCount, loadedCount + batchSize);
    nextBatch.forEach(item => {
        const html = `
            <div
                ${item.id ? `data-id="${item.id}"` : ''}
                ${item.tag ? `data-tag="${item.tag}"` : ''}
                ${item.model ? `data-model="${item.model}"` : ''}
                ${item.theme ? `data-theme="${item.theme}"` : ''}
            >
                <div class="label">
                    <p class="name">${item.name}</p>
                </div>
                
                ${item.id !== 'edit' ? `
                    ${item.price !== undefined ? `
                        <div class="label-second">
                            <p class="price">${translation.currency} ${item.price}</p>
                        </div>
                    ` : (item.id !== undefined ? `
                        <div class="label-second">
                            <p class="id">#${item.id}</p>
                        </div>
                    ` : '')}
                ` : ''}
                
                <img src="${item.image}" draggable="false">
            </div>
        `;
        container.append(html);
    });

    loadedCount += nextBatch.length;
}

function renderFurnitureOrderBatch() {
    const container = $('.housing_manage div[data-type="order-furniture"] > div > .side-boxes > .box > .furniture-list');
    const nextBatch = Property.FilteredFurniture.slice(loadedCount, loadedCount + batchSize);
    nextBatch.forEach(item => {
        const html = `
            <div
                ${item.tag ? `data-tag="${item.tag}"` : ''}
                ${item.price ? `data-price="${item.price}"` : ''}
                data-is-inside="${item.isIndoor}"
                data-is-outside="${item.isOutdoor}"
            >
                ${item.interactableName ? `<div class="info">${translation.manage.order['tag:label.interactable']}</div>` : ''}
                <img src="./images/furniture/${item.model}.webp" draggable="false">
                <div class="name">${item.name}</div>
                <div class="price">${translation.manage.order['description.price']} ${translation.currency}${formatNumber(item.price, 0, 0)}</div>
                <div class="clickable-btn button" data-action="order-furniture" data-model="${item.model}">${translation.manage.order['buttons:label.purchase']}</div>
            </div>
        `;
        container.append(html);
    });

    loadedCount += nextBatch.length;
}

$('.property_furniture #items > #elements').on('scroll', function() {
    const el = $(this)[0];
    if(el.scrollTop + el.clientHeight >= el.scrollHeight - 50) {
        if(loadedCount < Property.FilteredFurniture.length) {
            renderFurnitureMenuBatch();
        }
    }
});

$('.housing_manage div[data-type="order-furniture"] > div > .side-boxes > .box > .furniture-list').on('scroll', function() {
    const el = $(this)[0];
    if(el.scrollTop + el.clientHeight >= el.scrollHeight - 50) {
        if(loadedCount < Property.FilteredFurniture.length) {
            renderFurnitureOrderBatch();
        }
    }
});

$(document).on('click', '.property_furniture_purchase > .purchase > .buttons > #purchase', function(e) {
    let paymentMethod = $(this).data('payment');
    $.post(`https://${GetParentResourceName()}/propertyFurniture:purchaseAccept`, JSON.stringify({
        paymentMethod: paymentMethod,
    }));
})

$(document).on('click', '.property_furniture_purchase > .purchase > .buttons > #cancel', function(e) {
    $.post(`https://${GetParentResourceName()}/propertyFurniture:purchaseCancel`, JSON.stringify({}));
})