const propsInput = document.querySelector('.housing_creator>div>.menu>#register-new-furniture input[name="props-list"]');
const propsList = new Tagify(propsInput);

propsList.on('add', function(e) {
    let isCheckerEnabled = $('.inp-cbx[data-toggle="check-existing-furniture"]').prop('checked');
    const tagValue = e.detail.data.value;
    if (isCheckerEnabled && Property.FurnitureList[tagValue]) {
        propsList.removeTag(e.detail.tag);
    }
});

const renderCheckbox = (name, label, checked) => {
    return `
        <div class="checkbox-wrapper-46">
            <input type="checkbox" id="${name}" class="inp-cbx" data-toggle="${name}" ${checked ? 'checked' : ''}/>
            <label for="${name}" class="cbx">
                <span><svg viewBox="0 0 12 10" height="10px" width="12px"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                <label for="${name}" class="input-name">${label}</label>
            </label>
        </div>
    `;
};

const getCheckboxState = (name) => {
    const el = $(`.housing_creator #modal .inp-cbx[data-toggle="${name}"]`);
    return el.length ? el.prop('checked') : undefined;
};

const HousingCreator = {
    IsModifyingExisting: false,
    ModifyingIdentifier: false,

    AgentContractPropertyId: null,

    IsRealEstate: false,
    AllowSellProperties: false,
    AllowRentProperties: false,
    
    PlayerJobPerm: [],
    PlayerGroupPerm: [],

    Pagination: {
        CurrentPage: 1,
        ItemsPerPage: 8,
        Array: [],
        ArrayFiltered: [],
        ActiveFilters: [],
        SearchTerm: "",
    },
    
    BuildingParkingId: null,
    BuildingParking: null,
    ApartmentParkingSpots: {},

    AllProperties: [],
    AvailableShells: [],
    AvailableIPLS: [],
    
    HasPermission: function(perm) {
        return this.PlayerJobPerm && this.PlayerJobPerm[perm] || this.PlayerGroupPerm && this.PlayerGroupPerm[perm]
    },
    
    Open: function (data) {
        currentMenu = 'housing_creator';

        this.PlayerJobPerm = data.playerJobPerm || [];
        this.PlayerGroupPerm = data.playerGroupPerm || [];

        // Real Estate
        this.IsRealEstate = data.isRealEstate || false;
        this.AllowSellProperties = data.allowSellProperties || false;
        this.AllowRentProperties = data.allowRentProperties || false;
        // Real Estate

        this.LoadMenu();
    },

    Close: function () {
        $(`.housing_creator, .housing_creator>div>.menu>#register-new-furniture`).fadeOut(120)
        this.IsRealEstate = false;
        currentMenu = null;
    },

    Update: function (data) {
        this.LoadMenusData(data.data);
    },

    LoadMenusData: function (vals) {
        if (vals) {
            if (this.IsRealEstate) {
                if (vals.type == 'load-company-properties') {
                    $('.housing_creator div[data-type="company-properties"]>div>.side-boxes>.box>#properties-list').empty();

                    const properties = vals.properties
                    for (const [id, property] of Object.entries(properties)) {
                        let imagesCount = 0;
                        let imagesElements = '';
                        if (property.images && property.images['1']) {
                            imagesCount += 1;
                            imagesElements = imagesElements + `<img src="${property.images['1']}" draggable="false">`;
                        } else {
                            imagesCount = 1;
                            imagesElements = `<img src="https://consultix.radiantthemes.com/wp-content/themes/consultix/images/no-image-found-360x250.png" draggable="false">`;
                        }

                        let newPropertylHTML = `
                            <div data-property-id="${property.id}">
                                <p class="name">${property.name}</p>
                                <p class="address">${property.address}, <span>${property.region}</span></p>
                                
                                <div class="gallery-container">
                                    <div class="gallery-wrapper">
                                        <div class="gallery">
                                            ${imagesCount >= 1 ? imagesElements : ''}
                                        </div>
                                    </div>
                                </div>

                                <div class="details">
                                    <div>
                                        ${property.building?.type == 'building' && `
                                            <div>
                                                <p class="header">${translation.realestate.company_properties['details:header.building']}</p>
                                                <p class="data">${property.building.name}</p>
                                            </div>
                                        ` || property.building?.type == 'motel' && `
                                            <div>
                                                <p class="header">${translation.realestate.company_properties['details:header.motel']}</p>
                                                <p class="data">${property.building.name}</p>
                                            </div>
                                        ` || `
                                            <div>
                                                <p class="header">${translation.realestate.company_properties['details:header.plot_area']}</p>
                                                <p class="data">${property.area} ${translation.area_units[areaUnit]}</p>
                                            </div>
                                        `}

                                        <div>
                                            <p class="header">${translation.realestate.company_properties['details:header.furniture_inside']}</p>
                                            <p class="data">${property.furnitureInside ? translation.realestate.company_properties['details:description.furniture_inside_allowed'] : translation.realestate.company_properties['details:description.furniture_inside_not_allowed']}</p>
                                        </div>

                                        ${HousingCreator.AllowSellProperties ? `
                                            <div id="sale-details">
                                                <p class="header">${translation.realestate.company_properties['details:header.on_sale']}</p>
                                                <p class="data">${property.sale ? translation.realestate.company_properties['details:description.for_sale'] : translation.realestate.company_properties['details:description.not_for_sale']}</p>
                                            </div>
                                        ` : ''}

                                        ${HousingCreator.AllowRentProperties ? `
                                            <div id="rent-details">
                                                <p class="header">${translation.realestate.company_properties['details:header.for_rent']}</p>
                                                <p class="data">${property.renter ? property.renterName : (property.rent ? translation.realestate.company_properties['details:description.for_rent'] : translation.realestate.company_properties['details:description.not_for_rent'])}</p>
                                            </div>
                                        ` : ''}
                                    </div>
                                    <div>
                                        ${
                                            (usingVMSGarages && property.parking) && `
                                                <div>
                                                    <p class="header">${translation.realestate.company_properties['details:header.parking']}</p>
                                                    <p class="data">${(translation.realestate.company_properties['details:description.parking']).format(property.parking)}</p>
                                                </div>
                                            ` || (usingVMSGarages && property.building && property.building.type == 'building') && `
                                                <div>
                                                    <p class="header">${translation.realestate.company_properties['details:header.parking_spaces']}</p>
                                                    <p class="data">${(translation.realestate.company_properties['details:description.parking_spaces']).format(property.parking || 0)}</p>
                                                </div>
                                            ` || `
                                                <div>
                                                    <p class="header">${translation.realestate.company_properties['details:header.garage']}</p>
                                                    <p class="data">${property.garage ? translation.realestate.company_properties['details:description.garage_yes'] : translation.realestate.company_properties['details:description.garage_no']}</p>
                                                </div>
                                            ` || ''
                                        }

                                        <div>
                                            <p class="header">${translation.realestate.company_properties['details:header.furniture_outside']}</p>
                                            <p class="data">${property.furnitureOutside ? translation.realestate.company_properties['details:description.furniture_outside_allowed'] : translation.realestate.company_properties['details:description.furniture_outside_not_allowed']}</p>
                                        </div>
                                        
                                        ${HousingCreator.AllowSellProperties ? `
                                            <div id="price-details">
                                                <p class="header">${translation.realestate.company_properties['details:header.sale_price']}</p>
                                                <p class="data">
                                                    ${translation.currency}
                                                    <input
                                                        type="text"
                                                        name="price"
                                                        class="full-input formatted-number"
                                                        pattern="d*"
                                                        value="${property.salePrice || 0}"
                                                        data-property-id="${property.id}"
                                                        data-default="${property.salePrice || 0}"
                                                        data-on-sale="${property.sale ? '1' : '0'}"
                                                        ${(!HousingCreator.HasPermission('UpdatePropertyPrice') || property.renter) && 'disabled'}
                                                    >
                                                </p>
                                            </div>
                                        ` : ''}

                                        ${HousingCreator.AllowRentProperties ? `
                                            <div id="rent-price-details">
                                                <p class="header">${translation.realestate.company_properties['details:header.rent_price']}</p>
                                                <p class="data">
                                                    ${translation.currency}
                                                    <input
                                                        type="text"
                                                        name="price"
                                                        class="full-input formatted-number"
                                                        pattern="d*"
                                                        value="${property.rentPrice || 0}"
                                                        data-property-id="${property.id}"
                                                        data-default="${property.rentPrice || 0}"
                                                        data-on-rent="${property.rent ? '1' : '0'}"
                                                        ${(!HousingCreator.HasPermission('UpdatePropertyPrice') || property.renter) && 'disabled'}
                                                    >
                                                </p>
                                            </div>
                                        ` : ''}
                                    </div>
                                </div>

                                <div class="buttons">
                                    ${(property.renter && HousingCreator.HasPermission('TerminateRental')) ? `
                                        ${property.terminationActive ? `
                                            <div id="cancel-termination-property" data-property-id="${property.id}">
                                                <i class="fa-solid fa-person-walking-luggage"></i>
                                                <span>${translation.realestate.company_properties['btn.cancel_termination']}</span>
                                            </div>
                                        ` : `
                                            <div id="terminate-now-property" data-property-id="${property.id}">
                                                <i class="fa-solid fa-person-walking-luggage"></i>
                                                <span>${translation.realestate.company_properties['btn.terminate_now']}</span>
                                            </div>
                                            <div id="termination-property" data-property-id="${property.id}">
                                                <i class="fa-solid fa-person-walking-luggage"></i>
                                                <span>${translation.realestate.company_properties['btn.termination']}</span>
                                            </div>
                                        `}
                                    ` : ''}
                                    ${(!property.renter && (HousingCreator.HasPermission('SellProperties') || HousingCreator.HasPermission('RentProperties'))) ? `
                                        <div id="transaction-property" data-property-id="${property.id}">
                                            <i class="fa-solid fa-file-invoice-dollar"></i>
                                            <span>${translation.realestate.company_properties['btn.transaction']}</span>
                                        </div>
                                    ` : ''}
                                    ${(!property.renter && HousingCreator.HasPermission('UpdatePropertyPrice')) ? `
                                        <div id="update-property" data-property-id="${property.id}" style="display:none">
                                            <i class="fa-solid fa-pen"></i>
                                            <span>${translation.realestate.company_properties['btn.update']}</span>
                                        </div>
                                    ` : ''}
                                    ${(!property.renter && HousingCreator.HasPermission('ListProperty')) ? `
                                        <div id="unlist-property" data-property-id="${property.id}" ${!property.sale ? 'style="display:none"' : ''}>
                                            <i class="fa-solid fa-list-ul"></i>
                                            <span>${translation.realestate.company_properties['btn.unlist']}</span>
                                        </div>
                                        <div id="list-property" data-property-id="${property.id}" ${property.sale ? 'style="display:none"' : ''}>
                                            <i class="fa-solid fa-list-ul"></i>
                                            <span>${translation.realestate.company_properties['btn.list']}</span>
                                        </div>
                                    ` : ''}
                                </div>
                            </div>
                        `;
    
                        const newElement = $(newPropertylHTML);
                        $('.housing_creator div[data-type="company-properties"]>div>.side-boxes>.box>#properties-list').append(newElement);
                    }
                }
            } else {
                if (vals.type == 'load-shells') {
                    $(`
                        .housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>#shells-list,
                        .housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>.text .tags,
                        .housing_creator div[data-type="create-new-shell"] #tags .mt-4
                    `).empty();

                    this.AvailableShells = vals.AvailableShells;

                    $('.housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>.text .tags').append(`
                        <div class="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" placeholder="${translation.creator.configuration_shell['search:placeholder']}">
                        </div>
                    `);
                    
                    for (const [name, label] of Object.entries(config.shellsTags)) {
                        if (vals.AvailableShellTags[name] || name === 'default' || name === 'empty' || name === 'furnished') {
                            $('.housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>.text .tags').append(`<div data-tag="${name}">${label}</div>`);
                            $('.housing_creator div[data-type="create-new-shell"] #tags .mt-4').append(`<div data-tag="${name}">${label}</div>`);
                        }
                    }

                    const sortedShells = Object.entries(this.AvailableShells).sort((a, b) => {
                        const labelA = (a[1].label || a[0] || '').toLowerCase();
                        const labelB = (b[1].label || b[0] || '').toLowerCase();
                        if (labelA < labelB) return -1;
                        if (labelA > labelB) return 1;
                        return 0;
                    });

                    if (sortedShells.length == 0) {
                        $('.housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>#shells-list').html(NoShellWarning);
                    }

                    for (const [name, data] of sortedShells) {
                        let tagClasses = '';
                        let tagElements = '';
                        if (data.tags && data.tags.length >= 1) {
                            data.tags.forEach(tag => {
                                tagClasses = tagClasses + `tag-${tag} `;
                                if (config.shellsTags[tag]) tagElements = tagElements + `<div>${config.shellsTags[tag]}</div>`;
                            });
                        }
                        
                        let imagesCount = 0;
                        let imagesElements = '';
                        let imagesElementsDots = '';
                        if (data.images && data.images.length >= 1) {
                            data.images.forEach(url => {
                                imagesCount += 1;
                                imagesElements = imagesElements + `<img src="${url}" draggable="false">`;
                                imagesElementsDots = imagesElementsDots + `<div class="thumbnail ${imagesCount == 1 ? 'active' : ''}"></div>`;
                            });
                        }

                        let newShellHTML = `
                            <div class="${tagClasses}">
                                <div class="tags">${tagElements}</div>
                                <p>${data.label}</p>
                                <div class="gallery-container">
                                    ${imagesCount >= 1 ? `<button class="prev"><i class="fa-solid fa-angle-left"></i></button>` : ''}

                                    <div class="gallery-wrapper">
                                        <div class="gallery">
                                            ${imagesCount >= 1 ? imagesElements : ''}
                                        </div>
                                        ${imagesCount >= 1 ? `<div class="thumbnails">${imagesElementsDots}</div>` : ''}
                                    </div>

                                    ${imagesCount >= 1 ? `<button class="next"><i class="fa-solid fa-angle-right"></i></button>` : ''}
                                </div>
                                <div class="buttons">
                                    <div id="select-shell" data-shell="${name}">
                                        <i class="fa-solid fa-check"></i>
                                        <span>${translation['button.select']}</span>
                                    </div>
                                    <div id="preview-shell" data-shell="${name}">
                                        <i class="fa-solid fa-eye"></i>
                                        <span>${translation['button.preview']}</span>
                                    </div>
                                </div>
                            </div>
                        `;

                        const newElement = $(newShellHTML);
                        $('.housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>#shells-list').append(newElement);
                        
                        newElement.find('.gallery-container').each(function () {
                            initGallery($(this));
                        });
                    }

                } else if (vals.type == 'load-ipls') {
                    $('.housing_creator div[data-type="new-ipl"]>div>.side-boxes>.box>#ipls-list').empty();

                    this.AvailableIPLS = vals.AvailableIPLS

                    for (const [name, label] of Object.entries(config.iplsTags)) {
                        $('.housing_creator div[data-type="new-ipl"]>div>.side-boxes>.box>.text .tags').append(`<div data-tag="${name}">${label}</div>`);
                    }
                
                    for (const [name, data] of Object.entries(this.AvailableIPLS)) {
                        let tagClasses = '';
                        let tagElements = '';
                        if (data.tags && data.tags.length >= 1) {
                            data.tags.forEach(tag => {
                                tagClasses = tagClasses + `tag-${tag} `;
                                if (config.iplsTags[tag]) tagElements = tagElements + `<div>${config.iplsTags[tag]}</div>`;
                            });
                        }
                        
                        let imagesCount = 0;
                        let imagesElements = '';
                        let imagesElementsDots = '';
                        if (data.images && data.images.length >= 1) {
                            data.images.forEach(url => {
                                imagesCount += 1;
                                imagesElements = imagesElements + `<img src="${url}" draggable="false">`;
                                imagesElementsDots = imagesElementsDots + `<div class="thumbnail ${imagesCount == 1 ? 'active' : ''}"></div>`;
                            });
                        }

                        let newIplHTML = `
                            <div class="${tagClasses}">
                                <div class="tags">${tagElements}</div>
                                <p>${data.label}</p>
                                <div class="gallery-container">
                                    ${imagesCount >= 1 ? `<button class="prev"><i class="fa-solid fa-angle-left"></i></button>` : ''}
                                    <div class="gallery-wrapper">
                                        <div class="gallery">
                                            ${imagesCount >= 1 ? imagesElements : ''}
                                        </div>
                                        ${imagesCount >= 1 ? `<div class="thumbnails">${imagesElementsDots}</div>` : ''}
                                    </div>
                                    ${imagesCount >= 1 ? `<button class="next"><i class="fa-solid fa-angle-right"></i></button>` : ''}
                                </div>
                                <div class="buttons">
                                    <div id="select-ipl" data-ipl="${name}">
                                        <i class="fa-solid fa-check"></i>
                                        <span>${translation['button.select']}</span>
                                    </div>
                                    <div id="preview-ipl" data-ipl="${name}">
                                        <i class="fa-solid fa-eye"></i>
                                        <span>${translation['button.preview']}</span>
                                    </div>
                                </div>
                            </div>
                        `;

                        const newElement = $(newIplHTML);
                        $('.housing_creator div[data-type="new-ipl"]>div>.side-boxes>.box>#ipls-list').append(newElement);
                        
                        newElement.find('.gallery-container').each(function () {
                            initGallery($(this));
                        });
                    }

                } else if (vals.type == 'new-shell') {
                    $('.housing_creator div[data-type="new-shell"] > div > .side-boxes > .box > .text .tags > div').removeClass('active');
                    $('.housing_creator div[data-type="new-shell"] > div > .side-boxes > .box > .text .tags > div[data-tag="default"]').addClass('active');
                    $('.housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>#shells-list > div').show();

                } else if (vals.type == 'new-ipl') {
                    $('.housing_creator div[data-type="new-ipl"] > div > .side-boxes > .box > .text .tags > div').removeClass('active');
                    $('.housing_creator div[data-type="new-ipl"] > div > .side-boxes > .box > .text .tags > div[data-tag="default"]').addClass('active');
                    $('.housing_creator div[data-type="new-ipl"]>div>.side-boxes>.box>#ipl-list > div').show();

                } else if (vals.type == 'configuration-mlo') {
                    HousingCreator.ConfigurationMLO();

                } else if (vals.type == 'configuration-building') {
                    HousingCreator.ConfigurationBuilding();

                } else if (vals.type == 'configuration-motel') {
                    HousingCreator.ConfigurationMotel();
                    
                } else if (vals.type == 'create-new-shell') {
                    HousingCreator.ResetCreatingNewShell();

                } else if (vals.type == 'update-input-value') {
                    if (vals.creatorType) {
                        let value = vals.value;
                        $(`.housing_creator div[data-type="${vals.creatorType}"]>div>.side-boxes>.box > .options .mt-2 > input[name="${vals.creatorInput}-${vals.inputName}"]`).val(value).trigger('change')
                    } else {
                        $(`.housing_creator div[data-type="configuration-${vals.housingType}"]>div>.side-boxes>.box > .options .mt-2 > input[name="${vals.housingType}-${vals.inputName}"]`).val(vals.value).trigger('change')
                    }
                } else if (vals.type == 'update-image') {
                    HousingCreator.CloseModal();
                    if (vals.url) {
                        $(`.housing_creator div[data-type="configuration-${vals.housingType}"] .images-list #add-image[data-image-id="${vals.imageId}"] .img`).css('background-image', `url(${vals.url})`);
                    } else {
                        $(`.housing_creator div[data-type="configuration-${vals.housingType}"] .images-list #add-image[data-image-id="${vals.imageId}"] .img`).css('background-image', 'none');
                    }
                    $(`.housing_creator div[data-type="configuration-${vals.housingType}"] .images-list #add-image[data-image-id="${vals.imageId}"] > i`).css('opacity', vals.url ? '0.0' : '1.0');
                    
                } else if (vals.type == 'update-doors-list') {
                    let doorsHTML = '';
                    if (vals.value && Object.keys(vals.value).length) {
                        for (const [doorId, doorData] of Object.entries(vals.value)) {
                            let doorIdentifier = Number(doorId) + 1
                            doorsHTML += `
                                <div class="mt-2">
                                    <i>#${doorIdentifier}</i>
                                    <input type="text" name="mlo-door-${doorIdentifier}" disabled value="${
                                        doorData.type == 'double' && translation.creator.configuration_mlo['option:door.double_door'] ||
                                        doorData.type == 'slide_gate' && translation.creator.configuration_mlo['option:door.slide_gate'] ||
                                        translation.creator.configuration_mlo['option:door.single_door']
                                    } (${doorData.type == 'slide_gate' && (doorData.distance || 8.5) || (doorData.distance || 1.5)}m)" style="width: 14em;">
                                    <div class="button ${doorData.hasDoorbell ? 'doorbellActive' : 'doorbellInactive'}" data-button-action="mlo-toggle_doorbell" data-door-id="${doorIdentifier}">
                                        <i class="fa-solid fa-bell"></i>
                                    </div>
                                    <div class="button" onclick="HousingCreator.TeleportToDoor('${doorIdentifier}')">
                                        <i class="fa-solid fa-street-view"></i>
                                    </div>
                                    <div class="button" data-button-action="mlo-remove_door" data-door-id="${doorIdentifier}">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </div>
                                </div>
                            `
                        }
                    }
                    $('.housing_creator div[data-type="configuration-mlo"]>div>.side-boxes>.box>.options .mlo-doors>.doors-list').html(doorsHTML);
                } else if (vals.type == 'update-interactions-list') {
                    let interactionsHTML = '';
                    if (vals.value && Object.keys(vals.value).length) {
                        for (const [id, _] of Object.entries(vals.value)) {
                            let interactionId = Number(id) + 1
                            interactionsHTML += `
                                <div class="mt-2">
                                    <i>#${interactionId}</i>
                                    <input type="text" name="create-shell-interaction_${interactionId}" disabled value="${'Interaction'}" style="width: 21.2em;">
                                    <div class="button" data-button-action="create-shell-modify_interaction" data-interaction-id="${interactionId}">
                                        <i class="fa-solid fa-gear"></i>
                                    </div>
                                    <div class="button" data-button-action="create-shell-remove_interaction" data-interaction-id="${interactionId}">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </div>
                                </div>
                            `
                        }
                    }
                    $('.housing_creator div[data-type="create-new-shell"] > div > .side-boxes > .box > .options .static-interactions > .interaction-list').html(interactionsHTML);
                    $('.housing_creator textarea[name="create-shell-interactions--temp"]').val(JSON.stringify(vals.value));
                    checkCreateShellInputs();

                }
            }

            if (vals.type == 'show-menu') {
                $('.housing_creator').fadeIn(120);
            } else if (vals.type == 'hide-menu') {
                $(`.housing_creator`).fadeOut(120)
            }
        }
    },

    LoadMenu: function () {
        selectedSection = null;
        let firstMenu = null;
        let sideBarHTML = ``;

        if (this.IsRealEstate) {
            sideBarHTML += `<span id="general"><span>${translation.realestate.side_menu['section:general']}</span> <div class="separator"></div></span>`
            if (this.HasPermission('PropertyAccess')) {
                firstMenu = 'company-properties';
                sideBarHTML += `
                    <li class="element" data-href="company-properties">
                        <i class="fa-solid fa-house-chimney"></i>
                        <p class="label">${ translation.realestate.side_menu['option:company_properties'] }</p>
                    </li>
                `
            }
            if (this.HasPermission('BossMenuAccess')) {
                sideBarHTML += `
                    <li class="element" data-href="agency-bossmenu">
                        <i class="fa-solid fa-suitcase"></i>
                        <p class="label">${ translation.realestate.side_menu['option:bossmenu'] }</p>
                    </li>
                `
            }

        } else {
            sideBarHTML += `<span id="general"><span>${translation.creator.side_menu['section:general']}</span> <div class="separator"></div></span>`

            if (this.HasPermission('Property:Create')) {
                firstMenu = 'new';
                sideBarHTML += `
                    <li class="element" data-href="new">
                        <i class="fa-solid fa-house-chimney-medical"></i>
                        <p class="label">${ translation.creator.side_menu['option:create'] }</p>
                    </li>
                `
            }
            if (this.HasPermission('Property:Teleport') || this.HasPermission('Property:Edit') || this.HasPermission('Property:Delete')) {
                if (!firstMenu) firstMenu = 'all-properties';
                sideBarHTML += `
                    <li class="element" data-href="all-properties">
                        <i class="fa-solid fa-house"></i>
                        <p class="label">${ translation.creator.side_menu['option:all_properties'] }</p>
                    </li>
                `
            }
            if (this.HasPermission('Furniture:Create') || this.HasPermission('Furniture:Edit') || this.HasPermission('Furniture:Delete')) {
                if (!firstMenu) firstMenu = 'all-furniture';
                sideBarHTML += `
                    <li class="element" data-href="all-furniture">
                        <i class="fa-solid fa-chair"></i>
                        <p class="label">${ translation.creator.side_menu['option:all_furniture'] }</p>
                    </li>
                `
            }
            if (this.HasPermission('CreateNewShell')) {
                if (!firstMenu) firstMenu = 'create-new-shell';
                sideBarHTML += `
                    <li class="element" data-href="create-new-shell">
                        <i class="fa-solid fa-cube"></i>
                        <p class="label">${ translation.creator.side_menu['option:create_new_shell'] }</p>
                    </li>
                `
            }
            
        }
        $('.housing_creator .menu > ul.side-bar').html(sideBarHTML);

        updateSection('.housing_creator', firstMenu, `.housing_creator li[data-href="${firstMenu}"]`);
        $('.housing_creator').fadeIn(120);
    },


    ResetShell: function () {
        this.IsModifyingExisting = false;
        this.ModifyingIdentifier = null;
        
        $(`
            .inp-cbx[data-toggle="shell-building"],
            .inp-cbx[data-toggle="shell-motel"],

            .inp-cbx[data-toggle="shell-purchase_price"],
            .inp-cbx[data-toggle="shell-rent_price"],

            .inp-cbx[data-toggle="shell-__garage"],
            .inp-cbx[data-toggle="shell-__parking"],
            
            .inp-cbx[data-toggle="shell-delivery_inside"],
            .inp-cbx[data-toggle="shell-delivery_outside"],

            .inp-cbx[data-toggle="shell-power_box"],

            .inp-cbx[data-toggle="shell-emergency_exit"],
            
            .inp-cbx[data-toggle="shell-furniture_environment_inside"],
            .inp-cbx[data-toggle="shell-furniture_environment_outside"],
            
            .inp-cbx[data-toggle="shell-grass"],
            
            .inp-cbx[data-toggle="shell-sign"],

            .inp-cbx[data-toggle="shell-wardrobe"],
            .inp-cbx[data-toggle="shell-storage"],
            
            .inp-cbx[data-toggle="shell-keys_limit"],
            .inp-cbx[data-toggle="shell-permissions_limit"]
        `).prop('checked', false);

        $(`
            input[name="shell-purchase_price"],
            input[name="shell-rent_price"],

            .housing_creator div[data-type="configuration-shell"] .shell-building > .mt-2 > select,
            .housing_creator div[data-type="configuration-shell"] .shell-motel > .mt-2 > select,

            .housing_creator div[data-type="configuration-shell"] .shell-storage .metadata-elements > input[name="metadata-slots-value"],
            .housing_creator div[data-type="configuration-shell"] .shell-storage .metadata-elements > input[name="metadata-weight-value"],
            
            .housing_creator div[data-type="configuration-shell"] input[name="shell-keys_limit_count"],
            .housing_creator div[data-type="configuration-shell"] input[name="shell-permissions_limit_count"]
        `).prop('disabled', true);

        $(`
            .housing_creator div[data-type="configuration-shell"] .shell-building > .mt-2 > select,
            .housing_creator div[data-type="configuration-shell"] .shell-motel > .mt-2 > select
        `).prop('selectedIndex', 0).trigger('change');

        $(`
            input[name="shell-address"],
            input[name="shell-region"],
            input[name="shell-house_name"],
            textarea[name="shell-house_description"],
            input[name="shell-purchase_price"],
            input[name="shell-rent_price"],
            input[name="shell-name"],
            input[name="shell-position"],
            input[name="shell-yard_zone"],
            input[name="shell-enter_point"],
            input[name="shell-exit_point"],
            input[name="shell-power_box_coordinates"],
            input[name="shell-emergency_exit_outside"],
            input[name="shell-emergency_exit_inside"],
            input[name="shell-garage_point"],
            input[name="shell-delivery_coordinates"],
            input[name="shell-grass_coords"],
            input[name="shell-sign_point"],
            input[name="shell-wardrobe_point"],
            input[name="shell-storage_point"],
            .housing_creator div[data-type="configuration-shell"] .shell-storage .metadata-elements > input[name="metadata-slots-value"],
            .housing_creator div[data-type="configuration-shell"] .shell-storage .metadata-elements > input[name="metadata-weight-value"],
            input[name="shell-keys_limit_count"],
            input[name="shell-permissions_limit_count"]
        `).val('');

        $('.housing_creator div[data-type="configuration-shell"] .images-list #add-image > i').css('opacity', '1.0');
        $('.housing_creator div[data-type="configuration-shell"] .images-list .img').css('background-image', 'none');
        
        $(`.housing_creator div[data-type="configuration-shell"] .shell-parking_space`).hide();
    },

    ResetIPL: function () {
        this.IsModifyingExisting = false;
        this.ModifyingIdentifier = null;

        $(`
            .inp-cbx[data-toggle="ipl-building"],
            .inp-cbx[data-toggle="ipl-motel"],

            .inp-cbx[data-toggle="ipl-purchase_price"],
            .inp-cbx[data-toggle="ipl-rent_price"],

            .inp-cbx[data-toggle="ipl-__theme_purchase_change"],
            .inp-cbx[data-toggle="ipl-__theme_purchased_change"],

            .inp-cbx[data-toggle="ipl-__garage"],
            .inp-cbx[data-toggle="ipl-__parking"],
            
            .inp-cbx[data-toggle="ipl-delivery_inside"],
            .inp-cbx[data-toggle="ipl-delivery_outside"],
            
            .inp-cbx[data-toggle="ipl-power_box"],
            
            .inp-cbx[data-toggle="ipl-furniture_environment_inside"],
            .inp-cbx[data-toggle="ipl-furniture_environment_outside"],
            
            .inp-cbx[data-toggle="ipl-grass"],

            .inp-cbx[data-toggle="ipl-sign"],

            .inp-cbx[data-toggle="ipl-wardrobe"],
            .inp-cbx[data-toggle="ipl-storage"],
            
            .inp-cbx[data-toggle="ipl-keys_limit"],
            .inp-cbx[data-toggle="ipl-permissions_limit"]
        `).prop('checked', false);

        $(`
            input[name="ipl-purchase_price"],
            input[name="ipl-rent_price"],

            .housing_creator div[data-type="configuration-ipl"] .ipl-building > .mt-2 > select,
            .housing_creator div[data-type="configuration-ipl"] .ipl-motel > .mt-2 > select,

            .housing_creator div[data-type="configuration-ipl"] .ipl-theme > .mt-2 > select,

            .housing_creator div[data-type="configuration-ipl"] .ipl-storage .metadata-elements > input[name="metadata-slots-value"],
            .housing_creator div[data-type="configuration-ipl"] .ipl-storage .metadata-elements > input[name="metadata-weight-value"],

            .housing_creator div[data-type="configuration-ipl"] input[name="ipl-keys_limit_count"],
            .housing_creator div[data-type="configuration-ipl"] input[name="ipl-permissions_limit_count"]
        `).prop('disabled', true);

        $(`
            .housing_creator div[data-type="configuration-ipl"] .ipl-building > .mt-2 > select,
            .housing_creator div[data-type="configuration-ipl"] .ipl-motel > .mt-2 > select,
            .housing_creator div[data-type="configuration-ipl"] .ipl-theme > .mt-2 > select
        `).prop('selectedIndex', 0).trigger('change');

        $(`
            input[name="ipl-address"],
            input[name="ipl-region"],
            input[name="ipl-house_name"],
            textarea[name="ipl-house_description"],
            input[name="ipl-purchase_price"],
            input[name="ipl-rent_price"],
            input[name="ipl-name"],
            input[name="ipl-yard_zone"],
            input[name="ipl-enter_point"],
            input[name="ipl-exit_point"],
            input[name="ipl-power_box_coordinates"],
            input[name="ipl-garage_point"],
            input[name="ipl-delivery_coordinates"],
            input[name="ipl-grass_coords"],
            input[name="ipl-sign_point"],
            input[name="ipl-wardrobe_point"],
            input[name="ipl-storage_point"],
            .housing_creator div[data-type="configuration-ipl"] .ipl-storage .metadata-elements > input[name="metadata-slots-value"],
            .housing_creator div[data-type="configuration-ipl"] .ipl-storage .metadata-elements > input[name="metadata-weight-value"],
            input[name="ipl-keys_limit_count"],
            input[name="ipl-permissions_limit_count"]
        `).val('');

        $('.housing_creator div[data-type="configuration-ipl"] .images-list #add-image > i').css('opacity', '1.0');
        $('.housing_creator div[data-type="configuration-ipl"] .images-list .img').css('background-image', 'none');

        $(`.housing_creator div[data-type="configuration-ipl"] .ipl-parking_space`).hide();
    },

    ResetMLO: function () {
        this.IsModifyingExisting = false;
        this.ModifyingIdentifier = null;

        $(`
            .inp-cbx[data-toggle="mlo-motel"],

            .inp-cbx[data-toggle="mlo-purchase_price"],
            .inp-cbx[data-toggle="mlo-rent_price"],

            .inp-cbx[data-toggle="mlo-__garage"],
            .inp-cbx[data-toggle="mlo-__parking"],
            
            .inp-cbx[data-toggle="mlo-delivery_inside"],
            .inp-cbx[data-toggle="mlo-delivery_outside"],
            
            .inp-cbx[data-toggle="mlo-furniture_environment_inside"],
            .inp-cbx[data-toggle="mlo-furniture_environment_outside"],
            
            .inp-cbx[data-toggle="mlo-grass"],

            .inp-cbx[data-toggle="mlo-sign"],

            .inp-cbx[data-toggle="mlo-wardrobe"],
            .inp-cbx[data-toggle="mlo-storage"],
            
            .inp-cbx[data-toggle="mlo-keys_limit"],
            .inp-cbx[data-toggle="mlo-permissions_limit"]
        `).prop('checked', false);

        $(`
            input[name="mlo-purchase_price"],
            input[name="mlo-rent_price"],

            .housing_creator div[data-type="configuration-mlo"] .mlo-motel > .mt-2 > select,

            .housing_creator div[data-type="configuration-mlo"] .mlo-storage .metadata-elements > input[name="metadata-slots-value"],
            .housing_creator div[data-type="configuration-mlo"] .mlo-storage .metadata-elements > input[name="metadata-weight-value"],

            .housing_creator div[data-type="configuration-mlo"] input[name="mlo-keys_limit_count"],
            .housing_creator div[data-type="configuration-mlo"] input[name="mlo-permissions_limit_count"]
        `).prop('disabled', true);

        $(`
            .housing_creator div[data-type="configuration-mlo"] .mlo-motel > .mt-2 > select
        `).prop('selectedIndex', 0).trigger('change');

        $(`
            input[name="mlo-address"],
            input[name="mlo-region"],
            input[name="mlo-house_name"],
            textarea[name="mlo-house_description"],
            input[name="mlo-purchase_price"],
            input[name="mlo-rent_price"],
            input[name="mlo-yard_zone"],
            input[name="mlo-interior_zone"],
            input[name="mlo-menu_point"],
            input[name="mlo-garage_point"],
            input[name="mlo-delivery_coordinates"],
            input[name="mlo-grass_coords"],
            input[name="mlo-sign_point"],
            input[name="mlo-wardrobe_point"],
            input[name="mlo-storage_point"],
            input[name="mlo-keys_limit_count"],
            input[name="mlo-permissions_limit_count"]
        `).val('');
        
        $(`.housing_creator div[data-type="configuration-mlo"] .mlo-storage .metadata-elements > input[name="metadata-slots-value"]`).val('');
        $(`.housing_creator div[data-type="configuration-mlo"] .mlo-storage .metadata-elements > input[name="metadata-weight-value"]`).val('');
        
        $(`.housing_creator div[data-type="configuration-mlo"] .mlo-doors > .doors-list`).empty();

        $('.housing_creator div[data-type="configuration-mlo"] .images-list #add-image > i').css('opacity', '1.0');
        $('.housing_creator div[data-type="configuration-mlo"] .images-list .img').css('background-image', 'none');

        $(`.housing_creator div[data-type="configuration-mlo"] .mlo-parking_space`).hide();
    },

    ResetBuilding: function () {
        this.IsModifyingExisting = false;
        this.ModifyingIdentifier = null;
        
        $(`
            .inp-cbx[data-toggle="building-__underground_parking"]
        `).prop('checked', false);

        $(`
            input[name="building-underground_parking_floors"]
        `).prop('disabled', true);

        $(`
            input[name="building-address"],
            input[name="building-region"],
            input[name="building-name"],
            input[name="building-yard_zone"],
            input[name="building-enter_point"],
            input[name="building-exit_point"],
            input[name="building-enter_garage_point"],
            input[name="building-underground_parking_floors"]
        `).val('');
    },

    ResetMotel: function () {
        this.IsModifyingExisting = false;
        this.ModifyingIdentifier = null;

        $(`
            .inp-cbx[data-toggle="motel-reception"]
        `).prop('checked', false);

        $(`
            input[name="motel-address"],
            input[name="motel-region"],
            input[name="motel-name"],
            input[name="motel-yard_zone"],
            input[name="motel-reception_point"]
        `).val('');
    },


    ConfigurationShell: function (shellName) {
        this.ResetShell();

        $('.housing_creator div[data-type="configuration-shell"] .text > div > .delete').hide();
        $(`.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box > .options .mt-2 > input[name="shell-name"]`).val(shellName)

        $.post(`https://${GetParentResourceName()}/creator:getAllBuildings`, JSON.stringify({}), (response) => {
            $('.housing_creator div[data-type="configuration-shell"] .shell-building > .mt-2').html(`<select></select>`);
            $('.housing_creator div[data-type="configuration-shell"] .shell-motel > .mt-2').html(`<select></select>`);

            let buildings = [{
                id: 0,
                text: translation.select_menu.select_option,
                disabled: true,
                selected: true
            }];

            for (const [name, data] of Object.entries(response.buildings)) {
                buildings.push({
                    id: data.id,
                    text: data.label,
                    isMenuBuilding: data.isMenuBuilding
                });
            }
            
            $('.housing_creator div[data-type="configuration-shell"] .shell-building > .mt-2 > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: buildings
            }).prop('disabled', true);

            let motels = [{
                id: 0,
                text: translation.select_menu.select_option,
                disabled: true,
                selected: true
            }];

            for (const [name, data] of Object.entries(response.motels)) {
                motels.push({
                    id: data.id,
                    text: data.label,
                });
            }
            
            $('.housing_creator div[data-type="configuration-shell"] .shell-motel > .mt-2 > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: motels
            }).prop('disabled', true);
        });
        
        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'shell',
            action: 'address'
        }));
        
        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'shell',
            action: 'region'
        }));
    },

    ConfigurationIPL: function (iplName) {
        this.ResetIPL();

        $('.housing_creator div[data-type="configuration-ipl"] .text > div > .delete').hide();
        $(`.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box > .options .mt-2 > input[name="ipl-name"]`).val(iplName)

        $.post(`https://${GetParentResourceName()}/creator:getAllBuildings`, JSON.stringify({}), (response) => {
            $('.housing_creator div[data-type="configuration-ipl"] .ipl-building > .mt-2').html(`<select></select>`);
            $('.housing_creator div[data-type="configuration-ipl"] .ipl-motel > .mt-2').html(`<select></select>`);

            let buildings = [{
                id: 0,
                text: translation.select_menu.select_option,
                disabled: true,
                selected: true
            }];

            for (const [name, data] of Object.entries(response.buildings)) {
                buildings.push({
                    id: data.id,
                    text: data.label,
                    isMenuBuilding: data.isMenuBuilding
                });
            }
            
            $('.housing_creator div[data-type="configuration-ipl"] .ipl-building > .mt-2 > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: buildings
            }).prop('disabled', true);

            let motels = [{
                id: 0,
                text: translation.select_menu.select_option,
                disabled: true,
                selected: true
            }];

            for (const [name, data] of Object.entries(response.motels)) {
                motels.push({
                    id: data.id,
                    text: data.label,
                });
            }
            
            $('.housing_creator div[data-type="configuration-ipl"] .ipl-motel > .mt-2 > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: motels
            }).prop('disabled', true);
        });

        $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme > .mt-2').html(`<select></select>`);
        let iplThemes = [{
            id: 0,
            text: translation.select_menu.select_option,
            disabled: true,
            selected: true
        }];
        let iplThemesSelect = {
            minimumResultsForSearch: Infinity,
            allowClear: false,
            data: iplThemes,
            disabled: false
        }
        if (this.AvailableIPLS[iplName].settings.Themes) {
            for (const [name, data] of Object.entries(this.AvailableIPLS[iplName].settings.Themes)) {
                iplThemes.push({
                    id: name,
                    text: data.label
                });
            }
            $(`
                label[for="ipl-__theme_purchase_change"],
                input[data-toggle="ipl-__theme_purchase_change"],

                label[for="ipl-__theme_purchased_change"],
                input[data-toggle="ipl-__theme_purchased_change"]
            `).removeClass('not-allowed');
        } else {
            iplThemesSelect.disabled = true;
            $(`
                label[for="ipl-__theme_purchase_change"],
                input[data-toggle="ipl-__theme_purchase_change"],

                label[for="ipl-__theme_purchased_change"],
                input[data-toggle="ipl-__theme_purchased_change"]
            `).addClass('not-allowed');
        }
        $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme > .mt-2 > select').select2(iplThemesSelect);

        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'ipl',
            action: 'address'
        }));
        
        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'ipl',
            action: 'region'
        }));
    },
    
    ConfigurationMLO: function () {
        this.ResetMLO();

        $('.housing_creator div[data-type="configuration-mlo"] .text > div > .delete').hide();

        $.post(`https://${GetParentResourceName()}/creator:getAllBuildings`, JSON.stringify({}), (response) => {
            $('.housing_creator div[data-type="configuration-mlo"] .mlo-motel > .mt-2').html(`<select></select>`);

            let motels = [{
                id: 0,
                text: translation.select_menu.select_option,
                disabled: true,
                selected: true
            }];

            for (const [name, data] of Object.entries(response.motels)) {
                motels.push({
                    id: data.id,
                    text: data.label,
                });
            }
            
            $('.housing_creator div[data-type="configuration-mlo"] .mlo-motel > .mt-2 > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: motels
            }).prop('disabled', true);
        });
        
        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'mlo',
            action: 'address'
        }));
        
        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'mlo',
            action: 'region'
        }));
    },

    ConfigurationBuilding: function () {
        this.ResetBuilding();

        $('.housing_creator div[data-type="configuration-building"] .text > div > .delete').hide();

        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'building',
            action: 'address'
        }));
        
        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'building',
            action: 'region'
        }));
    },

    ConfigurationMotel: function () {
        this.ResetMotel();

        $('.housing_creator div[data-type="configuration-motel"] .text > div > .delete').hide();
        
        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'motel',
            action: 'address'
        }));
        
        $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
            type: 'motel',
            action: 'region'
        }));
    },


    ResetCreatingNewShell: function () {
        $('.housing_creator div[data-type="create-new-shell"] input[name="create-shell-model"]').val('').prop('disabled', false);
        $('.housing_creator div[data-type="create-new-shell"] input[name="create-shell-label"]').val('').prop('disabled', true);
        $('.housing_creator div[data-type="create-new-shell"] input[name="create-shell-rooms"]').val('0').prop('disabled', true);
        $('.housing_creator div[data-type="create-new-shell"] input[name="create-shell-doors"]').val('{}');

        $('.housing_creator div[data-type="create-new-shell"] .door-point .button').addClass('not-allowed');
        $('.housing_creator div[data-type="create-new-shell"] #tags .mt-4 > div').removeClass('active').addClass('not-allowed');
        $('.housing_creator div[data-type="create-new-shell"] .static-interactions .button[data-button-action="create-shell-add_interaction"]').addClass('not-allowed');
        $('.housing_creator textarea[name="create-shell-interactions--temp"]').val('');

        $('.housing_creator div[data-type="create-new-shell"]>div>.side-boxes>.box>.options .static-interactions .interaction-list').empty();

        $('.housing_creator div[data-type="create-new-shell"] > div > .side-boxes > .box > .options > .configuration-file > textarea').val((CreatorShellTemplate).format(
            '',
            '',
            '',
            '',
            '0',
            '{}',
            '{}'
        ).split('\n').slice(1).join('\n'))
    },

    LoadedConfigurationShell: function() {
        $('.housing_creator div[data-type="create-new-shell"] input[name="create-shell-model"]').prop('disabled', true);
        $('.housing_creator div[data-type="create-new-shell"] input[name="create-shell-label"]').prop('disabled', false)
        $('.housing_creator div[data-type="create-new-shell"] input[name="create-shell-rooms"]').prop('disabled', false)
        $('.housing_creator div[data-type="create-new-shell"] .door-point .button').removeClass('not-allowed');

        $('.housing_creator div[data-type="create-new-shell"] .static-interactions .button[data-button-action="create-shell-add_interaction"]').removeClass('not-allowed');
        
        $('.housing_creator div[data-type="create-new-shell"] #tags .mt-4 > div').removeClass('not-allowed');
    },

    ModifyInteraction: function(data) {
        $('.housing_creator .menu #modify-interaction .buttons').html(`
            <div class="button" data-button-action="create-shell-create_sink_action_1" data-interaction-id="${data.data.interactionId}">
                Drink Water (Sink)
            </div>
            <div class="button" data-button-action="create-shell-create_sink_action_2" data-interaction-id="${data.data.interactionId}">
                Wash your hands (Sink)
            </div>
            <div class="button" data-button-action="create-shell-create_shower" data-interaction-id="${data.data.interactionId}">
                Shower
            </div>
        `);
        $('.housing_creator .menu #modify-interaction').fadeIn(120);
        
        let interactionsHTML = ''
        for (const [key, val] of Object.entries(data.data.interactions.options)) {
            if (val.type == 'sink_drink') {
                $('.housing_creator .menu #modify-interaction .buttons > .button[data-button-action="create-shell-create_sink_action_1"]').addClass('not-allowed');
            } else if (val.type == 'sink') {
                $('.housing_creator .menu #modify-interaction .buttons > .button[data-button-action="create-shell-create_sink_action_2"]').addClass('not-allowed');
            } else if (val.type == 'shower') {
                $('.housing_creator .menu #modify-interaction .buttons > .button[data-button-action="create-shell-create_shower"]').addClass('not-allowed');
            }

            interactionsHTML += `
                <div class="mt-2">
                    <i>#${Number(key) + 1}</i>
                    <input type="text" disabled value="${val.type}">
                    <div class="button" data-button-action="create-shell-remove_interaction_option" data-interaction-id="${data.data.interactionId}" data-option-id="${Number(key) + 1}">
                        <i class="fa-solid fa-trash-can"></i>
                    </div>
                </div>
            `
        }
        $('.housing_creator .menu #modify-interaction .data').html(interactionsHTML);
        $('.housing_creator textarea[name="create-shell-interactions--temp"]').val(JSON.stringify(data.data.interactableCode));

        checkCreateShellInputs();
    },

    
    TeleportToProperty: function (id) {
        $.post(`https://${GetParentResourceName()}/creator:teleportToProperty`, JSON.stringify({id:id}));
    },

    TeleportToDoor: function (id) {
        $.post(`https://${GetParentResourceName()}/creator:teleportToDoors`, JSON.stringify({id: id}));
    },

    RemoveOwner: function (id) {
        $.post(`https://${GetParentResourceName()}/creator:removeOwner`, JSON.stringify({id: id}));
    },

    RemoveRenter: function (id) {
        $.post(`https://${GetParentResourceName()}/creator:removeRenter`, JSON.stringify({id: id}));
    },
    
    EditHouse: function (id) {
        let house = null;
        
        for (const item of this.Pagination.Array) {
            if (item.id == id) {
                house = item;
                break;
            }
        }

        if (!house) return;

        $.post(`https://${GetParentResourceName()}/creator:loadPropertyConfig`, JSON.stringify({id:id}));

        updateSection('.housing_creator', `configuration-${house.type}`);

        $(`.housing_creator div[data-type="configuration-${house.type}"] .text .button.save`).addClass('allowed');
        $(`.housing_creator div[data-type="configuration-${house.type}"] .text .button.delete`).show();
        if (!this.HasPermission('Property:Delete')) $(`.housing_creator div[data-type="configuration-${house.type}"] .text .button.delete`).hide();

        if (house.type == 'shell') {
            this.IsModifyingExisting = true;
            this.ModifyingIdentifier = house.id;
                        
            $('.housing_creator div[data-type="configuration-shell"] input[name="shell-name"]').val(house.metadata.shell);
            $('.housing_creator div[data-type="configuration-shell"] input[name="shell-address"]').val(house.address);
            $('.housing_creator div[data-type="configuration-shell"] input[name="shell-region"]').val(house.region);
            $('.housing_creator div[data-type="configuration-shell"] input[name="shell-house_name"]').val(house.name);
            $('.housing_creator div[data-type="configuration-shell"] input[name="shell-position"]').val(JSON.stringify(house.metadata.shellPosition));
            $('.housing_creator div[data-type="configuration-shell"] textarea[name="shell-house_description"]').val(house.description);
            $('.housing_creator div[data-type="configuration-shell"] input[name="shell-yard_zone"]').val(JSON.stringify(house.metadata.zone));
            $('.housing_creator div[data-type="configuration-shell"] input[name="shell-enter_point"]').val(JSON.stringify(house.metadata.enter));
            $('.housing_creator div[data-type="configuration-shell"] input[name="shell-exit_point"]').val(JSON.stringify(house.metadata.exit));

            $.post(`https://${GetParentResourceName()}/creator:getAllBuildings`, JSON.stringify({}), (response) => {
                $('.housing_creator div[data-type="configuration-shell"] .shell-building > .mt-2').html(`<select></select>`);
                $('.housing_creator div[data-type="configuration-shell"] .shell-motel > .mt-2').html(`<select></select>`);

                let buildings = [{
                    id: 0,
                    text: translation.select_menu.select_option,
                    disabled: true,
                    selected: house.object_id === undefined
                }];

                let isBuilding = false
                for (const [name, data] of Object.entries(response.buildings)) {
                    buildings.push({
                        id: data.id,
                        text: data.label,
                        isMenuBuilding: data.isMenuBuilding,
                        selected: house.object_id === data.id
                    });
                    if (house.object_id === data.id) isBuilding = true;
                }
    
                $('.housing_creator div[data-type="configuration-shell"] .shell-building > .mt-2 > select').select2({
                    minimumResultsForSearch: Infinity,
                    allowClear: false,
                    data: buildings
                }).prop('disabled', !isBuilding);
                $('.inp-cbx[data-toggle="shell-building"]').prop('checked', isBuilding);

                if (isBuilding && usingVMSGarages) {
                    $.post(`https://${GetParentResourceName()}/creator:getBuildingParking`, JSON.stringify({ id: house.object_id }), function (parking) {
                        if (parking) {
                            HousingCreator.BuildingParkingId = house.object_id;
                            HousingCreator.BuildingParking = parking;
                            let parkingFloors = 0;
                            let parkingFloorsHTML = '';
                            for (const [floor, _] of Object.entries(HousingCreator.BuildingParking)) {
                                parkingFloors += 1;
                                parkingFloorsHTML += `<div data-floor="${floor}" ${floor === "1" ? 'class="active"': ''}>${(translation.creator.configuration_shell['option:label.parking_space_floor']).format(floor)}</div>`;
                            }
                            $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-floors').html(parkingFloorsHTML).css('grid-template-columns', `repeat(${parkingFloors}, 1fr)`);

                            let parkingSpacesHTML = '';
                            for (let i=1; i <= 38; i++) {
                                const inputId = `shell-parking_space_${i}`;

                                const parkingOwner = HousingCreator.BuildingParking["1"][String(i)];
                                const isBlocked = (HousingCreator.ModifyingIdentifier && parkingOwner && parkingOwner !== HousingCreator.ModifyingIdentifier);

                                parkingSpacesHTML += `
                                    <div class="checkbox-wrapper-46 ${isBlocked ? 'not-allowed' : ''}">
                                        <input
                                            type="checkbox"
                                            id="${inputId}"
                                            class="inp-cbx ${isBlocked ? 'not-allowed' : ''}"
                                            data-toggle="shell-parking_space"
                                            data-floor="${1}"
                                            data-parking-space="${i}"
                                            ${parkingOwner === HousingCreator.ModifyingIdentifier ? 'checked' : ''}
                                        >
                                        <label for="${inputId}" class="cbx">
                                            <span><svg viewBox="0 0 12 10" height="10px" width="12px"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                                            <label for="${inputId}" class="input-name">#${i}</label>
                                        </label>
                                    </div>
                                `
                            }
                            
                            HousingCreator.ApartmentParkingSpots = {}
                            for (const [floor, floorData] of Object.entries(HousingCreator.BuildingParking)) {
                                for (const [spot, apartment] of Object.entries(floorData)) {
                                    if (String(apartment) === String(HousingCreator.ModifyingIdentifier)) {
                                        if (!HousingCreator.ApartmentParkingSpots[String(floor)]) {
                                            HousingCreator.ApartmentParkingSpots[String(floor)] = []
                                        }
                                        HousingCreator.ApartmentParkingSpots[String(floor)].push(String(spot))
                                    }
                                }
                            }

                            $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space').show();
                            $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-spaces').html(parkingSpacesHTML);
                        } else {
                            HousingCreator.BuildingParkingId = null;
                            HousingCreator.BuildingParking = null;
                            HousingCreator.ApartmentParkingSpots = null;
                            $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space').hide();
                            $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-spaces').empty();
                        }
                    });
                }

                let motels = [{
                    id: 0,
                    text: translation.select_menu.select_option,
                    disabled: true,
                    selected: house.object_id === undefined
                }];
    
                let isMotel = false;
                for (const [name, data] of Object.entries(response.motels)) {
                    motels.push({
                        id: data.id,
                        text: data.label,
                    });
                    if (house.object_id === data.id) isMotel = true;
                }
                
                $('.housing_creator div[data-type="configuration-shell"] .shell-motel > .mt-2 > select').select2({
                    minimumResultsForSearch: Infinity,
                    allowClear: false,
                    data: motels
                }).prop('disabled', !isMotel);
                $('.inp-cbx[data-toggle="shell-motel"]').prop('checked', isMotel);
            });

            $('.inp-cbx[data-toggle="shell-power_box"]').prop('checked', false);
            $('input[name="shell-power_box_coordinates"]').val('');
            if (house.metadata.powerBox) {
                $('.inp-cbx[data-toggle="shell-power_box"]').prop('checked', true);
                $('input[name="shell-power_box_coordinates"]').val(JSON.stringify(house.metadata.powerBox));
            }

            $('.inp-cbx[data-toggle="shell-sign"]').prop('checked', false);
            $('input[name="shell-sign_point"]').val('');
            if (house.metadata.sign) {
                $('.inp-cbx[data-toggle="shell-sign"]').prop('checked', true);
                $('input[name="shell-sign_point"]').val(JSON.stringify(house.metadata.sign));
            }

            $('.inp-cbx[data-toggle="shell-__garage"]').prop('checked', false);
            $('.inp-cbx[data-toggle="shell-__parking"]').prop('checked', false);
            $('input[name="shell-garage_point"]').val('');
            if (house.metadata.garage) {
                $('.inp-cbx[data-toggle="shell-__garage"]').prop('checked', true);
                $('input[name="shell-garage_point"]').val(JSON.stringify(house.metadata.garage));
            }
            if (house.metadata.parking) {
                $('.inp-cbx[data-toggle="shell-__parking"]').prop('checked', true);
                $('input[name="shell-garage_point"]').val(JSON.stringify(house.metadata.parking));
            }

            $('.inp-cbx[data-toggle="shell-emergency_exit"]').prop('checked', false);
            $('input[name="shell-emergency_exit_outside"], input[name="shell-emergency_exit_inside"]').val('');
            if (house.metadata.emergencyOutside) {
                $('.inp-cbx[data-toggle="shell-emergency_exit"]').prop('checked', true);
                $('input[name="shell-emergency_exit_outside"]').val(JSON.stringify(house.metadata.emergencyOutside));
            }
            if (house.metadata.emergencyInside) {
                $('.inp-cbx[data-toggle="shell-emergency_exit"]').prop('checked', true);
                $('input[name="shell-emergency_exit_inside"]').val(JSON.stringify(house.metadata.emergencyInside));
            }
            
            $('.inp-cbx[data-toggle="shell-delivery_inside"]').prop('checked', house.metadata.deliveryType == 'inside');
            $('.inp-cbx[data-toggle="shell-delivery_outside"]').prop('checked', house.metadata.deliveryType == 'outside');
            $('input[name="shell-delivery_coordinates"]').val('');
            if (house.metadata.delivery) $('input[name="shell-delivery_coordinates"]').val(JSON.stringify(house.metadata.delivery));
            
            $('.inp-cbx[data-toggle="shell-furniture_environment_outside"]').prop('checked', house.metadata.allowFurnitureOutside);
            $('.inp-cbx[data-toggle="shell-furniture_environment_inside"]').prop('checked', house.metadata.allowFurnitureInside);
            
            $('.inp-cbx[data-toggle="shell-grass"]').prop('checked', false);
            $('input[name="shell-grass_coords"]').val('');
            if (house.grass) {
                $('.inp-cbx[data-toggle="shell-grass"]').prop('checked', true);
                $('input[name="shell-grass_coords"]').val(JSON.stringify(house.grass));
            }
            
            $('input[name="shell-wardrobe_point"]').val('');
            if (house.metadata.wardrobe) {
                $('.inp-cbx[data-toggle="shell-wardrobe"]').prop('checked', true);
                $('input[name="shell-wardrobe_point"]').val(JSON.stringify(house.metadata.wardrobe));
            }

            $('input[name="shell-storage_point"]').val('');
            if (house.metadata.storage) {
                $('.inp-cbx[data-toggle="shell-storage"]').prop('checked', true);
                $('input[name="shell-storage_point"]').val(JSON.stringify(house.metadata.storage));
                $('.shell-storage input[name="metadata-slots-value"]').val(house.metadata.storage.slots).prop('disabled', false);
                $('.shell-storage input[name="metadata-weight-value"]').val(house.metadata.storage.weight).prop('disabled', false);
            }
            
            $('input[name="shell-keys_limit_count"]').val('');
            if (house.metadata.keysLimit) {
                $('.inp-cbx[data-toggle="shell-keys_limit"]').prop('checked', true);
                $('input[name="shell-keys_limit_count"]').val(house.metadata.keysLimit).prop('disabled', false);
            }
            
            $('input[name="shell-permissions_limit_count"]').val('');
            if (house.metadata.permissionsLimit) {
                $('.inp-cbx[data-toggle="shell-permissions_limit"]').prop('checked', true);
                $('input[name="shell-permissions_limit_count"]').val(house.metadata.permissionsLimit).prop('disabled', false);
            }

            $('.inp-cbx[data-toggle="shell-purchase_price"]').prop('checked', house.sale.active);
            $('input[name="shell-purchase_price"]').val(house.sale.defaultPrice);
            if (house.sale.active) {
                $('input[name="shell-purchase_price"]').prop('disabled', false);
            }

            $('.inp-cbx[data-toggle="shell-rent_price"]').prop('checked', house.rental.active);
            $('input[name="shell-rent_price"]').val(house.rental.defaultPrice);
            if (house.rental.active) {
                $('input[name="shell-rent_price"]').prop('disabled', false);
            }

            $('.housing_creator div[data-type="configuration-shell"] .images-list #add-image > i').css('opacity', '1.0');
            $('.housing_creator div[data-type="configuration-shell"] .images-list .img').css('background-image', 'none');
            
            if (house.metadata.images && Object.keys(house.metadata.images).length > 0) {
                for (const [id, url] of Object.entries(house.metadata.images)) {
                    $(`.housing_creator div[data-type="configuration-shell"] .images-list #add-image[data-image-id="${id}"] > i`).css('opacity', '0.0');
                    $(`.housing_creator div[data-type="configuration-shell"] .images-list #add-image[data-image-id="${id}"] .img`).css('background-image', `url(${url})`);
                }
            }

            setTimeout(() => {
                checkShellInputs()
            }, 80);

        } else if (house.type == 'ipl') {
            this.IsModifyingExisting = true;
            this.ModifyingIdentifier = house.id;
            
            $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-name"]').val(house.metadata.ipl);
            $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-address"]').val(house.address);
            $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-region"]').val(house.region);
            $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-house_name"]').val(house.name);
            $('.housing_creator div[data-type="configuration-ipl"] textarea[name="ipl-house_description"]').val(house.description);
            $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-yard_zone"]').val(JSON.stringify(house.metadata.zone));
            $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-enter_point"]').val(JSON.stringify(house.metadata.enter));
            $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-exit_point"]').val(JSON.stringify(house.metadata.exit));

            this.BuildingParkingId = null;
            this.BuildingParking = null;
            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space').hide();
            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-spaces').empty();

            $.post(`https://${GetParentResourceName()}/creator:getAllBuildings`, JSON.stringify({}), (response) => {
                $('.housing_creator div[data-type="configuration-ipl"] .ipl-building > .mt-2').html(`<select></select>`);
                $('.housing_creator div[data-type="configuration-ipl"] .ipl-motel > .mt-2').html(`<select></select>`);

                let buildings = [{
                    id: 0,
                    text: translation.select_menu.select_option,
                    disabled: true,
                    selected: house.object_id === undefined
                }];

                let isBuilding = false
                for (const [name, data] of Object.entries(response.buildings)) {
                    buildings.push({
                        id: data.id,
                        text: data.label,
                        isMenuBuilding: data.isMenuBuilding,
                        selected: house.object_id === data.id
                    });
                    if (house.object_id === data.id) isBuilding = true;
                }
    
                $('.housing_creator div[data-type="configuration-ipl"] .ipl-building > .mt-2 > select').select2({
                    minimumResultsForSearch: Infinity,
                    allowClear: false,
                    data: buildings
                }).prop('disabled', !isBuilding);
                $('.inp-cbx[data-toggle="ipl-building"]').prop('checked', isBuilding);

                if (isBuilding && usingVMSGarages) {
                    $.post(`https://${GetParentResourceName()}/creator:getBuildingParking`, JSON.stringify({ id: house.object_id }), function (parking) {
                        if (parking) {
                            HousingCreator.BuildingParkingId = house.object_id;
                            HousingCreator.BuildingParking = parking;
                            let parkingFloorsHTML = '';
                            for (const [floor, _] of Object.entries(HousingCreator.BuildingParking)) {
                                parkingFloorsHTML += `<div data-floor="${floor}" ${floor === "1" ? 'class="active"': ''}>${(translation.creator.configuration_ipl['option:label.parking_space_floor']).format(floor)}</div>`;
                            }
                            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-floors').html(parkingFloorsHTML);
    
                            let parkingSpacesHTML = '';
                            for (let i=1; i <= 38; i++) {
                                const inputId = `ipl-parking_space_${i}`;
                                parkingSpacesHTML += `
                                    <div class="checkbox-wrapper-46">
                                        <input type="checkbox" id="${inputId}" class="inp-cbx" data-toggle="ipl-parking_space" data-floor="1" data-parking-space="${i}" ${HousingCreator.BuildingParking["1"][String(i)] === house.id ? 'checked' : ''}>
                                        <label for="${inputId}" class="cbx">
                                            <span><svg viewBox="0 0 12 10" height="10px" width="12px"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                                            <label for="${inputId}" class="input-name">#${i}</label>
                                        </label>
                                    </div>
                                `
                            }

                            HousingCreator.ApartmentParkingSpots = {};
                            for (const [floor, floorData] of Object.entries(HousingCreator.BuildingParking)) {
                                for (const [spot, apartment] of Object.entries(floorData)) {
                                    if (String(apartment) === String(house.id)) {
                                        if (!HousingCreator.ApartmentParkingSpots[floor]) {
                                            HousingCreator.ApartmentParkingSpots[floor] = [];
                                        }
                                        HousingCreator.ApartmentParkingSpots[floor].push(spot);
                                    }
                                }
                            }
                            
                            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space').show();
                            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-spaces').html(parkingSpacesHTML);
                        }
                    });
                }

                let motels = [{
                    id: 0,
                    text: translation.select_menu.select_option,
                    disabled: true,
                    selected: house.object_id === undefined
                }];
    
                let isMotel = false;
                for (const [name, data] of Object.entries(response.motels)) {
                    motels.push({
                        id: data.id,
                        text: data.label,
                        // isMenuBuilding: data.isMenuBuilding
                    });
                    if (house.object_id === data.id) isMotel = true;
                }
                
                $('.housing_creator div[data-type="configuration-ipl"] .ipl-motel > .mt-2 > select').select2({
                    minimumResultsForSearch: Infinity,
                    allowClear: false,
                    data: motels
                }).prop('disabled', !isMotel);
                $('.inp-cbx[data-toggle="ipl-motel"]').prop('checked', isMotel);
            });

            $('.inp-cbx[data-toggle="ipl-power_box"]').prop('checked', false);
            $('input[name="ipl-power_box_coordinates"]').val('');
            if (house.metadata.powerBox) {
                $('.inp-cbx[data-toggle="ipl-power_box"]').prop('checked', true);
                $('input[name="ipl-power_box_coordinates"]').val(JSON.stringify(house.metadata.powerBox));
            }

            $('.inp-cbx[data-toggle="ipl-sign"]').prop('checked', false);
            $('input[name="ipl-sign_point"]').val('');
            if (house.metadata.sign) {
                $('.inp-cbx[data-toggle="ipl-sign"]').prop('checked', true);
                $('input[name="ipl-sign_point"]').val(JSON.stringify(house.metadata.sign));
            }

            $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme > .mt-2').html(`<select></select>`);
            let iplThemes = [
                {
                    id: 0,
                    text: translation.select_menu.select_option,
                    disabled: true,
                    selected: true
                }
            ];
            if (this.AvailableIPLS[house.metadata.ipl] && this.AvailableIPLS[house.metadata.ipl].settings && this.AvailableIPLS[house.metadata.ipl].settings.Themes) {
                for (const [name, data] of Object.entries(this.AvailableIPLS[house.metadata.ipl].settings.Themes)) {
                    iplThemes.push({
                        id: name,
                        text: data.label,
                        selected: name == house.metadata.iplTheme,
                    });
                }
            }
            $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme > .mt-2 > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: iplThemes
            });

            $('.inp-cbx[data-toggle="ipl-__theme_purchase_change"]').prop('checked', house.metadata.allowChangeTheme);
            $('.inp-cbx[data-toggle="ipl-__theme_purchased_change"]').prop('checked', house.metadata.allowChangeThemePurchased);

            $('.inp-cbx[data-toggle="ipl-__garage"]').prop('checked', false);
            $('.inp-cbx[data-toggle="ipl-__parking"]').prop('checked', false);
            $('input[name="ipl-garage_point"]').val('');
            if (house.metadata.garage) {
                $('.inp-cbx[data-toggle="ipl-__garage"]').prop('checked', true);
                $('input[name="ipl-garage_point"]').val(JSON.stringify(house.metadata.garage));
            }
            if (house.metadata.parking) {
                $('.inp-cbx[data-toggle="ipl-__parking"]').prop('checked', true);
                $('input[name="ipl-garage_point"]').val(JSON.stringify(house.metadata.parking));
            }
            
            $('.inp-cbx[data-toggle="ipl-emergency_exit"]').prop('checked', false);
            $('input[name="ipl-emergency_exit_outside"], input[name="ipl-emergency_exit_inside"]').val('');
            if (house.metadata.emergencyOutside) {
                $('.inp-cbx[data-toggle="ipl-emergency_exit"]').prop('checked', true);
                $('input[name="ipl-emergency_exit_outside"]').val(JSON.stringify(house.metadata.emergencyOutside));
            }
            if (house.metadata.emergencyInside) {
                $('.inp-cbx[data-toggle="ipl-emergency_exit"]').prop('checked', true);
                $('input[name="ipl-emergency_exit_inside"]').val(JSON.stringify(house.metadata.emergencyInside));
            }

            $('.inp-cbx[data-toggle="ipl-delivery_inside"]').prop('checked', house.metadata.deliveryType == 'inside');
            $('.inp-cbx[data-toggle="ipl-delivery_outside"]').prop('checked', house.metadata.deliveryType == 'outside');
            $('input[name="ipl-delivery_coordinates"]').val('');
            if (house.metadata.delivery) $('input[name="ipl-delivery_coordinates"]').val(JSON.stringify(house.metadata.delivery));
            
            $('.inp-cbx[data-toggle="ipl-furniture_environment_outside"]').prop('checked', house.metadata.allowFurnitureOutside);
            $('.inp-cbx[data-toggle="ipl-furniture_environment_inside"]').prop('checked', house.metadata.allowFurnitureInside);
            
            $('.inp-cbx[data-toggle="ipl-grass"]').prop('checked', false);
            $('input[name="ipl-grass_coords"]').val('');
            if (house.grass) {
                $('.inp-cbx[data-toggle="ipl-grass"]').prop('checked', true);
                $('input[name="ipl-grass_coords"]').val(JSON.stringify(house.grass));
            }

            $('input[name="ipl-wardrobe_point"]').val('');
            if (house.metadata.wardrobe) {
                $('.inp-cbx[data-toggle="ipl-wardrobe"]').prop('checked', true);
                $('input[name="ipl-wardrobe_point"]').val(JSON.stringify(house.metadata.wardrobe));
            }

            $('input[name="ipl-storage_point"]').val('');
            if (house.metadata.storage) {
                $('.inp-cbx[data-toggle="ipl-storage"]').prop('checked', true);
                $('input[name="ipl-storage_point"]').val(JSON.stringify(house.metadata.storage));
                $('.ipl-storage input[name="metadata-slots-value"]').val(house.metadata.storage.slots);
                $('.ipl-storage input[name="metadata-weight-value"]').val(house.metadata.storage.weight);
            }
            
            $('input[name="ipl-keys_limit_count"]').val('');
            if (house.metadata.keysLimit) {
                $('.inp-cbx[data-toggle="ipl-keys_limit"]').prop('checked', true);
                $('input[name="ipl-keys_limit_count"]').val(house.metadata.keysLimit).prop('disabled', false);
            }
            
            $('input[name="ipl-permissions_limit_count"]').val('');
            if (house.metadata.permissionsLimit) {
                $('.inp-cbx[data-toggle="ipl-permissions_limit"]').prop('checked', true);
                $('input[name="ipl-permissions_limit_count"]').val(house.metadata.permissionsLimit).prop('disabled', false);
            }

            $('.inp-cbx[data-toggle="ipl-purchase_price"]').prop('checked', house.sale.active);
            $('input[name="ipl-purchase_price"]').val(house.sale.defaultPrice)
            if (house.sale.defaultPrice) {
                $('input[name="ipl-purchase_price"]').attr('disabled', false);
            }

            $('.inp-cbx[data-toggle="ipl-rent_price"]').prop('checked', house.rental.active);
            $('input[name="ipl-rent_price"]').val(house.rental.defaultPrice)
            if (house.rental.defaultPrice) {
                $('input[name="ipl-rent_price"]').attr('disabled', false);
            }

            $('.housing_creator div[data-type="configuration-ipl"] .images-list #add-image > i').css('opacity', '1.0');
            $('.housing_creator div[data-type="configuration-ipl"] .images-list .img').css('background-image', 'none');
            
            if (house.metadata.images && Object.keys(house.metadata.images).length > 0) {
                for (const [id, url] of Object.entries(house.metadata.images)) {
                    $(`.housing_creator div[data-type="configuration-ipl"] .images-list #add-image[data-image-id="${id}"] > i`).css('opacity', '0.0');
                    $(`.housing_creator div[data-type="configuration-ipl"] .images-list #add-image[data-image-id="${id}"] .img`).css('background-image', `url(${url})`);
                }
            }

            setTimeout(() => {
                checkIplInputs()
            }, 80);

        } else if (house.type == 'mlo') {
            this.IsModifyingExisting = true;
            this.ModifyingIdentifier = house.id;

            $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-name"]').val(house.metadata.shell);
            $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-address"]').val(house.address);
            $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-region"]').val(house.region);
            $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-house_name"]').val(house.name);
            $('.housing_creator div[data-type="configuration-mlo"] textarea[name="mlo-house_description"]').val(house.description);
            $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-yard_zone"]').val(JSON.stringify(house.metadata.zone));
            $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-interior_zone"]').val(JSON.stringify(house.metadata.interiorZone));
            $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-menu_point"]').val(JSON.stringify(house.metadata.menu));
            $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-delivery_coordinates"]').val(JSON.stringify(house.metadata.delivery));

            $.post(`https://${GetParentResourceName()}/creator:getAllBuildings`, JSON.stringify({}), (response) => {
                $('.housing_creator div[data-type="configuration-mlo"] .mlo-motel > .mt-2').html(`<select></select>`);

                let motels = [{
                    id: 0,
                    text: translation.select_menu.select_option,
                    disabled: true,
                    selected: house.object_id === undefined
                }];
    
                let isMotel = false;
                for (const [name, data] of Object.entries(response.motels)) {
                    motels.push({
                        id: data.id,
                        text: data.label,
                        // isMenuBuilding: data.isMenuBuilding
                    });
                    if (house.object_id === data.id) isMotel = true;
                }
                
                $('.housing_creator div[data-type="configuration-mlo"] .mlo-motel > .mt-2 > select').select2({
                    minimumResultsForSearch: Infinity,
                    allowClear: false,
                    data: motels
                }).prop('disabled', !isMotel);
                $('.inp-cbx[data-toggle="mlo-motel"]').prop('checked', isMotel);
            });

            $('.inp-cbx[data-toggle="mlo-__garage"]').prop('checked', false);
            $('.inp-cbx[data-toggle="mlo-__parking"]').prop('checked', false);
            $('input[name="mlo-garage_point"]').val('');
            if (house.metadata.garage) {
                $('.inp-cbx[data-toggle="mlo-__garage"]').prop('checked', true);
                $('input[name="mlo-garage_point"]').val(JSON.stringify(house.metadata.garage));
            }
            if (house.metadata.parking) {
                $('.inp-cbx[data-toggle="mlo-__parking"]').prop('checked', true);
                $('input[name="mlo-garage_point"]').val(JSON.stringify(house.metadata.parking));
            }
            
            HousingCreator.LoadMenusData({
                type: 'update-doors-list',
                value: house.metadata.doors
            })

            $('.inp-cbx[data-toggle="mlo-delivery_inside"]').prop('checked', house.metadata.deliveryType == 'inside');
            $('.inp-cbx[data-toggle="mlo-delivery_outside"]').prop('checked', house.metadata.deliveryType == 'outside');
            $('input[name="mlo-delivery_coordinates"]').val('');
            if (house.metadata.delivery) $('input[name="mlo-delivery_coordinates"]').val(JSON.stringify(house.metadata.delivery));
            
            $('.inp-cbx[data-toggle="mlo-furniture_environment_outside"]').prop('checked', house.metadata.allowFurnitureOutside);
            $('.inp-cbx[data-toggle="mlo-furniture_environment_inside"]').prop('checked', house.metadata.allowFurnitureInside);
            
            $('.inp-cbx[data-toggle="mlo-grass"]').prop('checked', false);
            $('input[name="mlo-grass_coords"]').val('');
            if (house.grass) {
                $('.inp-cbx[data-toggle="mlo-grass"]').prop('checked', true);
                $('input[name="mlo-grass_coords"]').val(JSON.stringify(house.grass));
            }

            $('.inp-cbx[data-toggle="mlo-sign"]').prop('checked', false);
            $('input[name="mlo-sign_point"]').val('');
            if (house.metadata.sign) {
                $('.inp-cbx[data-toggle="mlo-sign"]').prop('checked', true);
                $('input[name="mlo-sign_point"]').val(JSON.stringify(house.metadata.sign));
            }

            $('input[name="mlo-wardrobe_point"]').val('');
            if (house.metadata.wardrobe) {
                $('.inp-cbx[data-toggle="mlo-wardrobe"]').prop('checked', true);
                $('input[name="mlo-wardrobe_point"]').val(JSON.stringify(house.metadata.wardrobe));
            }

            $('input[name="mlo-storage_point"]').val('');
            if (house.metadata.storage) {
                $('.inp-cbx[data-toggle="mlo-storage"]').prop('checked', true);
                $('input[name="mlo-storage_point"]').val(JSON.stringify(house.metadata.storage));
                $('.mlo-storage input[name="metadata-slots-value"]').val(house.metadata.storage.slots).attr('disabled', false);
                $('.mlo-storage input[name="metadata-weight-value"]').val(house.metadata.storage.weight).attr('disabled', false);
            }
            
            $('input[name="mlo-keys_limit_count"]').val('');
            if (house.metadata.keysLimit) {
                $('.inp-cbx[data-toggle="mlo-keys_limit"]').prop('checked', true);
                $('input[name="mlo-keys_limit_count"]').val(house.metadata.keysLimit).prop('disabled', false);
            }
            
            $('input[name="mlo-permissions_limit_count"]').val('');
            if (house.metadata.permissionsLimit) {
                $('.inp-cbx[data-toggle="mlo-permissions_limit"]').prop('checked', true);
                $('input[name="mlo-permissions_limit_count"]').val(house.metadata.permissionsLimit).prop('disabled', false);
            }

            $('.inp-cbx[data-toggle="mlo-purchase_price"]').prop('checked', house.sale.active);
            $('input[name="mlo-purchase_price"]').val(house.sale.defaultPrice)
            if (house.sale.defaultPrice) {
                $('input[name="mlo-purchase_price"]').attr('disabled', false);
            }

            $('.inp-cbx[data-toggle="mlo-rent_price"]').prop('checked', house.rental.active);
            $('input[name="mlo-rent_price"]').val(house.rental.defaultPrice)
            if (house.rental.defaultPrice) {
                $('input[name="mlo-rent_price"]').attr('disabled', false);
            }

            $('.housing_creator div[data-type="configuration-mlo"] .images-list #add-image > i').css('opacity', '1.0');
            $('.housing_creator div[data-type="configuration-mlo"] .images-list .img').css('background-image', 'none');
            
            if (house.metadata.images && Object.keys(house.metadata.images).length > 0) {
                for (const [id, url] of Object.entries(house.metadata.images)) {
                    $(`.housing_creator div[data-type="configuration-mlo"] .images-list #add-image[data-image-id="${id}"] > i`).css('opacity', '0.0');
                    $(`.housing_creator div[data-type="configuration-mlo"] .images-list #add-image[data-image-id="${id}"] .img`).css('background-image', `url(${url})`);
                }
            }

            setTimeout(() => {
                checkMloInputs()
            }, 80);

        } else if (house.type == 'building') {
            // this.ResetBuilding();

            this.IsModifyingExisting = true;
            this.ModifyingIdentifier = house.id;

            $('.housing_creator div[data-type="configuration-building"] input[name="building-address"]').val(house.address);
            $('.housing_creator div[data-type="configuration-building"] input[name="building-region"]').val(house.region);
            $('.housing_creator div[data-type="configuration-building"] input[name="building-name"]').val(house.name);
            $('.housing_creator div[data-type="configuration-building"] input[name="building-yard_zone"]').val(JSON.stringify(house.metadata.zone));
            $('.housing_creator div[data-type="configuration-building"] input[name="building-enter_point"]').val(JSON.stringify(house.metadata.enter));
            $('.housing_creator div[data-type="configuration-building"] input[name="building-exit_point"]').val(JSON.stringify(house.metadata.exit));

            $('.inp-cbx[data-toggle="building-__underground_parking"]').prop('checked', house.metadata.parkingEnter != undefined)
            if (house.metadata.parkingEnter != undefined) {
                let floors = 0;
                for (const [floorId, floorData] of Object.entries(house.metadata.parkingSpaces)) {
                    floors += 1
                }
                $('.housing_creator div[data-type="configuration-building"] input[name="building-underground_parking_floors"]').val(floors).attr('disabled', false);
                $('.housing_creator div[data-type="configuration-building"] input[name="building-enter_garage_point"]').val(JSON.stringify(house.metadata.parkingEnter));
            }

        } else if (house.type == 'motel') {
            // this.ResetMotel();

            this.IsModifyingExisting = true;
            this.ModifyingIdentifier = house.id;
            
            $('.housing_creator div[data-type="configuration-motel"] input[name="motel-address"]').val(house.address);
            $('.housing_creator div[data-type="configuration-motel"] input[name="motel-region"]').val(house.region);
            $('.housing_creator div[data-type="configuration-motel"] input[name="motel-name"]').val(house.name);
            $('.housing_creator div[data-type="configuration-motel"] input[name="motel-yard_zone"]').val(JSON.stringify(house.metadata.zone));

            $('input[name="motel-reception_point"]').val('');
            if (house.metadata.reception) {
                $('.inp-cbx[data-toggle="motel-reception"]').prop('checked', true);
                $('input[name="motel-reception_point"]').val(JSON.stringify(house.metadata.reception));
            }
            

        }
    },

    EditFurniture: function (model) {
        let furniture = null;
        for (const item of this.Pagination.Array) {
            if (item.model == model) {
                furniture = item;
                break;
            }
        }
        if (!furniture) return;

        $('.housing_creator div[data-type="configuration-furniture"] .metadata-list').hide();
        $('.housing_creator div[data-type="configuration-furniture"] .metadata-elements').empty();

        $('.housing_creator div[data-type="configuration-furniture"] .text > div > .save').addClass('allowed');
        $('.housing_creator div[data-type="configuration-furniture"] .text > div > .delete').show();
        if (!this.HasPermission('Furniture:Delete')) $('.housing_creator div[data-type="configuration-furniture"] .text > div > .delete').hide();

        $('.housing_creator div[data-type="configuration-furniture"] .mt-4 div[data-tag]').removeClass('active');

        updateSection('.housing_creator', 'configuration-furniture');
        
        this.IsModifyingExisting = true;
        this.ModifyingIdentifier = furniture.model;
        
        $('.housing_creator div[data-type="configuration-furniture"] img.furniture-image').attr('src', `./images/furniture/${furniture.model}.webp`);
        $('.housing_creator div[data-type="configuration-furniture"] p#furniture-model-name').text(furniture.model || "unknown");

        $('.housing_creator div[data-type="configuration-furniture"] input[name="furniture-label"]').val(furniture.label || "");

        $('.housing_creator div[data-type="configuration-furniture"] input[name="furniture-price"]').val(furniture.price || 0);

        if (furniture.tag && furniture.tag != "") {
            $(`.housing_creator div[data-type="configuration-furniture"] .mt-4 div[data-tag="${furniture.tag}"]`).addClass('active');
        }

        $('.inp-cbx[data-toggle="furniture-inside"]').prop('checked', furniture.isIndoor == true);
        $('.inp-cbx[data-toggle="furniture-outside"]').prop('checked', furniture.isOutdoor == true);

        $('.inp-cbx[data-toggle="furniture-delivery_small"]').prop('checked', furniture.deliverySize == 1);
        $('.inp-cbx[data-toggle="furniture-delivery_medium"]').prop('checked', furniture.deliverySize == 2);
        $('.inp-cbx[data-toggle="furniture-delivery_big"]').prop('checked', furniture.deliverySize == 3);

        $('.housing_creator div[data-type="configuration-furniture"] #interactable-name > .mt-2').html(`<select name="furniture-interactable-name"></select>`)

        const interactableElements = [];
        interactableElements.push({
            id: 0,
            text: 'none',
            selected: true
        })
     
        config.configuratorFurnitureInteractables.forEach(element => {
            interactableElements.push({
                id: element,
                text: config.interactableInfo[element] ? config.interactableInfo[element].label : element,
                selected: element == furniture.interactableName
            })
        });
        $('.housing_creator div[data-type="configuration-furniture"] span.select2-selection__rendered').attr('title', 'none').html('none');

        $('.housing_creator div[data-type="configuration-furniture"] select[name="furniture-interactable-name"]').select2({
            allowClear: false,
            data: interactableElements
        })
        
        if (furniture.metadata && furniture.interactableName && config.configuratorFurnitureMetadata[furniture.interactableName]) {
            let metadataElementsHTML = '';
        
            config.configuratorFurnitureMetadata[furniture.interactableName].forEach(element => {
                metadataElementsHTML += `
                    <input name="metadata-${element.key}-key" type="text" value="${element.key}" disabled>
                    <input name="metadata-${element.key}-value" type="${element.allowedValue || "text"}" value="${furniture.metadata[element.key]}">
                `
            });

            $('.housing_creator div[data-type="configuration-furniture"] .metadata-list').show();
            $('.housing_creator div[data-type="configuration-furniture"] .metadata-elements').html(metadataElementsHTML);
        }
    },

    LoadPagination: function (data) {
        this.Pagination.Array = Object.values(data);
    },

    ClearPagination: function (type) {
        if (!type) {
            this.Pagination.Array = [];
            this.Pagination.ArrayFiltered = [];
            this.Pagination.CurrentPage = 1;
            // this.Pagination.currentFilter = "all";
            this.Pagination.SearchTerm = "";

            $('.housing_creator .main > div[data-type="all-properties"] > .properties').empty();
            $('.housing_creator .main > div[data-type="all-furniture"] > .furniture').empty();

            return;
        }
    },
    
    UpdatePagination: function(type) {
        $(`.housing_creator .main > div[data-type="${type}"] #prev-page`).prop('disabled', this.Pagination.CurrentPage === 1);
        $(`.housing_creator .main > div[data-type="${type}"] #next-page`).prop('disabled', this.Pagination.CurrentPage === Math.ceil((this.Pagination.SearchTerm != "" ? this.Pagination.ArrayFiltered.length : this.Pagination.Array.length) / this.Pagination.ItemsPerPage));
    },

    RenderPagination: function(type) {
        $(`.housing_creator .main > div[data-type="${type}"] table > tbody`).empty();

        if (type == 'all-properties') {
            this.Pagination.ItemsPerPage = 13;
        } else if (type == 'all-furniture') {
            this.Pagination.ItemsPerPage = 7;
        }
        
        const start = (this.Pagination.CurrentPage - 1) * this.Pagination.ItemsPerPage;
        const end = start + this.Pagination.ItemsPerPage;
        
        let pageItems = this.Pagination.Array.slice(start, end);
        if (type == 'all-properties') {
            if (this.Pagination.SearchTerm != "" || this.Pagination.ActiveFilters.length >= 1) {
                pageItems = this.Pagination.ArrayFiltered.slice(start, end);
            }
        } else if (type == 'all-furniture') {
            if (this.Pagination.SearchTerm != "") {
                pageItems = this.Pagination.ArrayFiltered.slice(start, end);
            }
        }

        
        if (this.Pagination.SearchTerm != "") {
            pageItems = this.Pagination.ArrayFiltered.slice(start, end);
        }

        if (type == 'all-properties') {
            pageItems.forEach((item, index) => {
                $(`.housing_creator .main > div[data-type="${type}"] table > tbody`).append(`
                    <tr>
                        <td id="house_type">
                            <div id="${item.type}">${
                                item.type == 'shell' && "SHELL" ||
                                item.type == 'ipl' && "IPL" ||
                                item.type == 'mlo' && "MLO" ||
                                item.type == 'building' && "BUILDING" || 
                                item.type == 'motel' && "MOTEL"
                            }</div>
                        </td>
                        <td id="house_name">${item.name}</td>
                        <td id="house_address"> ${item.region ? `<span class="region">${item.region}</span><br>` : ''}<span class="address">${item.address}</span></td>
                        <td id="house_owner">
                            <div>
                                ${HousingCreator.HasPermission('Property:RemoveOwner') ? `
                                    <div class="remove-owner" onclick="HousingCreator.RemoveOwner('${item.id}')">
                                        ${item.owner ? '<i class="fa-solid fa-trash-can"></i>' : ''}
                                    </div>
                                ` : ''}
                                <div>
                                    ${item.owner ? `<span class="owner">${item.owner}</span><br>` : ''}
                                    ${item.owner_name ? `<span class="owner_name">${item.owner_name}</span>` : ''}
                                </div>
                            </div>
                        </td>
                        <td id="house_renter">
                            <div>
                                ${HousingCreator.HasPermission('Property:RemoveRenter') ? `
                                    <div class="remove-renter" onclick="HousingCreator.RemoveRenter('${item.id}')">
                                        ${item.renter ? '<i class="fa-solid fa-trash-can"></i>' : ''}
                                    </div>
                                ` : ''}
                                <div>
                                    ${item.renter ? `<span class="renter">${item.renter}</span><br>` : ''}
                                    ${item.renter_name ? `<span class="renter_name">${item.renter_name}</span>` : ''}
                                </div>
                            </div>
                        </td>
                        <td id="actions">
                            ${HousingCreator.HasPermission('Property:Teleport') ? `
                                <div class="teleport" onclick="HousingCreator.TeleportToProperty('${item.id}')">
                                    <i class="fa-solid fa-street-view"></i>
                                </div>
                            ` : ''}
                            ${HousingCreator.HasPermission('Property:Edit') ? `
                                <div class="edit" onclick="HousingCreator.EditHouse('${item.id}')">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </div>
                            ` : ''}
                        </td>
                    </tr>
                `);
            });

            if (HousingCreator.HasPermission('Property:Teleport')) {
                tippy('.housing_creator .main > div[data-type="all-properties"] tbody > tr > td#actions .teleport', {
                    content: translation.creator.all_properties['action:tooltip.teleport'],
                    animation: 'scale-extreme',
                    maxWidth: 150,
                    delay: 0,
                    placement: 'top',
                    moveTransition: 'transform 0.2s ease-out',
                });
            }

            if (HousingCreator.HasPermission('Property:Edit')) {
                tippy('.housing_creator .main > div[data-type="all-properties"] tbody > tr > td#actions .edit', {
                    content: translation.creator.all_properties['action:tooltip.edit'],
                    animation: 'scale-extreme',
                    maxWidth: 150,
                    delay: 0,
                    placement: 'top',
                    moveTransition: 'transform 0.2s ease-out',
                });
            }

        } else if (type == 'all-furniture') {
            pageItems.forEach((item, index) => {
                $(`.housing_creator .main > div[data-type="${type}"] table > tbody`).append(`
                    <tr>
                        <td id="furniture_image">
                            <img src="./images/furniture/${item.model}.webp">
                        </td>
                        <td id="furniture_label">${item.label}</td>
                        <td id="furniture_price">${translation.currency}${formatNumber(item.price, 0, 0)}</td>
                        <td id="furniture_model">${item.model}</td>
                        <td id="furniture_category">${item.tag || ''}</td>
                        <td id="furniture_interactable">${item.interactableName || ''}</td>
                        <td id="actions">
                            ${HousingCreator.HasPermission('Furniture:Edit') ? `
                                <div class="edit" onclick="HousingCreator.EditFurniture('${item.model}')">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </div>
                            ` : ''}
                        </td>
                    </tr>
                `);
            });

            tippy('.housing_creator .main > div[data-type="all-furniture"] #furniture-list tbody > tr > td#actions .edit', {
                content: translation.creator.all_furniture['action:tooltip.edit'],
                animation: 'scale-extreme',
                maxWidth: 150,
                delay: 0,
                placement: 'top',
                moveTransition: 'transform 0.2s ease-out',
            });
        }
        
        this.UpdatePagination(type);
        
        $(`.housing_creator .main > div[data-type="${type}"] #page-info`).text(this.Pagination.CurrentPage + '/' + Math.ceil((this.Pagination.SearchTerm != "" ? this.Pagination.ArrayFiltered.length : this.Pagination.Array.length) / this.Pagination.ItemsPerPage));
    },

    RefreshPropertiesMenu: function() {
        $.post(`https://${GetParentResourceName()}/creator:getAllProperties`, JSON.stringify({}), function (properties) {
            if ($('.housing_creator div[data-type="all-properties"]').css('display') === 'block') {
                HousingCreator.LoadPagination(properties);
                HousingCreator.RenderPagination('all-properties');
                HousingCreator.UpdatePagination('all-properties');
            }
        });
    },

    RefreshProperty: function(data) {
        if (this.IsRealEstate) {
            if (HousingCreator.AllowSellProperties) {
                $(`.housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${data.propertyId}"] .details #sale-details > .data`).html(`
                    ${data.sale ? translation.realestate.company_properties['details:description.for_sale'] : translation.realestate.company_properties['details:description.not_for_sale']}
                `);

                $(`.housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${data.propertyId}"] .details #price-details > .data`).html(`
                    ${translation.currency}
                    <input
                        type="text"
                        name="price"
                        class="full-input formatted-number"
                        pattern="d*"
                        value="${data.salePrice || 0}"
                        data-property-id="${data.propertyId}"
                        data-default="${data.salePrice || 0}"
                        data-on-sale="${data.sale ? '1' : '0'}"
                        ${(!HousingCreator.HasPermission('UpdatePropertyPrice') || data.renter) && 'disabled'}
                    >
                `);

            }

            if (HousingCreator.AllowRentProperties) {
                $(`.housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${data.propertyId}"] .details #rent-details > .data`).html(`
                    ${data.renter ? data.renterName : (data.rent ? translation.realestate.company_properties['details:description.for_rent'] : translation.realestate.company_properties['details:description.not_for_rent'])}
                `);

                $(`.housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${data.propertyId}"] .details #rent-price-details > .data`).html(`
                    ${translation.currency}
                    <input
                        type="text"
                        name="price"
                        class="full-input formatted-number"
                        pattern="d*"
                        value="${data.rentPrice || 0}"
                        data-property-id="${data.propertyId}"
                        data-default="${data.rentPrice || 0}"
                        data-on-rent="${data.rent ? '1' : '0'}"
                        ${(!HousingCreator.HasPermission('UpdatePropertyPrice') || data.renter) && 'disabled'}
                    >
                `);
            }

            $(`.housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${data.propertyId}"] .buttons`).html(`
                ${(data.renter && HousingCreator.HasPermission('TerminateRental')) ? `
                    ${data.terminationActive ? `
                        <div id="cancel-termination-property" data-property-id="${data.propertyId}">
                            <i class="fa-solid fa-person-walking-luggage"></i>
                            <span>${translation.realestate.company_properties['btn.cancel_termination']}</span>
                        </div>
                    ` : `
                        <div id="terminate-now-property" data-property-id="${data.propertyId}">
                            <i class="fa-solid fa-person-walking-luggage"></i>
                            <span>${translation.realestate.company_properties['btn.terminate_now']}</span>
                        </div>
                        <div id="termination-property" data-property-id="${data.propertyId}">
                            <i class="fa-solid fa-person-walking-luggage"></i>
                            <span>${translation.realestate.company_properties['btn.termination']}</span>
                        </div>
                    `}
                ` : ''}
                ${(!data.renter && (HousingCreator.HasPermission('SellProperties') || HousingCreator.HasPermission('RentProperties'))) ? `
                    <div id="transaction-property" data-property-id="${data.propertyId}">
                        <i class="fa-solid fa-file-invoice-dollar"></i>
                        <span>${translation.realestate.company_properties['btn.transaction']}</span>
                    </div>
                ` : ''}
                ${(!data.renter && HousingCreator.HasPermission('UpdatePropertyPrice')) ? `
                    <div id="update-property" data-property-id="${data.propertyId}" style="display:none">
                        <i class="fa-solid fa-pen"></i>
                        <span>${translation.realestate.company_properties['btn.update']}</span>
                    </div>
                ` : ''}
                ${(!data.renter && HousingCreator.HasPermission('ListProperty')) ? `
                    <div id="unlist-property" data-property-id="${data.propertyId}" ${(!data.sale && !data.rent) ? 'style="display:none"' : ''}>
                        <i class="fa-solid fa-list-ul"></i>
                        <span>${translation.realestate.company_properties['btn.unlist']}</span>
                    </div>
                    <div id="list-property" data-property-id="${data.propertyId}" ${(data.sale || data.rent) ? 'style="display:none"' : ''}>
                        <i class="fa-solid fa-list-ul"></i>
                        <span>${translation.realestate.company_properties['btn.list']}</span>
                    </div>
                ` : ''}
            `);
        }
    },

    ShowModal: function(title, description, actionsHTML, buttonsHTML) {
        $('.housing_creator>div>.menu>#modal>div>#header>#title').text(title);
    
        if (description) {
            $('.housing_creator>div>.menu>#modal>div>#description').html(description).show();
        } else {
            $('.housing_creator>div>.menu>#modal>div>#description').hide();
        }
        
        if (actionsHTML) {
            $('.housing_creator>div>.menu>#modal>div>#description-actions').html(actionsHTML).show();
        } else {
            $('.housing_creator>div>.menu>#modal>div>#description-actions').hide();
        }
        
        $('.housing_creator>div>.menu>#modal>div>#buttons').html(buttonsHTML);

        $('.housing_creator>div>.menu>#modal').fadeIn(120);
    },

    CloseModal: function() {
        $('.housing_creator>div>.menu>#modal').fadeOut(120);
    },
};

$(document).on('click', '.housing_creator .menu ul > li', function(e) {
    let newMenu = $(this).data('href');

    if (newMenu == 'agency-bossmenu') {
        return $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
            action: 'openBossMenu',
        }));
    }

    updateSection('.housing_creator', newMenu, this);
})

$(document).on('click', '.housing_creator .menu div[data-type="new"] #housing_types > div', function(e) {
    let newMenu = $(this).data('housing-type');
    updateSection('.housing_creator', ((newMenu == 'building' || newMenu == 'motel' || newMenu == 'mlo') && `configuration-${newMenu}` || `new-${newMenu}`), this);
})

$(document).on('click', '.housing_creator #modal', function(event) {
    if (event.target === this) {
        $('.housing_creator>div>.menu>#modal').fadeOut(120);
        setTimeout(() => {
            $(`.housing_creator #modal #header > #title, .housing_creator #modal #description, .housing_creator #modal #description-actions, .housing_creator #modal #buttons`).empty();
        }, 150);
    }
});

$(document).on('click', '.housing_creator #modal #header > #close, .housing_creator #modal #buttons > #cancel', function(event) {
    $('.housing_creator>div>.menu>#modal').fadeOut(120);
    setTimeout(() => {
        $(`.housing_creator #modal #header > #title, .housing_creator #modal #description, .housing_creator #modal #description-actions, .housing_creator #modal #buttons`).empty();
    }, 150);
});

$(document).on('click', '.housing_creator #modal #buttons > #accept', function() {
    const type = $(this).data('type');
    const action = $(this).data('action');

    let jsonData = {
        isModal: true,
        type: type,
        action: action
    }

    if (action == "create-image-inside" || action == "create-image-outside" || action == "remove-image") {
        jsonData.imageId = $(this).data('image-id');
        
        if (type == 'ipl') {
            let themeName = $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme select')?.select2('data')?.[0]
            jsonData.iplTheme = themeName.id
        }
    } else if (action == "apply-properties-filters") {
        HousingCreator.Pagination.ActiveFilters = [];
        if (getCheckboxState('filter_properties-exclude_starting_apartments')) {
            HousingCreator.Pagination.ActiveFilters.push('exclude_starting_apartments');
        }

        const searchTerm = $('.housing_creator div[data-type="all-properties"] > div > .side-boxes > .box .text input').val().trim().toLowerCase();
        filterAllProperties(searchTerm);
        
        HousingCreator.CloseModal();

        return;
    } else if (action == "confirm-delete") {
        jsonData.action = 'delete'
        jsonData.id = HousingCreator.ModifyingIdentifier
    } else if (action == "confirm-list-sale") {
        const propertyId = $(this).data('property-id');
        $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
            action: 'listProperty',
            type: 'sale',
            propertyId: propertyId,
        }));
        return;
    } else if (action == "confirm-list-rent") {
        const propertyId = $(this).data('property-id');
        $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
            action: 'listProperty',
            type: 'rent',
            propertyId: propertyId,
        }));
        return;
    } else if (action == "confirm-list-both") {
        const propertyId = $(this).data('property-id');
        $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
            action: 'listProperty',
            type: 'both',
            propertyId: propertyId,
        }));
        return;
    } else if (action == "transaction-sale") {
        const propertyId = $(this).data('property-id');
        $.post(`https://${GetParentResourceName()}/realestate:getCompanyProperty`, JSON.stringify({
            id: propertyId,
            isTransaction: true
        }), function (property) {
            HousingCreator.CloseModal()
            HousingCreator.AgentContractPropertyId = propertyId
            reloadContract('transfer', {
                data: {
                    address: property.property.address,
                    electricity: property.bills.electricity,
                    internet: property.bills.internet,
                    water: property.bills.water,
                },
            })
            $('.housing_creator').fadeOut(120);
            $('.contract').fadeIn(150);
        });
    } else if (action == "transaction-rent") {
        const propertyId = $(this).data('property-id');
        $.post(`https://${GetParentResourceName()}/realestate:getCompanyProperty`, JSON.stringify({
            id: propertyId,
            isTransaction: true
        }), function (property) {
            HousingCreator.CloseModal()
            HousingCreator.AgentContractPropertyId = propertyId
            reloadContract('rent-out', {
                data: {
                    address: property.property.address,
                    electricity: property.bills.electricity,
                    internet: property.bills.internet,
                    water: property.bills.water,
                },
            })
            $('.housing_creator').fadeOut(120);
            $('.contract').fadeIn(150);
        });
    }

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
});


// ███╗   ██╗███████╗██╗    ██╗    ███████╗██╗  ██╗███████╗██╗     ██╗     
// ████╗  ██║██╔════╝██║    ██║    ██╔════╝██║  ██║██╔════╝██║     ██║     
// ██╔██╗ ██║█████╗  ██║ █╗ ██║    ███████╗███████║█████╗  ██║     ██║     
// ██║╚██╗██║██╔══╝  ██║███╗██║    ╚════██║██╔══██║██╔══╝  ██║     ██║     
// ██║ ╚████║███████╗╚███╔███╔╝    ███████║██║  ██║███████╗███████╗███████╗
// ╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
const filterShells = function(search, tag) {
    if (search === "") {
        if ((!tag || tag === "default")) {
            $('.housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>#shells-list > div').show();
        } else {
            $('.housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>#shells-list > div').hide();
            $(`.housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>#shells-list > div.tag-${tag}`).show();
        }
        return;
    } else {
        const items = $('.housing_creator div[data-type="new-shell"]>div>.side-boxes>.box>#shells-list > div');

        items.each(function () {
            const $item = $(this);
            const name = $item.find('p').text().trim().toLowerCase();
            const matchesSearch = name.includes(search);
            const matchesTag = (!tag || tag === "default") ? true : $item.hasClass(`tag-${tag}`);

            if (matchesSearch && matchesTag) {
                $item.show();
            } else {
                $item.hide();
            }
        });
    }
};

$(document).on('click', '.housing_creator div[data-type="new-shell"] > div > .side-boxes > .box > .text .tags > div', function(e) {
    let newMenu = $(this).data('tag');

    if (!newMenu) return;

    $('.housing_creator div[data-type="new-shell"] > div > .side-boxes > .box > .text .tags > div').removeClass('active');

    $(this).addClass('active');
    
    const searchTerm = $('.housing_creator div[data-type="new-shell"] > div > .side-boxes > .box > .text .tags > .search > input').val().trim().toLowerCase();
    
    filterShells(searchTerm, newMenu);
})

let searchTimeout;
$(document).on('input', '.housing_creator div[data-type="new-shell"] > div > .side-boxes > .box > .text .tags > .search > input', function () {
    clearTimeout(searchTimeout);
    const input = this;
    searchTimeout = setTimeout(function() {
        const selectedTagElement = $('.housing_creator div[data-type="new-shell"] > div > .side-boxes > .box > .text .tags > .active');
        const selectedTag = selectedTagElement.data('tag');

        const searchTerm = $(input).val().trim().toLowerCase();

        filterShells(searchTerm, selectedTag);
    }, 400);
});

$(document).on('click', '.housing_creator div[data-type="new-shell"] > div > .side-boxes > .box > #shells-list > div > .buttons > #select-shell', function(e) {
    let selectedShell = $(this).data('shell');
    $.post(`https://${GetParentResourceName()}/creator:selectShell`, JSON.stringify({shell: selectedShell}));
    
    if (HousingCreator.IsModifyingExisting) {
        updateSection('.housing_creator', 'configuration-shell');
        HousingCreator.IsModifyingExisting = true;
        $(`.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box > .options .mt-2 > input[name="shell-name"]`).val(selectedShell)
    } else {
        updateSection('.housing_creator', 'configuration-shell');
        HousingCreator.ConfigurationShell(selectedShell);
    }
})

$(document).on('click', '.housing_creator div[data-type="new-shell"] > div > .side-boxes > .box > #shells-list > div > .buttons > #preview-shell', function(e) {
    let selectedShell = $(this).data('shell');
    $.post(`https://${GetParentResourceName()}/creator:previewShell`, JSON.stringify({shell: selectedShell}));
});

$(document).on('click', '.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-floors > div', function(e) {
    if (!usingVMSGarages) return;
    
    let floor = $(this).data('floor');

    $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-floors > div').removeClass('active');
    
    $(this).addClass('active');
    
    let parkingSpacesHTML = '';
    for (let i=1; i <= 38; i++) {
        const inputId = `shell-parking_space_${i}`;

        const parkingOwner = HousingCreator.BuildingParking[String(floor)][String(i)];
        const isBlocked = (
            (!HousingCreator.ModifyingIdentifier && parkingOwner) ||
            (HousingCreator.ModifyingIdentifier && parkingOwner && parkingOwner !== HousingCreator.ModifyingIdentifier)
        );

        parkingSpacesHTML += `
            <div class="checkbox-wrapper-46 ${isBlocked ? 'not-allowed' : ''}">
                <input
                    type="checkbox"
                    id="${inputId}"
                    class="inp-cbx ${isBlocked ? 'not-allowed' : ''}"
                    data-toggle="shell-parking_space"
                    data-floor="${floor}"
                    data-parking-space="${i}"
                    ${HousingCreator.ApartmentParkingSpots[String(floor)] && HousingCreator.ApartmentParkingSpots[String(floor)].includes(String(i)) && 'checked' || ''}
                >
                <label for="${inputId}" class="cbx">
                    <span><svg viewBox="0 0 12 10" height="10px" width="12px"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                    <label for="${inputId}" class="input-name">#${i}</label>
                </label>
            </div>
        `
    }

    $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-spaces').html(parkingSpacesHTML);
});

$(document).on('click', '.housing_creator div[data-type="configuration-shell"] > div > .side-boxes > .box > .options .inp-cbx', function(e) {
    let toggle = $(this).data('toggle');
    let isChecked = $(this).prop('checked');

    if ($(this).hasClass('not-allowed')) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).prop('checked', isChecked);
        return false;
    };

    if (toggle == "shell-delivery_inside") {
        $('.inp-cbx[data-toggle="shell-delivery_outside"]').prop('checked', false);
        $('input[name="shell-delivery_coordinates"]').attr('value', '');
        
    } else if (toggle == "shell-delivery_outside") {
        $('.inp-cbx[data-toggle="shell-delivery_inside"]').prop('checked', false);
        $('input[name="shell-delivery_coordinates"]').attr('value', '');
        
    } else if (toggle == "shell-building") {
        $('.inp-cbx[data-toggle="shell-motel"]').prop('checked', false);
        $('.housing_creator div[data-type="configuration-shell"] .shell-motel > .mt-2 > select').prop('disabled', true);
        $('.housing_creator div[data-type="configuration-shell"] .shell-building > .mt-2 > select').prop('disabled', !isChecked);
        
    } else if (toggle == "shell-motel") {
        $('.inp-cbx[data-toggle="shell-building"]').prop('checked', false);
        $('.housing_creator div[data-type="configuration-shell"] .shell-building > .mt-2 > select').prop('disabled', true);
        $('.housing_creator div[data-type="configuration-shell"] .shell-motel > .mt-2 > select').prop('disabled', !isChecked);

    } else if (toggle == "shell-storage") {
        $('.housing_creator div[data-type="configuration-shell"] .shell-storage .metadata-elements > input[name="metadata-slots-value"]').prop('disabled', !isChecked);
        $('.housing_creator div[data-type="configuration-shell"] .shell-storage .metadata-elements > input[name="metadata-weight-value"]').prop('disabled', !isChecked);
        
    } else if (toggle == "shell-keys_limit") {
        $('.housing_creator div[data-type="configuration-shell"] input[name="shell-keys_limit_count"]').prop('disabled', !isChecked);

    } else if (toggle == "shell-permissions_limit") {
        $('.housing_creator div[data-type="configuration-shell"] input[name="shell-permissions_limit_count"]').prop('disabled', !isChecked);
        
    } else if (toggle == "shell-__garage") {
        $('.inp-cbx[data-toggle="shell-__parking"]').prop('checked', false);
        $('input[name="shell-garage_point"]').attr('value', '');

    } else if (toggle == "shell-__parking") {
        $('.inp-cbx[data-toggle="shell-__garage"]').prop('checked', false);
        $('input[name="shell-garage_point"]').attr('value', '');

    }
    
    if (toggle.includes('shell-parking_space')) {
        let floor = $(this).data('floor');
        let parkingSpace = $(this).data('parking-space');

        if (!HousingCreator.ApartmentParkingSpots[String(floor)]) {
            HousingCreator.ApartmentParkingSpots[String(floor)] = []
        }

        if (isChecked) {
            HousingCreator.ApartmentParkingSpots[String(floor)].push(String(parkingSpace))
        } else {
            HousingCreator.ApartmentParkingSpots[String(floor)] = HousingCreator.ApartmentParkingSpots[String(floor)].filter(value => value !== String(parkingSpace));
        }

        // $(`.housing_creator div[data-type="configuration-shell"] > div > .side-boxes > .box > .options input[name="${toggle}"][data-parking-space="${parkingSpace}"]`).prop('disabled', !isChecked);
    } else {
        $(`.housing_creator div[data-type="configuration-shell"] > div > .side-boxes > .box > .options input[name="${toggle}"]`).prop('disabled', !isChecked);
    }
});

$(document).on('click', '.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box > .options .mt-2 > .button', function(e) {
    if ($(this).hasClass('not-allowed')) return;

    let buttonAction = $(this).data('button-action');
    if (!buttonAction) return;
    
    let jsonData = {
        type: 'shell',
        action: buttonAction.replace(/^shell-?/, "")
    }

    if (buttonAction == "shell-delivery_coordinates") {
        jsonData.isInside = $('.inp-cbx[data-toggle="shell-delivery_inside"]').prop('checked');
        jsonData.isOutside = $('.inp-cbx[data-toggle="shell-delivery_outside"]').prop('checked');
        if (!jsonData.isInside && !jsonData.isOutside) return;
        
    } else if (buttonAction == "shell-power_box_coordinates") {
        let isPowerBoxActive = $('.inp-cbx[data-toggle="shell-power_box"]').prop('checked');
        if (!isPowerBoxActive) return;
        
    } else if (buttonAction == "shell-emergency_exit_outside" || buttonAction == "shell-emergency_exit_inside") {
        let isEmergencyExitActive = $('.inp-cbx[data-toggle="shell-emergency_exit"]').prop('checked');
        if (!isEmergencyExitActive) return;

    } else if (buttonAction == "shell-garage_point") {
        jsonData.isGarage = $('.inp-cbx[data-toggle="shell-__garage"]').prop('checked');
        jsonData.isParking = $('.inp-cbx[data-toggle="shell-__parking"]').prop('checked');
        if (!jsonData.isGarage && !jsonData.isParking) return;

    } else if (buttonAction == "shell-grass_coords") {
        jsonData.isGrassActive = $('.inp-cbx[data-toggle="shell-grass"]').prop('checked');
        if (!jsonData.isGrassActive) return;

    } else if (buttonAction == "shell-sign_point") {
        jsonData.isSign = $('.inp-cbx[data-toggle="shell-sign"]').prop('checked');
        if (!jsonData.isSign) return;

    } else if (buttonAction == "shell-wardrobe_point") {
        let isWardrobeActive = $('.inp-cbx[data-toggle="shell-wardrobe"]').prop('checked');
        if (!isWardrobeActive) return;

    } else if (buttonAction == "shell-storage_point") {
        let isStorageActive = $('.inp-cbx[data-toggle="shell-storage"]').prop('checked');
        if (!isStorageActive) return;

    } else if (buttonAction == "shell-name") {
        HousingCreator.LoadMenusData({
            type: 'new-shell'
        });
        updateSection('.housing_creator', 'new-shell');
        HousingCreator.IsModifyingExisting = true;
        $('.housing_creator div[data-type="configuration-shell"]').hide();
        return;
        
    }

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
});

$(document).on('click', '.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box > .options .images-list #add-image', function(e) {
    let imageId = $(this).data('image-id');
    if (!imageId) return;
    
    let el = $(this).children('.img');
    let bg = $(el).css('background-image');
    bg = bg.replace(/^url\(["']?/, '').replace(/["']?\)$/, '');

    HousingCreator.ShowModal(
        (translation.creator['configuration_shell']['image:modal'].title).format(imageId),
        undefined,
        `${bg == 'none' ? '' : `<img class="image-preview" src="${bg}">`}`,
        `
            <div id="accept" data-type="shell" data-action="create-image-inside" data-image-id="${imageId}">${translation.creator['configuration_shell']['image:modal']['btn.make_inside']}</div>
            <div id="accept" data-type="shell" data-action="create-image-outside" data-image-id="${imageId}">${translation.creator['configuration_shell']['image:modal']['btn.make_outside']}</div>
            ${bg != 'none' ? `
                <div id="accept" data-type="shell" data-action="remove-image" data-image-id="${imageId}">${translation.creator['configuration_shell']['image:modal']['btn.remove']}</div>
            ` : ''}
            <div id="cancel">${translation['button.cancel']}</div>
        `
    );
});

$(document).on('click', '.housing_creator div[data-type="configuration-shell"] .text > div > .save.allowed', function(e) {
    let jsonData = {
        type: 'shell',
        action: 'save'
    }
    
    if (HousingCreator.IsModifyingExisting) {
        jsonData.isModifying = HousingCreator.ModifyingIdentifier;
    }

    let isBuilding = $('.inp-cbx[data-toggle="shell-building"]').prop("checked")
    if (isBuilding) {
        let building = $('.housing_creator div[data-type="configuration-shell"] .shell-building select').select2('data')[0]
        if (building != "0") {
            jsonData.building = building.id;
            if (jsonData.building && HousingCreator.BuildingParkingId && usingVMSGarages) {
                jsonData.parkingSpaces = HousingCreator.ApartmentParkingSpots;
            }
        }
    }

    let isMotel = $('.inp-cbx[data-toggle="shell-motel"]').prop("checked")
    if (isMotel) {
        let motel = $('.housing_creator div[data-type="configuration-shell"] .shell-motel select').select2('data')[0]
        if (motel != "0") {
            jsonData.motel = motel.id;
        }
    }
    
    jsonData.houseName = $('input[name="shell-house_name"]').val();
    jsonData.houseDescription = $('textarea[name="shell-house_description"]').val();
    
    jsonData.isDeliveryInside = $('.inp-cbx[data-toggle="shell-delivery_inside"]').prop('checked');
    jsonData.isDeliveryOutside = $('.inp-cbx[data-toggle="shell-delivery_outside"]').prop('checked');
    
    jsonData.allowFurnitureOutside = $('.inp-cbx[data-toggle="shell-furniture_environment_outside"]').prop('checked');
    jsonData.allowFurnitureInside = $('.inp-cbx[data-toggle="shell-furniture_environment_inside"]').prop('checked');
    
    jsonData.isPowerBox = $('.inp-cbx[data-toggle="shell-power_box"]').prop('checked');

    jsonData.isEmergencyExit = $('.inp-cbx[data-toggle="shell-emergency_exit"]').prop('checked');

    jsonData.isGarage = $('.inp-cbx[data-toggle="shell-__garage"]').prop('checked');
    jsonData.isParking = $('.inp-cbx[data-toggle="shell-__parking"]').prop('checked');

    jsonData.isGrassActive = $('.inp-cbx[data-toggle="shell-grass"]').prop('checked');

    jsonData.isSign = $('.inp-cbx[data-toggle="shell-sign"]').prop('checked');
    
    jsonData.isWardrobe = $('.inp-cbx[data-toggle="shell-wardrobe"]').prop('checked');
    jsonData.isStorage = $('.inp-cbx[data-toggle="shell-storage"]').prop('checked');
    jsonData.storageSlots = $('.housing_creator div[data-type="configuration-shell"] .shell-storage .metadata-elements > input[name="metadata-slots-value"]').val();
    jsonData.storageWeight = $('.housing_creator div[data-type="configuration-shell"] .shell-storage .metadata-elements > input[name="metadata-weight-value"]').val();
    
    jsonData.isPurchase = $('.inp-cbx[data-toggle="shell-purchase_price"]').prop('checked');
    jsonData.purchasePrice = getRawValue('input[name="shell-purchase_price"]');
    
    jsonData.isRent = $('.inp-cbx[data-toggle="shell-rent_price"]').prop('checked');
    jsonData.rentPrice = getRawValue('input[name="shell-rent_price"]');

    jsonData.isKeysLimit = $('.inp-cbx[data-toggle="shell-keys_limit"]').prop('checked');
    jsonData.keysLimit = $('input[name="shell-keys_limit_count"]').val();
    
    jsonData.isPermissionsLimit = $('.inp-cbx[data-toggle="shell-permissions_limit"]').prop('checked');
    jsonData.permissionsLimit = $('input[name="shell-permissions_limit_count"]').val();
    
    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
});

$(document).on('click', '.housing_creator div[data-type="configuration-shell"] .text > div > .delete', function(e) {    
    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
        type: 'shell',
        action: 'delete',
        id: HousingCreator.ModifyingIdentifier
    }));
    // updateSection('.housing_creator', 'all-properties');
});

function checkShellInputs() {
    let building = $('.housing_creator div[data-type="configuration-shell"] .shell-building select').select2('data')[0]
    let buildingClasses = $(`
        input[name="shell-yard_zone"],
        .button[data-button-action="shell-yard_zone"],

        input[name="shell-enter_point"],
        .button[data-button-action="shell-enter_point"],

        input[name="shell-exit_point"],
        .button[data-button-action="shell-exit_point"],

        label[for="shell-power_box"],
        input[data-toggle="shell-power_box"],
        input[name="shell-power_box_coordinates"],
        .button[data-button-action="shell-power_box_coordinates"],

        label[for="shell-delivery_outside"],
        input[data-toggle="shell-delivery_outside"],
        
        label[for="shell-furniture_environment_outside"],
        input[data-toggle="shell-furniture_environment_outside"],

        label[for="shell-__garage"],
        input[data-toggle="shell-__garage"],

        label[for="shell-__parking"],
        input[data-toggle="shell-__parking"],

        input[name="shell-garage_point"],
        .button[data-button-action="shell-garage_point"],
        
        label[for="shell-grass"],
        input[data-toggle="shell-grass"],
        input[name="shell-grass_coords"],
        .button[data-button-action="shell-grass_coords"],

        label[for="shell-sign"],
        input[data-toggle="shell-sign"],
        input[name="shell-sign_point"],
        .button[data-button-action="shell-sign_point"]
    `);

    let motel = $('.housing_creator div[data-type="configuration-shell"] .shell-motel select').select2('data')[0]
    let motelClasses = $(`
        input[name="shell-yard_zone"],
        .button[data-button-action="shell-yard_zone"],

        label[for="shell-power_box"],
        input[data-toggle="shell-power_box"],
        input[name="shell-power_box_coordinates"],
        .button[data-button-action="shell-power_box_coordinates"],

        label[for="shell-delivery_outside"],
        input[data-toggle="shell-delivery_outside"],
        
        label[for="shell-furniture_environment_outside"],
        input[data-toggle="shell-furniture_environment_outside"],

        label[for="shell-__garage"],
        input[data-toggle="shell-__garage"],
        
        label[for="shell-__parking"],
        input[data-toggle="shell-__parking"],

        input[name="shell-garage_point"],
        .button[data-button-action="shell-garage_point"],
        
        label[for="shell-grass"],
        input[data-toggle="shell-grass"],
        input[name="shell-grass_coords"],
        .button[data-button-action="shell-grass_coords"],
        
        label[for="shell-sign"],
        input[data-toggle="shell-sign"],
        input[name="shell-sign_point"],
        .button[data-button-action="shell-sign_point"]
    `);

    let isApartment = false;
    let isMotel = false;
    if ($("#shell-building").is(":checked")) {
        motelClasses.removeClass('not-allowed');
        if (building.id != '0') {
            if (HousingCreator.BuildingParkingId != building.id && usingVMSGarages) {
                $.post(`https://${GetParentResourceName()}/creator:getBuildingParking`, JSON.stringify({ id: building.id }), function (parking) {
                    if (parking) {
                        HousingCreator.BuildingParkingId = building.id;
                        HousingCreator.BuildingParking = parking;
                        let parkingFloors = 0;
                        let parkingFloorsHTML = '';
                        for (const [floor, _] of Object.entries(HousingCreator.BuildingParking)) {
                            parkingFloors += 1;
                            parkingFloorsHTML += `<div data-floor="${floor}" ${floor === "1" ? 'class="active"': ''}>${(translation.creator.configuration_shell['option:label.parking_space_floor']).format(floor)}</div>`;
                        }
                        $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-floors').html(parkingFloorsHTML).css('grid-template-columns', `repeat(${parkingFloors}, 1fr)`);

                        let parkingSpacesHTML = '';
                        for (let i=1; i <= 38; i++) {
                            const inputId = `shell-parking_space_${i}`;

                            const parkingOwner = HousingCreator.BuildingParking["1"][String(i)];
                            const isBlocked = (
                                (!HousingCreator.ModifyingIdentifier && parkingOwner) ||
                                (HousingCreator.ModifyingIdentifier && parkingOwner && parkingOwner !== HousingCreator.ModifyingIdentifier)
                            );

                            parkingSpacesHTML += `
                                <div class="checkbox-wrapper-46 ${isBlocked ? 'not-allowed' : ''}">
                                    <input
                                        type="checkbox"
                                        id="${inputId}"
                                        class="inp-cbx ${isBlocked ? 'not-allowed' : ''}"
                                        data-toggle="shell-parking_space"
                                        data-floor="${1}"
                                        data-parking-space="${i}"
                                        ${HousingCreator.ModifyingIdentifier ? (parkingOwner === HousingCreator.ModifyingIdentifier ? 'checked' : '') : ''}
                                    >
                                    <label for="${inputId}" class="cbx">
                                        <span><svg viewBox="0 0 12 10" height="10px" width="12px"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                                        <label for="${inputId}" class="input-name">#${i}</label>
                                    </label>
                                </div>
                            `
                        }
                        
                        HousingCreator.ApartmentParkingSpots = {}
                        if (HousingCreator.ModifyingIdentifier) {
                            for (const [floor, floorData] of Object.entries(HousingCreator.BuildingParking)) {
                                for (const [spot, apartment] of Object.entries(floorData)) {
                                    if (String(apartment) === String(HousingCreator.ModifyingIdentifier)) {
                                        if (!HousingCreator.ApartmentParkingSpots[String(floor)]) {
                                            HousingCreator.ApartmentParkingSpots[String(floor)] = []
                                        }
                                        HousingCreator.ApartmentParkingSpots[String(floor)].push(String(spot))
                                    }
                                }
                            }
                        }
                        
                        $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space').show();
                        $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-spaces').html(parkingSpacesHTML);
                    } else {
                        HousingCreator.BuildingParkingId = null;
                        HousingCreator.BuildingParking = null;
                        HousingCreator.ApartmentParkingSpots = null;
                        $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space').hide();
                        $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-spaces').empty();
                    }
                });
            }

            isApartment = true;
            buildingClasses.addClass('not-allowed');
            $('input[data-toggle="shell-delivery_outside"]').prop('checked', false);
            $('input[data-toggle="shell-furniture_environment_outside"]').prop('checked', false);
            $('input[data-toggle="shell-__garage"]').prop('checked', false);
            $('input[data-toggle="shell-__parking"]').prop('checked', false);
        } else {
            buildingClasses.removeClass('not-allowed');
        }
        
    } else if ($("#shell-motel").is(":checked")) {
        buildingClasses.removeClass('not-allowed');
        if (motel.id != '0') {
            isMotel = true;
            motelClasses.addClass('not-allowed');
            $('input[data-toggle="shell-delivery_outside"]').prop('checked', false);
            $('input[data-toggle="shell-furniture_environment_outside"]').prop('checked', false);
            $('input[data-toggle="shell-__garage"]').prop('checked', false);
            $('input[data-toggle="shell-__parking"]').prop('checked', false);
        } else {
            motelClasses.removeClass('not-allowed');
        }
        
    } else {
        if (!$("#shell-motel").is(":checked")) {
            buildingClasses.removeClass('not-allowed');
        }
        if (!$("#shell-building").is(":checked")) {
            motelClasses.removeClass('not-allowed');
            HousingCreator.BuildingParking = null;
            HousingCreator.BuildingParkingId = null;
        }
    }

    if (!isApartment) {
        HousingCreator.BuildingParkingId = null;
        HousingCreator.BuildingParking = null;
        HousingCreator.ApartmentParkingSpots = null;
        $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space').hide();
        $('.housing_creator div[data-type="configuration-shell"]>div>.side-boxes>.box>.options .shell-parking_space > .parking-spaces').empty();
    }

    let inputs = $(`
        input[name='shell-name'], 
        input[name='shell-address'], 
        input[name='shell-region'], 
        input[name='shell-house_name'], 
        input[name='shell-position'],
        input[name='shell-yard_zone'], 
        input[name='shell-enter_point'], 
        input[name='shell-exit_point'],
        input[name="shell-grass"],
        input[name="shell-sign"]
    `);

    if (isApartment) {
        inputs = $(`
            input[name='shell-name'], 
            input[name='shell-address'], 
            input[name='shell-region'], 
            input[name='shell-house_name'],
            input[name='shell-position']
        `);
    }
    
    if (isMotel) {
        inputs = $(`
            input[name='shell-name'], 
            input[name='shell-address'], 
            input[name='shell-region'], 
            input[name='shell-house_name'], 
            input[name='shell-position'],
            input[name='shell-enter_point'], 
            input[name='shell-exit_point']
        `);
    }
    
    let values = inputs.map(function () {
        return $(this).val().trim();
    }).get();

    if ($("#shell-building").is(":checked")) {
        if (building.id == '0') {
            values.push("");
        }
    }

    if ($("#shell-motel").is(":checked")) {
        if (motel.id == '0') {
            values.push("");
        }
    }

    if (!isApartment && !isMotel) {
        if ($("#shell-__garage").is(":checked") || $("#shell-__parking").is(":checked")) {
            values.push($("input[name='shell-garage_point']").val().trim());
        }

        if ($("#shell-grass").is(":checked")) {
            values.push($("input[name='shell-grass_coords']").val().trim());
        }

        if ($("#shell-sign").is(":checked")) {
            values.push($("input[name='shell-sign_point']").val().trim());
        }
    }

    if ($("#shell-purchase_price").is(":checked")) {
        values.push($("input[name='shell-purchase_price']").val().trim());
    }
    
    if ($("#shell-rent_price").is(":checked")) {
        values.push($("input[name='shell-rent_price']").val().trim());
    }
    
    if ($("#shell-power_box").is(":checked")) {
        values.push($("input[name='shell-power_box_coordinates']").val().trim());
    }

    if ($("#shell-keys_limit").is(":checked")) {
        values.push($("input[name='shell-keys_limit_count']").val().trim());
    }
    
    if ($("#shell-permissions_limit").is(":checked")) {
        values.push($("input[name='shell-permissions_limit_count']").val().trim());
    }

    const hasEmpty = values.includes("") || values.includes(undefined);

    if (hasEmpty) {
        $('.housing_creator div[data-type="configuration-shell"] .text > div > .save').removeClass("allowed");
    } else {
        $('.housing_creator div[data-type="configuration-shell"] .text > div > .save').addClass("allowed");
    }
}
$(`
    .housing_creator div[data-type="configuration-shell"] .mt-2 > input,
    input#shell-building,
    input#shell-motel,
    input#shell-__garage,
    input#shell-__parking,
    input#shell-grass,
    input#shell-sign,
    input#shell-delivery_inside,
    input#shell-delivery_outside,
    input#shell-purchase_price,
    input#shell-rent_price,
    input#shell-keys_limit,
    input#shell-permissions_limit
`).on("input change", checkShellInputs);
$('.housing_creator div[data-type="configuration-shell"]').on('select2:select', 'select', checkShellInputs);



// ███╗   ██╗███████╗██╗    ██╗    ██╗██████╗ ██╗     
// ████╗  ██║██╔════╝██║    ██║    ██║██╔══██╗██║     
// ██╔██╗ ██║█████╗  ██║ █╗ ██║    ██║██████╔╝██║     
// ██║╚██╗██║██╔══╝  ██║███╗██║    ██║██╔═══╝ ██║     
// ██║ ╚████║███████╗╚███╔███╔╝    ██║██║     ███████╗
// ╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝     ╚═╝╚═╝     ╚══════╝
$(document).on('click', '.housing_creator div[data-type="new-ipl"] > div > .side-boxes > .box > .text .tags > div', function(e) {
    let newMenu = $(this).data('tag');

    $('.housing_creator div[data-type="new-ipl"] > div > .side-boxes > .box > .text .tags > div').removeClass('active');

    $(this).addClass('active');

    if (newMenu == 'default') {
        $('.housing_creator div[data-type="new-ipl"]>div>.side-boxes>.box>#ipls-list > div').show();
        return
    }
    
    $('.housing_creator div[data-type="new-ipl"]>div>.side-boxes>.box>#ipls-list > div').hide();
    $(`.housing_creator div[data-type="new-ipl"]>div>.side-boxes>.box>#ipls-list > div.tag-${newMenu}`).show();
})

$(document).on('click', '.housing_creator div[data-type="new-ipl"] > div > .side-boxes > .box > #ipls-list > div > .buttons > #select-ipl', function(e) {
    let selectedIPL = $(this).data('ipl');
    $.post(`https://${GetParentResourceName()}/creator:selectIPL`, JSON.stringify({ipl: selectedIPL}));
    if (HousingCreator.IsModifyingExisting) {
        updateSection('.housing_creator', 'configuration-ipl');
        HousingCreator.IsModifyingExisting = true;
        $(`.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box > .options .mt-2 > input[name="ipl-name"]`).val(selectedIPL);

        $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme > .mt-2').html(`<select></select>`);
        let iplThemes = [{
            id: 0,
            text: translation.select_menu.select_option,
            disabled: true,
            selected: true
        }];
        let iplThemesSelect = {
            minimumResultsForSearch: Infinity,
            allowClear: false,
            data: iplThemes,
            disabled: false
        }
        if (HousingCreator.AvailableIPLS[selectedIPL]?.settings?.Themes) {
            for (const [name, data] of Object.entries(HousingCreator.AvailableIPLS[selectedIPL].settings.Themes)) {
                iplThemes.push({
                    id: name,
                    text: data.label
                });
            }
            $(`
                label[for="ipl-__theme_purchase_change"],
                input[data-toggle="ipl-__theme_purchase_change"],

                label[for="ipl-__theme_purchased_change"],
                input[data-toggle="ipl-__theme_purchased_change"]
            `).removeClass('not-allowed');
        } else {
            iplThemesSelect.disabled = true;
            $(`
                label[for="ipl-__theme_purchase_change"],
                input[data-toggle="ipl-__theme_purchase_change"],

                label[for="ipl-__theme_purchased_change"],
                input[data-toggle="ipl-__theme_purchased_change"]
            `).addClass('not-allowed');
        }
        $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme > .mt-2 > select').select2(iplThemesSelect);
    } else {
        updateSection('.housing_creator', 'configuration-ipl');
        HousingCreator.ConfigurationIPL(selectedIPL);
    }
})

$(document).on('click', '.housing_creator div[data-type="new-ipl"] > div > .side-boxes > .box > #ipls-list > div > .buttons > #preview-ipl', function(e) {
    let selectedIPL = $(this).data('ipl');
    $.post(`https://${GetParentResourceName()}/creator:previewIPL`, JSON.stringify({ipl: selectedIPL}));
});

$(document).on('click', '.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-floors > div', function(e) {
    if (!usingVMSGarages) return;

    let floor = $(this).data('floor');

    $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-floors > div').removeClass('active');
    
    $(this).addClass('active');
    
    let parkingSpacesHTML = '';

    for (let i=1; i <= 38; i++) {
        const inputId = `ipl-parking_space_${i}`;

        const parkingOwner = HousingCreator.BuildingParking[String(floor)][String(i)];
        const isBlocked = (
            (!HousingCreator.ModifyingIdentifier && parkingOwner) ||
            (HousingCreator.ModifyingIdentifier && parkingOwner && parkingOwner !== HousingCreator.ModifyingIdentifier)
        );

        parkingSpacesHTML += `
            <div class="checkbox-wrapper-46 ${isBlocked ? 'not-allowed' : ''}">
                <input
                    type="checkbox"
                    id="${inputId}"
                    class="inp-cbx ${isBlocked ? 'not-allowed' : ''}"
                    data-toggle="ipl-parking_space"
                    data-floor="${floor}"
                    data-parking-space="${i}"
                    ${HousingCreator.ApartmentParkingSpots[String(floor)] && HousingCreator.ApartmentParkingSpots[String(floor)].includes(String(i)) && 'checked' || ''}
                >
                <label for="${inputId}" class="cbx">
                    <span><svg viewBox="0 0 12 10" height="10px" width="12px"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                    <label for="${inputId}" class="input-name">#${i}</label>
                </label>
            </div>
        `
    }

    $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-spaces').html(parkingSpacesHTML);
});

$(document).on('click', '.housing_creator div[data-type="configuration-ipl"] > div > .side-boxes > .box > .options > div .inp-cbx', function(e) {
    let toggle = $(this).data('toggle');
    let isChecked = $(this).prop('checked');
    
    if ($(this).hasClass('not-allowed')) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).prop('checked', isChecked);
        return false;
    };

    if (toggle == "ipl-delivery_inside") {
        $('.inp-cbx[data-toggle="ipl-delivery_outside"]').prop('checked', false);
        $('input[name="ipl-delivery_coordinates"]').attr('value', '');

    } else if (toggle == "ipl-delivery_outside") {
        $('.inp-cbx[data-toggle="ipl-delivery_inside"]').prop('checked', false);
        $('input[name="ipl-delivery_coordinates"]').attr('value', '');
        
    } else if (toggle == "ipl-__garage") {
        $('.inp-cbx[data-toggle="ipl-__parking"]').prop('checked', false);
        $('input[name="ipl-garage_point"]').attr('value', '');
        
    } else if (toggle == "ipl-__parking") {
        $('.inp-cbx[data-toggle="ipl-__garage"]').prop('checked', false);
        $('input[name="ipl-garage_point"]').attr('value', '');
                
    } else if (toggle == "ipl-building") {
        $('.inp-cbx[data-toggle="ipl-motel"]').prop('checked', false);
        $('.housing_creator div[data-type="configuration-ipl"] .ipl-motel > .mt-2 > select').prop('disabled', true);
        $('.housing_creator div[data-type="configuration-ipl"] .ipl-building > .mt-2 > select').prop('disabled', !isChecked);
        
    } else if (toggle == "ipl-motel") {
        $('.inp-cbx[data-toggle="ipl-building"]').prop('checked', false);
        $('.housing_creator div[data-type="configuration-ipl"] .ipl-building > .mt-2 > select').prop('disabled', true);
        $('.housing_creator div[data-type="configuration-ipl"] .ipl-motel > .mt-2 > select').prop('disabled', !isChecked);

    } else if (toggle == "ipl-storage") {
        $('.housing_creator div[data-type="configuration-ipl"] .ipl-storage .metadata-elements > input[name="metadata-slots-value"]').prop('disabled', !isChecked);
        $('.housing_creator div[data-type="configuration-ipl"] .ipl-storage .metadata-elements > input[name="metadata-weight-value"]').prop('disabled', !isChecked);
        
    } else if (toggle == "ipl-keys_limit") {
        $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-keys_limit_count"]').prop('disabled', !isChecked);

    } else if (toggle == "ipl-permissions_limit") {
        $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-permissions_limit_count"]').prop('disabled', !isChecked);
        
    }
    
    if (toggle.includes('ipl-parking_space')) {
        let floor = $(this).data('floor');
        let parkingSpace = $(this).data('parking-space');

        if (!HousingCreator.ApartmentParkingSpots[String(floor)]) {
            HousingCreator.ApartmentParkingSpots[String(floor)] = []
        }

        if (isChecked) {
            HousingCreator.ApartmentParkingSpots[String(floor)].push(String(parkingSpace))
        } else {
            HousingCreator.ApartmentParkingSpots[String(floor)] = HousingCreator.ApartmentParkingSpots[String(floor)].filter(value => value !== String(parkingSpace));
        }

        $(`.housing_creator div[data-type="configuration-ipl"] > div > .side-boxes > .box > .options input[name="${toggle}"][data-parking-space="${parkingSpace}"]`).prop('disabled', !isChecked);
    } else {
        $(`.housing_creator div[data-type="configuration-ipl"] > div > .side-boxes > .box > .options input[name="${toggle}"]`).prop('disabled', !isChecked);
    }
});

$(document).on('click', '.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box > .options .mt-2 > .button', function(e) {
    if ($(this).hasClass('not-allowed')) return;

    let buttonAction = $(this).data('button-action');
    if (!buttonAction) return;
    
    let jsonData = {
        type: 'ipl',
        action: buttonAction.replace(/^ipl-?/, "")
    }

    if (buttonAction == "ipl-delivery_coordinates") {
        let themeName = $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme select').select2('data')[0]
        jsonData.houseTheme = themeName.id
        
        jsonData.isInside = $('.inp-cbx[data-toggle="ipl-delivery_inside"]').prop('checked');
        jsonData.isOutside = $('.inp-cbx[data-toggle="ipl-delivery_outside"]').prop('checked');
        if (!jsonData.isInside && !jsonData.isOutside) return;
        
    } else if (buttonAction == "ipl-power_box_coordinates") {
        let isPowerBoxActive = $('.inp-cbx[data-toggle="ipl-power_box"]').prop('checked');
        if (!isPowerBoxActive) return;

    } else if (buttonAction == "ipl-emergency_exit_outside" || buttonAction == "ipl-emergency_exit_inside") {
        let isEmergencyExitActive = $('.inp-cbx[data-toggle="ipl-emergency_exit"]').prop('checked');
        if (!isEmergencyExitActive) return;

    } else if (buttonAction == "ipl-garage_point") {
        jsonData.isGarage = $('.inp-cbx[data-toggle="ipl-__garage"]').prop('checked');
        jsonData.isParking = $('.inp-cbx[data-toggle="ipl-__parking"]').prop('checked');
        if (!jsonData.isGarage && !jsonData.isParking) return;
        
    } else if (buttonAction == "ipl-grass_coords") {
        jsonData.isGrassActive = $('.inp-cbx[data-toggle="ipl-grass"]').prop('checked');
        if (!jsonData.isGrassActive) return;

    } else if (buttonAction == "ipl-sign_point") {
        jsonData.isSign = $('.inp-cbx[data-toggle="ipl-sign"]').prop('checked');
        if (!jsonData.isSign) return;

    } else if (buttonAction == "ipl-wardrobe_point") {
        let themeName = $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme select').select2('data')[0]
        jsonData.houseTheme = themeName.id

        let isWardrobeActive = $('.inp-cbx[data-toggle="ipl-wardrobe"]').prop('checked');
        if (!isWardrobeActive) return;

    } else if (buttonAction == "ipl-storage_point") {
        let themeName = $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme select').select2('data')[0]
        jsonData.houseTheme = themeName.id

        let isStorageActive = $('.inp-cbx[data-toggle="ipl-storage"]').prop('checked');
        if (!isStorageActive) return;

    } else if (buttonAction == "ipl-name") {
        HousingCreator.LoadMenusData({
            type: 'new-ipl'
        });
        updateSection('.housing_creator', 'new-ipl');
        HousingCreator.IsModifyingExisting = true;
        $('.housing_creator div[data-type="configuration-ipl"]').hide();
        return;
        
    }

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
});

$(document).on('click', '.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box > .options .images-list #add-image', function(e) {
    let imageId = $(this).data('image-id');
    if (!imageId) return;
    
    let el = $(this).children('.img');
    let bg = $(el).css('background-image');
    bg = bg.replace(/^url\(["']?/, '').replace(/["']?\)$/, '');

    HousingCreator.ShowModal(
        (translation.creator['configuration_ipl']['image:modal'].title).format(imageId),
        undefined,
        `${bg == 'none' ? '' : `<img class="image-preview" src="${bg}">`}`,
        `
            <div id="accept" data-type="ipl" data-action="create-image-inside" data-image-id="${imageId}">${translation.creator['configuration_ipl']['image:modal']['btn.make_inside']}</div>
            <div id="accept" data-type="ipl" data-action="create-image-outside" data-image-id="${imageId}">${translation.creator['configuration_ipl']['image:modal']['btn.make_outside']}</div>
            ${bg != 'none' ? `
                <div id="accept" data-type="ipl" data-action="remove-image" data-image-id="${imageId}">${translation.creator['configuration_ipl']['image:modal']['btn.remove']}</div>
            ` : ''}
            <div id="cancel">${translation['button.cancel']}</div>
        `
    );
});

$(document).on('click', '.housing_creator div[data-type="configuration-ipl"] .text > div > .save.allowed', function(e) {
    let jsonData = {
        type: 'ipl',
        action: 'save'
    }
    
    if (HousingCreator.IsModifyingExisting) {
        jsonData.isModifying = HousingCreator.ModifyingIdentifier;
    }
    
    let isBuilding = $('.inp-cbx[data-toggle="ipl-building"]').prop("checked")
    if (isBuilding) {
        let building = $('.housing_creator div[data-type="configuration-ipl"] .ipl-building select').select2('data')[0]
        if (building != "0") {
            jsonData.building = building.id;
            if (jsonData.building && HousingCreator.BuildingParkingId && usingVMSGarages) {
                jsonData.parkingSpaces = HousingCreator.ApartmentParkingSpots;
            }
        }
    }

    let themeName = $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme select').select2('data')[0]
    jsonData.houseTheme = themeName.id
    jsonData.allowChangeTheme = $('.inp-cbx[data-toggle="ipl-__theme_purchase_change"]').prop('checked');
    jsonData.allowChangeThemePurchased = $('.inp-cbx[data-toggle="ipl-__theme_purchased_change"]').prop('checked');
    
    jsonData.houseName = $('input[name="ipl-house_name"]').val();
    jsonData.houseDescription = $('textarea[name="ipl-house_description"]').val();
    
    jsonData.isDeliveryInside = $('.inp-cbx[data-toggle="ipl-delivery_inside"]').prop('checked');
    jsonData.isDeliveryOutside = $('.inp-cbx[data-toggle="ipl-delivery_outside"]').prop('checked');
        
    jsonData.isPowerBox = $('.inp-cbx[data-toggle="ipl-power_box"]').prop('checked');

    jsonData.allowFurnitureOutside = $('.inp-cbx[data-toggle="ipl-furniture_environment_outside"]').prop('checked');
    jsonData.allowFurnitureInside = $('.inp-cbx[data-toggle="ipl-furniture_environment_inside"]').prop('checked');
    
    jsonData.isEmergencyExit = $('.inp-cbx[data-toggle="ipl-emergency_exit"]').prop('checked');

    jsonData.isGarage = $('.inp-cbx[data-toggle="ipl-__garage"]').prop('checked');
    jsonData.isParking = $('.inp-cbx[data-toggle="ipl-__parking"]').prop('checked');

    jsonData.isGrassActive = $('.inp-cbx[data-toggle="ipl-grass"]').prop('checked');
    jsonData.isSign = $('.inp-cbx[data-toggle="ipl-sign"]').prop('checked');

    jsonData.isWardrobe = $('.inp-cbx[data-toggle="ipl-wardrobe"]').prop('checked');
    jsonData.isStorage = $('.inp-cbx[data-toggle="ipl-storage"]').prop('checked');
    jsonData.storageSlots = $('.housing_creator div[data-type="configuration-ipl"] .ipl-storage .metadata-elements > input[name="metadata-slots-value"]').val();
    jsonData.storageWeight = $('.housing_creator div[data-type="configuration-ipl"] .ipl-storage .metadata-elements > input[name="metadata-weight-value"]').val();
    
    jsonData.isPurchase = $('.inp-cbx[data-toggle="ipl-purchase_price"]').prop('checked');
    jsonData.purchasePrice = getRawValue('input[name="ipl-purchase_price"]');
    
    jsonData.isRent = $('.inp-cbx[data-toggle="ipl-rent_price"]').prop('checked');
    jsonData.rentPrice = getRawValue('input[name="ipl-rent_price"]');
    
    jsonData.isKeysLimit = $('.inp-cbx[data-toggle="ipl-keys_limit"]').prop('checked');
    jsonData.keysLimit = $('input[name="ipl-keys_limit_count"]').val();
    
    jsonData.isPermissionsLimit = $('.inp-cbx[data-toggle="ipl-permissions_limit"]').prop('checked');
    jsonData.permissionsLimit = $('input[name="ipl-permissions_limit_count"]').val();

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
});

$(document).on('click', '.housing_creator div[data-type="configuration-ipl"] .text > div > .delete', function(e) {
    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
        type: 'ipl',
        action: 'delete',
        id: HousingCreator.ModifyingIdentifier
    }));
    // updateSection('.housing_creator', 'all-properties');
});

function checkIplInputs() {
    let building = $('.housing_creator div[data-type="configuration-ipl"] .ipl-building select').select2('data')[0]
    let buildingClasses = $(`
        input[name="ipl-yard_zone"],
        .button[data-button-action="ipl-yard_zone"],

        input[name="ipl-enter_point"],
        .button[data-button-action="ipl-enter_point"],

        input[name="ipl-exit_point"],
        .button[data-button-action="ipl-exit_point"],

        label[for="ipl-power_box"],
        input[data-toggle="ipl-power_box"],
        input[name="ipl-power_box_coordinates"],
        .button[data-button-action="ipl-power_box_coordinates"],

        label[for="ipl-delivery_outside"],
        input[data-toggle="ipl-delivery_outside"],

        label[for="ipl-furniture_environment_outside"],
        input[data-toggle="ipl-furniture_environment_outside"],

        label[for="ipl-__garage"],
        input[data-toggle="ipl-__garage"],
        
        label[for="ipl-__parking"],
        input[data-toggle="ipl-__parking"],

        input[name="ipl-garage_point"],
        .button[data-button-action="ipl-garage_point"],

        label[for="ipl-grass"],
        input[data-toggle="ipl-grass"],
        input[name="ipl-grass_coords"],
        .button[data-button-action="ipl-grass_coords"],

        label[for="ipl-sign"],
        input[data-toggle="ipl-sign"],
        input[name="ipl-sign_point"],
        .button[data-button-action="ipl-sign_point"]
    `);

    let motel = $('.housing_creator div[data-type="configuration-ipl"] .ipl-motel select').select2('data')[0]
    let motelClasses = $(`
        input[name="ipl-yard_zone"],
        .button[data-button-action="ipl-yard_zone"],

        label[for="ipl-power_box"],
        input[data-toggle="ipl-power_box"],
        input[name="ipl-power_box_coordinates"],
        .button[data-button-action="ipl-power_box_coordinates"],

        label[for="ipl-delivery_outside"],
        input[data-toggle="ipl-delivery_outside"],
        
        label[for="ipl-furniture_environment_outside"],
        input[data-toggle="ipl-furniture_environment_outside"],

        label[for="ipl-__garage"],
        input[data-toggle="ipl-__garage"],
        
        label[for="ipl-__parking"],
        input[data-toggle="ipl-__parking"],

        input[name="ipl-garage_point"],
        .button[data-button-action="ipl-garage_point"],
        
        label[for="ipl-grass"],
        input[data-toggle="ipl-grass"],
        input[name="ipl-grass_coords"],
        .button[data-button-action="ipl-grass_coords"],

        label[for="ipl-sign"],
        input[data-toggle="ipl-sign"],
        input[name="ipl-sign_point"],
        .button[data-button-action="ipl-sign_point"]
    `);

    let isApartment = false;
    let isMotel = false;
    if ($("#ipl-building").is(":checked")) {
        if (building.id != '0') {
            if (building.isMenuBuilding) {
                if (HousingCreator.BuildingParkingId != building.id && usingVMSGarages) {
                    $.post(`https://${GetParentResourceName()}/creator:getBuildingParking`, JSON.stringify({ id: building.id }), function (parking) {
                        if (parking) {
                            HousingCreator.BuildingParkingId = building.id;
                            HousingCreator.BuildingParking = parking;
                            let parkingFloors = 0;
                            let parkingFloorsHTML = '';
                            for (const [floor, _] of Object.entries(HousingCreator.BuildingParking)) {
                                parkingFloors += 1;
                                parkingFloorsHTML += `<div data-floor="${floor}" ${floor === "1" ? 'class="active"': ''}>${(translation.creator.configuration_ipl['option:label.parking_space_floor']).format(floor)}</div>`;
                            }
                            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-floors').html(parkingFloorsHTML).css('grid-template-columns', `repeat(${parkingFloors}, 1fr)`);

                            let parkingSpacesHTML = '';
                            for (let i=1; i <= 38; i++) {
                                const inputId = `ipl-parking_space_${i}`;

                                const parkingOwner = HousingCreator.BuildingParking["1"][String(i)];
                                const isBlocked = (
                                    (!HousingCreator.ModifyingIdentifier && parkingOwner) ||
                                    (HousingCreator.ModifyingIdentifier && parkingOwner && parkingOwner !== HousingCreator.ModifyingIdentifier)
                                );

                                parkingSpacesHTML += `
                                    <div class="checkbox-wrapper-46 ${isBlocked ? 'not-allowed' : ''}">
                                        <input
                                            type="checkbox"
                                            id="${inputId}"
                                            class="inp-cbx ${isBlocked ? 'not-allowed' : ''}"
                                            data-toggle="ipl-parking_space"
                                            data-floor="${1}"
                                            data-parking-space="${i}"
                                            ${HousingCreator.ModifyingIdentifier ? (parkingOwner === HousingCreator.ModifyingIdentifier ? 'checked' : '') : ''}
                                        >
                                        <label for="${inputId}" class="cbx">
                                            <span><svg viewBox="0 0 12 10" height="10px" width="12px"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                                            <label for="${inputId}" class="input-name">#${i}</label>
                                        </label>
                                    </div>
                                `
                            }
                            
                            HousingCreator.ApartmentParkingSpots = {}
                            if (HousingCreator.ModifyingIdentifier) {
                                for (const [floor, floorData] of Object.entries(HousingCreator.BuildingParking)) {
                                    for (const [spot, apartment] of Object.entries(floorData)) {
                                        if (String(apartment) === String(HousingCreator.ModifyingIdentifier)) {
                                            if (!HousingCreator.ApartmentParkingSpots[String(floor)]) {
                                                HousingCreator.ApartmentParkingSpots[String(floor)] = []
                                            }
                                            HousingCreator.ApartmentParkingSpots[String(floor)].push(String(spot))
                                        }
                                    }
                                }
                            }
                            
                            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space').show();
                            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-spaces').html(parkingSpacesHTML);
                        } else {
                            HousingCreator.BuildingParkingId = null;
                            HousingCreator.BuildingParking = null;
                            HousingCreator.ApartmentParkingSpots = null;
                            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space').hide();
                            $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-spaces').empty();
                        }
                    });
                }
                
                isApartment = true;
                buildingClasses.addClass('not-allowed');
                $('input[data-toggle="ipl-delivery_outside"]').prop('checked', false);
                $('input[data-toggle="ipl-furniture_environment_outside"]').prop('checked', false);
                $('input[data-toggle="ipl-__garage"]').prop('checked', false);
                $('input[data-toggle="ipl-__parking"]').prop('checked', false);
            } else {
                buildingClasses.removeClass('not-allowed');
                HousingCreator.BuildingParking = null;
                HousingCreator.BuildingParkingId = null;
            }
        }

    } else if ($("#ipl-motel").is(":checked")) {
        buildingClasses.removeClass('not-allowed');
        if (motel.id != '0') {
            isMotel = true;
            motelClasses.addClass('not-allowed');
            $('input[data-toggle="ipl-delivery_outside"]').prop('checked', false);
            $('input[data-toggle="ipl-furniture_environment_outside"]').prop('checked', false);
            $('input[data-toggle="ipl-__garage"]').prop('checked', false);
            $('input[data-toggle="ipl-__parking"]').prop('checked', false);
        } else {
            motelClasses.removeClass('not-allowed');
        }

    } else {
        if (!$("#ipl-motel").is(":checked")) {
            buildingClasses.removeClass('not-allowed');
        }
        if (!$("#ipl-building").is(":checked")) {
            motelClasses.removeClass('not-allowed');
            HousingCreator.BuildingParking = null;
            HousingCreator.BuildingParkingId = null;
        }
    }
    
    if (!isApartment) {
        HousingCreator.BuildingParkingId = null;
        HousingCreator.BuildingParking = null;
        HousingCreator.ApartmentParkingSpots = null;
        $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space').hide();
        $('.housing_creator div[data-type="configuration-ipl"]>div>.side-boxes>.box>.options .ipl-parking_space > .parking-spaces').empty();
    }

    let inputs = $(`
        input[name='ipl-name'], 
        input[name='ipl-address'], 
        input[name='ipl-region'], 
        input[name='ipl-house_name'], 
        input[name='ipl-yard_zone'], 
        input[name='ipl-enter_point'], 
        input[name='ipl-exit_point'],
        input[name="ipl-grass"],
        input[name="ipl-sign"]
    `);

    if (isApartment) {
        inputs = $(`
            input[name='ipl-name'], 
            input[name='ipl-address'], 
            input[name='ipl-region'], 
            input[name='ipl-house_name']
        `);
    }

    if (isMotel) {
        inputs = $(`
            input[name='ipl-name'], 
            input[name='ipl-address'], 
            input[name='ipl-region'], 
            input[name='ipl-house_name'], 
            input[name='ipl-enter_point'], 
            input[name='ipl-exit_point']
        `);
    }

    let values = inputs.map(function () {
        return $(this).val().trim();
    }).get();

    if ($("#ipl-building").is(":checked")) {
        if (building.id == '0') {
            values.push("");
        }
    }

    if ($("#ipl-motel").is(":checked")) {
        if (motel.id == '0') {
            values.push("");
        }
    }

    let iplName = $('.housing_creator div[data-type="configuration-ipl"] input[name="ipl-name"]').val();
    if (HousingCreator.AvailableIPLS[iplName] && HousingCreator.AvailableIPLS[iplName].settings.Themes) {
        let themeName = $('.housing_creator div[data-type="configuration-ipl"] .ipl-theme select').select2('data')[0]
        if (themeName.id && themeName.id == '0') {
            values.push("");
        }
    }

    if (!isApartment && !isMotel) {
        if ($("#ipl-__garage").is(":checked") || $("#ipl-__parking").is(":checked")) {
            values.push($("input[name='ipl-garage_point']").val().trim());
        }

        if ($("#ipl-grass").is(":checked")) {
            values.push($("input[name='ipl-grass_coords']").val().trim());
        }

        if ($("#ipl-sign").is(":checked")) {
            values.push($("input[name='ipl-sign_point']").val().trim());
        }
    }

    if ($("#ipl-purchase_price").is(":checked")) {
        values.push($("input[name='ipl-purchase_price']").val().trim());
    }
    
    if ($("#ipl-rent_price").is(":checked")) {
        values.push($("input[name='ipl-rent_price']").val().trim());
    }
    
    if ($("#ipl-power_box").is(":checked")) {
        values.push($("input[name='ipl-power_box_coordinates']").val().trim());
    }

    if ($("#ipl-keys_limit").is(":checked")) {
        values.push($("input[name='ipl-keys_limit_count']").val().trim());
    }
    
    if ($("#ipl-permissions_limit").is(":checked")) {
        values.push($("input[name='ipl-permissions_limit_count']").val().trim());
    }

    const hasEmpty = values.includes("") || values.includes(undefined);

    if (hasEmpty) {
        $('.housing_creator div[data-type="configuration-ipl"] .text > div > .save').removeClass("allowed");
    } else {
        $('.housing_creator div[data-type="configuration-ipl"] .text > div > .save').addClass("allowed");
    }
}
$(`
    .housing_creator div[data-type="configuration-ipl"] .mt-2 > input,
    input#ipl-building,
    input#ipl-motel,
    input#ipl-__garage,
    input#ipl-__parking,
    input#ipl-grass,
    input#ipl-sign,
    input#ipl-delivery_inside,
    input#ipl-delivery_outside,
    input#ipl-furniture_environment_outside,
    input#ipl-purchase_price,
    input#ipl-rent_price,
    input#ipl-keys_limit,
    input#ipl-permissions_limit
`).on("input change", checkIplInputs);
$('.housing_creator div[data-type="configuration-ipl"]').on('select2:select', 'select', checkIplInputs);



// ███╗   ██╗███████╗██╗    ██╗    ███╗   ███╗██╗      ██████╗ 
// ████╗  ██║██╔════╝██║    ██║    ████╗ ████║██║     ██╔═══██╗
// ██╔██╗ ██║█████╗  ██║ █╗ ██║    ██╔████╔██║██║     ██║   ██║
// ██║╚██╗██║██╔══╝  ██║███╗██║    ██║╚██╔╝██║██║     ██║   ██║
// ██║ ╚████║███████╗╚███╔███╔╝    ██║ ╚═╝ ██║███████╗╚██████╔╝
// ╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝     ╚═╝     ╚═╝╚══════╝ ╚═════╝ 
$(document).on('click', '.housing_creator div[data-type="configuration-mlo"] > div > .side-boxes > .box > .options .inp-cbx', function(e) {
    let toggle = $(this).data('toggle');
    let isChecked = $(this).prop('checked');

    if ($(this).hasClass('not-allowed')) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).prop('checked', isChecked);
        return false;
    };

    if (toggle == "mlo-delivery_inside") {
        $('.inp-cbx[data-toggle="mlo-delivery_outside"]').prop('checked', false);
        $('input[name="mlo-delivery_coordinates"]').attr('value', '');
        
    } else if (toggle == "mlo-delivery_outside") {
        $('.inp-cbx[data-toggle="mlo-delivery_inside"]').prop('checked', false);
        $('input[name="mlo-delivery_coordinates"]').attr('value', '');
        
    } else if (toggle == "mlo-motel") {
        $('.inp-cbx[data-toggle="mlo-building"]').prop('checked', false);
        $('.housing_creator div[data-type="configuration-mlo"] .mlo-building > .mt-2 > select').prop('disabled', true);
        $('.housing_creator div[data-type="configuration-mlo"] .mlo-motel > .mt-2 > select').prop('disabled', !isChecked);
        
    } else if (toggle == "mlo-storage") {
        $('.housing_creator div[data-type="configuration-mlo"] .mlo-storage .metadata-elements > input[name="metadata-slots-value"]').prop('disabled', !isChecked);
        $('.housing_creator div[data-type="configuration-mlo"] .mlo-storage .metadata-elements > input[name="metadata-weight-value"]').prop('disabled', !isChecked);

    } else if (toggle == "mlo-__garage") {
        $('.inp-cbx[data-toggle="mlo-__parking"]').prop('checked', false);
        $('input[name="mlo-garage_point"]').attr('value', '');
        
    } else if (toggle == "mlo-__parking") {
        $('.inp-cbx[data-toggle="mlo-__garage"]').prop('checked', false);
        $('input[name="mlo-garage_point"]').attr('value', '');

    } else if (toggle == "mlo-keys_limit") {
        $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-keys_limit_count"]').prop('disabled', !isChecked);

    } else if (toggle == "mlo-permissions_limit") {
        $('.housing_creator div[data-type="configuration-mlo"] input[name="mlo-permissions_limit_count"]').prop('disabled', !isChecked);
        
    }
    
    $(`.housing_creator div[data-type="configuration-mlo"] > div > .side-boxes > .box > .options input[name="${toggle}"]`).prop('disabled', !isChecked);
});

$(document).on('click', '.housing_creator div[data-type="configuration-mlo"]>div>.side-boxes>.box > .options .mt-2 > .button, .housing_creator div[data-type="configuration-mlo"]>div>.side-boxes>.box>.options .mlo-doors .button', function(e) {
    if ($(this).hasClass('not-allowed')) return;

    let buttonAction = $(this).data('button-action');
    if (!buttonAction) return;

    let jsonData = {
        type: 'mlo',
        action: buttonAction.replace(/^mlo-?/, "")
    }

    if (buttonAction == "mlo-delivery_coordinates") {
        jsonData.isInside = $('.inp-cbx[data-toggle="mlo-delivery_inside"]').prop('checked');
        jsonData.isOutside = $('.inp-cbx[data-toggle="mlo-delivery_outside"]').prop('checked');        
        if (!jsonData.isInside && !jsonData.isOutside) return;
        
    } else if (buttonAction == "mlo-toggle_doorbell") {
        jsonData.doorId = $(this).data('door-id');
        if (!jsonData.doorId) return;
        
    } else if (buttonAction == "mlo-remove_door") {
        jsonData.doorId = $(this).data('door-id');
        if (!jsonData.doorId) return;
        
    } else if (buttonAction == "mlo-garage_point") {
        jsonData.isGarage = $('.inp-cbx[data-toggle="mlo-__garage"]').prop('checked');
        jsonData.isParking = $('.inp-cbx[data-toggle="mlo-__parking"]').prop('checked');
        if (!jsonData.isGarage && !jsonData.isParking) return;

    } else if (buttonAction == "mlo-grass_coords") {
        jsonData.isGrassActive = $('.inp-cbx[data-toggle="mlo-grass"]').prop('checked');
        if (!jsonData.isGrassActive) return;

    } else if (buttonAction == "mlo-sign_point") {
        jsonData.isSign = $('.inp-cbx[data-toggle="mlo-sign"]').prop('checked');
        if (!jsonData.isSign) return;

    } else if (buttonAction == "mlo-wardrobe_point") {
        let isWardrobeActive = $('.inp-cbx[data-toggle="mlo-wardrobe"]').prop('checked');
        if (!isWardrobeActive) return;

    } else if (buttonAction == "mlo-storage_point") {
        let isStorageActive = $('.inp-cbx[data-toggle="mlo-storage"]').prop('checked');
        if (!isStorageActive) return;

    }

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
});

$(document).on('click', '.housing_creator div[data-type="configuration-mlo"]>div>.side-boxes>.box > .options .images-list #add-image', function(e) {
    let imageId = $(this).data('image-id');
    if (!imageId) return;
    
    let el = $(this).children('.img');
    let bg = $(el).css('background-image');
    bg = bg.replace(/^url\(["']?/, '').replace(/["']?\)$/, '');

    HousingCreator.ShowModal(
        (translation.creator['configuration_mlo']['image:modal'].title).format(imageId),
        undefined,
        `${bg == 'none' ? '' : `<img class="image-preview" src="${bg}">`}`,
        `
            <div id="accept" data-type="mlo" data-action="create-image-inside" data-image-id="${imageId}">${translation.creator['configuration_mlo']['image:modal']['btn.make_inside']}</div>
            <div id="accept" data-type="mlo" data-action="create-image-outside" data-image-id="${imageId}">${translation.creator['configuration_mlo']['image:modal']['btn.make_outside']}</div>
            ${bg != 'none' ? `
                <div id="accept" data-type="mlo" data-action="remove-image" data-image-id="${imageId}">${translation.creator['configuration_mlo']['image:modal']['btn.remove']}</div>
            ` : ''}
            <div id="cancel">${translation['button.cancel']}</div>
        `
    );
});

$(document).on('click', '.housing_creator div[data-type="configuration-mlo"] .text > div > .save.allowed', function(e) {
    let jsonData = {
        type: 'mlo',
        action: 'save'
    }
    
    if (HousingCreator.IsModifyingExisting) {
        jsonData.isModifying = HousingCreator.ModifyingIdentifier;
    }

    let isMotel = $('.inp-cbx[data-toggle="mlo-motel"]').prop("checked")
    if (isMotel) {
        let motel = $('.housing_creator div[data-type="configuration-mlo"] .mlo-motel select').select2('data')[0]
        if (motel != "0") {
            jsonData.motel = motel.id;
        }
    }
    
    jsonData.houseName = $('input[name="mlo-house_name"]').val();
    jsonData.houseDescription = $('textarea[name="mlo-house_description"]').val();
    
    jsonData.isDeliveryInside = $('.inp-cbx[data-toggle="mlo-delivery_inside"]').prop('checked');
    jsonData.isDeliveryOutside = $('.inp-cbx[data-toggle="mlo-delivery_outside"]').prop('checked');
    
    jsonData.allowFurnitureOutside = $('.inp-cbx[data-toggle="mlo-furniture_environment_outside"]').prop('checked');
    jsonData.allowFurnitureInside = $('.inp-cbx[data-toggle="mlo-furniture_environment_inside"]').prop('checked');
    
    jsonData.isGarage = $('.inp-cbx[data-toggle="mlo-__garage"]').prop('checked');
    jsonData.isParking = $('.inp-cbx[data-toggle="mlo-__parking"]').prop('checked');
    jsonData.isGrassActive = $('.inp-cbx[data-toggle="mlo-grass"]').prop('checked');
    jsonData.isSign = $('.inp-cbx[data-toggle="mlo-sign"]').prop('checked');
    jsonData.isWardrobe = $('.inp-cbx[data-toggle="mlo-wardrobe"]').prop('checked');
    jsonData.isStorage = $('.inp-cbx[data-toggle="mlo-storage"]').prop('checked');
    jsonData.storageSlots = $('.housing_creator div[data-type="configuration-mlo"] .mlo-storage .metadata-elements > input[name="metadata-slots-value"]').val();
    jsonData.storageWeight = $('.housing_creator div[data-type="configuration-mlo"] .mlo-storage .metadata-elements > input[name="metadata-weight-value"]').val();
    
    jsonData.isPurchase = $('.inp-cbx[data-toggle="mlo-purchase_price"]').prop('checked');
    jsonData.purchasePrice = getRawValue('input[name="mlo-purchase_price"]');
    
    jsonData.isRent = $('.inp-cbx[data-toggle="mlo-rent_price"]').prop('checked');
    jsonData.rentPrice = getRawValue('input[name="mlo-rent_price"]');
    
    jsonData.isKeysLimit = $('.inp-cbx[data-toggle="mlo-keys_limit"]').prop('checked');
    jsonData.keysLimit = $('input[name="mlo-keys_limit_count"]').val();
    
    jsonData.isPermissionsLimit = $('.inp-cbx[data-toggle="mlo-permissions_limit"]').prop('checked');
    jsonData.permissionsLimit = $('input[name="mlo-permissions_limit_count"]').val();

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
});

$(document).on('click', '.housing_creator div[data-type="configuration-mlo"] .text > div > .delete', function(e) {    
    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
        type: 'mlo',
        action: 'delete',
        id: HousingCreator.ModifyingIdentifier
    }));
    // updateSection('.housing_creator', 'all-properties');
});

function checkMloInputs() {
    let motel = $('.housing_creator div[data-type="configuration-mlo"] .mlo-motel select').select2('data')[0]
    let motelClasses = $(`
        input[name="mlo-yard_zone"],
        .button[data-button-action="mlo-yard_zone"],

        label[for="mlo-delivery_outside"],
        input[data-toggle="mlo-delivery_outside"],
        
        label[for="mlo-furniture_environment_outside"],
        input[data-toggle="mlo-furniture_environment_outside"],

        label[for="mlo-__garage"],
        input[data-toggle="mlo-__garage"],

        label[for="mlo-__parking"],
        input[data-toggle="mlo-__parking"],
        
        input[name="mlo-garage_point"],
        .button[data-button-action="mlo-garage_point"],

        label[for="mlo-grass"],
        input[data-toggle="mlo-grass"],
        input[name="mlo-grass_coords"],
        .button[data-button-action="mlo-grass_coords"],

        label[for="mlo-sign"],
        input[data-toggle="mlo-sign"],
        input[name="mlo-sign_point"],
        .button[data-button-action="mlo-sign_point"]
    `);

    let isMotel = false;
    if ($("#mlo-motel").is(":checked")) {
        if (motel.id != '0') {
            isMotel = true;
            motelClasses.addClass('not-allowed');
            $('input[data-toggle="mlo-delivery_outside"]').prop('checked', false);
            $('input[data-toggle="mlo-furniture_environment_outside"]').prop('checked', false);
            $('input[data-toggle="mlo-__garage"]').prop('checked', false);
            $('input[data-toggle="mlo-__parking"]').prop('checked', false);
        } else {
            motelClasses.removeClass('not-allowed');
        }
    } else {
        motelClasses.removeClass('not-allowed');
    }

    let inputs = $(`
        input[name='mlo-name'], 
        input[name='mlo-address'], 
        input[name='mlo-region'], 
        input[name='mlo-house_name'], 
        input[name='mlo-yard_zone'], 
        input[name='mlo-interior_zone'], 
        input[name='mlo-menu_point'],
        input[name="mlo-grass"],
        input[name="mlo-sign"]
    `);
    
    if (isMotel) {
        inputs = $(`
            input[name='mlo-name'], 
            input[name='mlo-address'], 
            input[name='mlo-region'], 
            input[name='mlo-house_name'], 
            input[name='mlo-interior_zone'], 
            input[name='mlo-menu_point']
        `);
    }
    
    let values = inputs.map(function () {
        return $(this).val().trim();
    }).get();

    if ($("#mlo-motel").is(":checked")) {
        if (motel.id == '0') {
            values.push("");
        }
    }

    if (!isMotel) {
        if ($("#mlo-__garage").is(":checked") || $("#mlo-__parking").is(":checked")) {
            values.push($("input[name='mlo-garage_point']").val().trim());
        }

        if ($("#mlo-grass").is(":checked")) {
            values.push($("input[name='mlo-grass_coords']").val().trim());
        }

        if ($("#mlo-sign").is(":checked")) {
            values.push($("input[name='mlo-sign_point']").val().trim());
        }
    }

    if ($("#mlo-purchase_price").is(":checked")) {
        values.push($("input[name='mlo-purchase_price']").val().trim());
    }
    
    if ($("#mlo-rent_price").is(":checked")) {
        values.push($("input[name='mlo-rent_price']").val().trim());
    }

    if ($("#mlo-keys_limit").is(":checked")) {
        values.push($("input[name='mlo-keys_limit_count']").val().trim());
    }
    
    if ($("#mlo-permissions_limit").is(":checked")) {
        values.push($("input[name='mlo-permissions_limit_count']").val().trim());
    }

    const hasEmpty = values.includes("") || values.includes(undefined);

    if (hasEmpty) {
        $('.housing_creator div[data-type="configuration-mlo"] .text > div > .save').removeClass("allowed");
    } else {
        $('.housing_creator div[data-type="configuration-mlo"] .text > div > .save').addClass("allowed");
    }
}
$(`
    .housing_creator div[data-type="configuration-mlo"] .mt-2 > input,
    input#mlo-motel,
    input#mlo-__garage,
    input#mlo-__parking,
    input#mlo-grass,
    input#mlo-sign,
    input#mlo-delivery_inside,
    input#mlo-delivery_outside,
    input#mlo-purchase_price,
    input#mlo-rent_price,
    input#mlo-keys_limit,
    input#mlo-permissions_limit
`).on("input change", checkMloInputs);
$('.housing_creator div[data-type="configuration-mlo"]').on('select2:select', 'select', checkMloInputs);



// ███╗   ██╗███████╗██╗    ██╗    ██████╗ ██╗   ██╗██╗██╗     ██████╗ ██╗███╗   ██╗ ██████╗ 
// ████╗  ██║██╔════╝██║    ██║    ██╔══██╗██║   ██║██║██║     ██╔══██╗██║████╗  ██║██╔════╝ 
// ██╔██╗ ██║█████╗  ██║ █╗ ██║    ██████╔╝██║   ██║██║██║     ██║  ██║██║██╔██╗ ██║██║  ███╗
// ██║╚██╗██║██╔══╝  ██║███╗██║    ██╔══██╗██║   ██║██║██║     ██║  ██║██║██║╚██╗██║██║   ██║
// ██║ ╚████║███████╗╚███╔███╔╝    ██████╔╝╚██████╔╝██║███████╗██████╔╝██║██║ ╚████║╚██████╔╝
// ╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝     ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
$(document).on('click', '.housing_creator div[data-type="configuration-building"] > div > .side-boxes > .box > .options > div .inp-cbx', function(e) {
    let toggle = $(this).data('toggle');
    let isChecked = $(this).prop('checked');

    if ($(this).hasClass('not-allowed')) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).prop('checked', isChecked);
        return false;
    };

    if (toggle == "building-__underground_parking") {
        $('input[name="building-underground_parking_floors"]').prop('disabled', !isChecked);
    }

    $(`.housing_creator div[data-type="configuration-building"] > div > .side-boxes > .box > .options input[name="${toggle}"]`).prop('disabled', !isChecked);
});

$(document).on('click', '.housing_creator div[data-type="configuration-building"]>div>.side-boxes>.box > .options .mt-2 > .button', function(e) {
    if ($(this).hasClass('not-allowed')) return;

    let buttonAction = $(this).data('button-action');
    if (!buttonAction) return;
    
    let jsonData = {
        type: 'building',
        action: buttonAction.replace(/^building-?/, "")
    }

    if (buttonAction == 'building-enter_garage_point' && !$('.inp-cbx[data-toggle="building-__underground_parking"]').prop('checked')) {
        return
    }

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
})

$(document).on('click', '.housing_creator div[data-type="configuration-building"] .text > div > .save.allowed', function(e) {
    let jsonData = {
        type: 'building',
        action: 'save'
    }
    
    if (HousingCreator.IsModifyingExisting) {
        jsonData.isModifying = HousingCreator.ModifyingIdentifier;
    }
    
    jsonData.buildingName = $('input[name="building-name"]').val();
    
    jsonData.apartmentParking = $('.inp-cbx[data-toggle="building-__underground_parking"]').prop('checked');
    jsonData.parkingFloors = $('input[name="building-underground_parking_floors"]').val();
    
    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
})

$(document).on('click', '.housing_creator div[data-type="configuration-building"] .text > div > .delete', function(e) {
    HousingCreator.ShowModal(
        translation.creator['delete_object:modal'].title,
        (translation.creator['delete_object:modal'].description).format(translation.creator['new_property']['type:building']),
        undefined,
        `
            <div
                id="accept"
                data-type="building"
                data-action="confirm-delete"
            >
                ${translation.creator['delete_object:modal']['btn.yes']}
            </div>
            <div id="cancel">${translation['button.cancel']}</div>
        `
    );
})

function checkBuildingInputs() {
    const inputs = $(`
        input[name='building-address'], 
        input[name='building-region'], 
        input[name='building-name'], 
        input[name='building-yard_zone'], 
        input[name='building-enter_point'], 
        input[name='building-exit_point']
    `);

    let values = inputs.map(function () {
        return $(this).val().trim();
    }).get();

    if ($("#building-__garage").is(":checked")) {
        values.push($("input[name='building-garage_point']").val().trim());
    }
    if ($("#building-__underground_parking").is(":checked")) {
        values.push($("input[name='building-underground_parking_floors']").val().trim());
        values.push($("input[name='building-enter_garage_point']").val().trim());
    }

    const hasEmpty = values.includes("") || values.includes(undefined);

    if (hasEmpty) {
        $('.housing_creator div[data-type="configuration-building"] .text > div > .save').removeClass("allowed");
    } else {
        $('.housing_creator div[data-type="configuration-building"] .text > div > .save').addClass("allowed");
    }
}
$(`
    .housing_creator div[data-type="configuration-building"] .mt-2 > input,
    input#building-__garage,
    input#building-__underground_parking
`).on("input change", checkBuildingInputs);
$('.housing_creator div[data-type="configuration-building"]').on('select2:select', 'select', checkBuildingInputs);



// ███╗   ██╗███████╗██╗    ██╗    ███╗   ███╗ ██████╗ ████████╗███████╗██╗     
// ████╗  ██║██╔════╝██║    ██║    ████╗ ████║██╔═══██╗╚══██╔══╝██╔════╝██║     
// ██╔██╗ ██║█████╗  ██║ █╗ ██║    ██╔████╔██║██║   ██║   ██║   █████╗  ██║     
// ██║╚██╗██║██╔══╝  ██║███╗██║    ██║╚██╔╝██║██║   ██║   ██║   ██╔══╝  ██║     
// ██║ ╚████║███████╗╚███╔███╔╝    ██║ ╚═╝ ██║╚██████╔╝   ██║   ███████╗███████╗
// ╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝     ╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚══════╝╚══════╝
$(document).on('click', '.housing_creator div[data-type="configuration-motel"] > div > .side-boxes > .box > .options > div .inp-cbx', function(e) {
    let toggle = $(this).data('toggle');
    let isChecked = $(this).prop('checked');

    if ($(this).hasClass('not-allowed')) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).prop('checked', isChecked);
        return false;
    };
    
    $(`.housing_creator div[data-type="configuration-motel"] > div > .side-boxes > .box > .options input[name="${toggle}"]`).prop('disabled', !isChecked);
});

$(document).on('click', '.housing_creator div[data-type="configuration-motel"]>div>.side-boxes>.box > .options .mt-2 > .button', function(e) {
    if ($(this).hasClass('not-allowed')) return;

    let buttonAction = $(this).data('button-action');
    if (!buttonAction) return;
    
    let jsonData = {
        type: 'motel',
        action: buttonAction.replace(/^motel-?/, "")
    }

    if (buttonAction == "motel-reception_point") {
        let isReceptionActive = $('.inp-cbx[data-toggle="motel-reception"]').prop('checked');
        if (!isReceptionActive) return;
    }

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
})

$(document).on('click', '.housing_creator div[data-type="configuration-motel"] .text > div > .save.allowed', function(e) {
    let jsonData = {
        type: 'motel',
        action: 'save'
    }
    
    if (HousingCreator.IsModifyingExisting) {
        jsonData.isModifying = HousingCreator.ModifyingIdentifier;
    }

    jsonData.motelName = $('input[name="motel-name"]').val();
    jsonData.isReception = $('.inp-cbx[data-toggle="motel-reception"]').prop('checked');

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
})

$(document).on('click', '.housing_creator div[data-type="configuration-motel"] .text > div > .delete', function(e) {
    HousingCreator.ShowModal(
        translation.creator['delete_object:modal'].title,
        (translation.creator['delete_object:modal'].description).format(translation.creator['new_property']['type:motel']),
        undefined,
        `
            <div
                id="accept"
                data-type="building"
                data-action="confirm-delete"
            >
                ${translation.creator['delete_object:modal']['btn.yes']}
            </div>
            <div id="cancel">${translation['button.cancel']}</div>
        `
    );
})

function checkMotelInputs() {
    const inputs = $(`
        input[name='motel-address'], 
        input[name='motel-region'], 
        input[name='motel-name'], 
        input[name='motel-yard_zone']
    `);

    let values = inputs.map(function () {
        return $(this).val().trim();
    }).get();

    const hasEmpty = values.includes("") || values.includes(undefined);

    if (hasEmpty) {
        $('.housing_creator div[data-type="configuration-motel"] .text > div > .save').removeClass("allowed");
    } else {
        $('.housing_creator div[data-type="configuration-motel"] .text > div > .save').addClass("allowed");
    }
}
$(`
    .housing_creator div[data-type="configuration-motel"] .mt-2 > input
`).on("input change", checkMotelInputs);
$('.housing_creator div[data-type="configuration-motel"]').on('select2:select', 'select', checkMotelInputs);



// ███╗   ██╗███████╗██╗    ██╗    ███████╗██╗   ██╗██████╗ ███╗   ██╗██╗████████╗██╗   ██╗██████╗ ███████╗
// ████╗  ██║██╔════╝██║    ██║    ██╔════╝██║   ██║██╔══██╗████╗  ██║██║╚══██╔══╝██║   ██║██╔══██╗██╔════╝
// ██╔██╗ ██║█████╗  ██║ █╗ ██║    █████╗  ██║   ██║██████╔╝██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝█████╗  
// ██║╚██╗██║██╔══╝  ██║███╗██║    ██╔══╝  ██║   ██║██╔══██╗██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗██╔══╝  
// ██║ ╚████║███████╗╚███╔███╔╝    ██║     ╚██████╔╝██║  ██║██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║███████╗
// ╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝     ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
$(document).on('click', '.housing_creator div[data-type="configuration-furniture"] .mt-4 div[data-tag]', function(e) {
    if ($(this).hasClass('active')) {
        $('.housing_creator div[data-type="configuration-furniture"] .mt-4 div[data-tag]').removeClass('active');
    } else {
        $('.housing_creator div[data-type="configuration-furniture"] .mt-4 div[data-tag]').removeClass('active');
        $(this).addClass('active');
    }
})

$(document).on('click', '.housing_creator div[data-type="configuration-furniture"] > div > .side-boxes > .box > .options > div .inp-cbx', function(e) {
    let toggle = $(this).data('toggle');
    let isChecked = $(this).prop('checked');

    if (toggle == "furniture-delivery_small") {
        $('.inp-cbx[data-toggle="furniture-delivery_medium"]').prop('checked', false);
        $('.inp-cbx[data-toggle="furniture-delivery_big"]').prop('checked', false);
        
    } else if (toggle == "furniture-delivery_medium") {
        $('.inp-cbx[data-toggle="furniture-delivery_small"]').prop('checked', false);
        $('.inp-cbx[data-toggle="furniture-delivery_big"]').prop('checked', false);
        
    } else if (toggle == "furniture-delivery_big") {
        $('.inp-cbx[data-toggle="furniture-delivery_small"]').prop('checked', false);
        $('.inp-cbx[data-toggle="furniture-delivery_medium"]').prop('checked', false);

    }
    
    $(`.housing_creator div[data-type="configuration-furniture"] > div > .side-boxes > .box > .options input[name="${toggle}"]`).prop('disabled', !isChecked);
});

$(document).on('click', '.housing_creator div[data-type="configuration-furniture"] .text > div > .save', function(e) {
    let jsonData = {
        type: 'furniture',
        action: 'save',
        model: HousingCreator.ModifyingIdentifier,
    }
    
    jsonData.label = $('input[name="furniture-label"]').val();
    jsonData.price = $('input[name="furniture-price"]').val();

    let selectedTag = "";
    if ($('.housing_creator div[data-type="configuration-furniture"]>div>.side-boxes>.box > .options .mt-4 > div[data-tag].active')) {
        selectedTag = $('.housing_creator div[data-type="configuration-furniture"]>div>.side-boxes>.box > .options .mt-4 > div[data-tag].active').data('tag');
    }
    jsonData.tag = selectedTag;

    jsonData.isFurnitureInside = $('.inp-cbx[data-toggle="furniture-inside"]').prop('checked');
    jsonData.isFurnitureOutside = $('.inp-cbx[data-toggle="furniture-outside"]').prop('checked');
    
    jsonData.isSmallDelivery = $('.inp-cbx[data-toggle="furniture-delivery_small"]').prop('checked');
    jsonData.isMediumDelivery = $('.inp-cbx[data-toggle="furniture-delivery_medium"]').prop('checked');
    jsonData.isBigDelivery = $('.inp-cbx[data-toggle="furniture-delivery_big"]').prop('checked');

    jsonData.interactableName = $('.housing_creator div[data-type="configuration-furniture"] select[name="furniture-interactable-name"]').select2('data')[0].id;
    if (jsonData.interactableName == 0 || jsonData.interactableName == "0") jsonData.interactableName = null;

    if (jsonData.interactableName && config.configuratorFurnitureMetadata[jsonData.interactableName]) {
        jsonData.metadata = {};
        config.configuratorFurnitureMetadata[jsonData.interactableName].forEach(element => {
            jsonData.metadata[element.key] = $(`.housing_creator div[data-type="configuration-furniture"] input[name="metadata-${element.key}-value"]`).val();
            if (element.key == 'slots' || element.key == 'weight') {
                jsonData.metadata[element.key] = Number(jsonData.metadata[element.key])
            }
        });
    }

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
    setTimeout(() => {
        updateSection('.housing_creator', 'all-furniture');
    }, 500);
})

$(document).on('click', '.housing_creator div[data-type="configuration-furniture"] .text > div > .delete', function(e) {
    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
        type: 'furniture',
        action: 'delete',
        model: HousingCreator.ModifyingIdentifier
    }));
    setTimeout(() => {
        updateSection('.housing_creator', 'all-furniture');
    }, 500);
})



//  ██████╗██████╗ ███████╗ █████╗ ████████╗███████╗    ███╗   ██╗███████╗██╗    ██╗    ███████╗██╗  ██╗███████╗██╗     ██╗     
// ██╔════╝██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝    ████╗  ██║██╔════╝██║    ██║    ██╔════╝██║  ██║██╔════╝██║     ██║     
// ██║     ██████╔╝█████╗  ███████║   ██║   █████╗      ██╔██╗ ██║█████╗  ██║ █╗ ██║    ███████╗███████║█████╗  ██║     ██║     
// ██║     ██╔══██╗██╔══╝  ██╔══██║   ██║   ██╔══╝      ██║╚██╗██║██╔══╝  ██║███╗██║    ╚════██║██╔══██║██╔══╝  ██║     ██║     
// ╚██████╗██║  ██║███████╗██║  ██║   ██║   ███████╗    ██║ ╚████║███████╗╚███╔███╔╝    ███████║██║  ██║███████╗███████╗███████╗
//  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝    ╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
$(document).on('click', '.housing_creator div[data-type="create-new-shell"] .mt-4 div[data-tag]', function(e) {
    if ($(this).hasClass('not-allowed')) return;

    if ($(this).hasClass('active')) {
        $(this).removeClass('active');
    } else {
        $(this).addClass('active');
    }

    checkCreateShellInputs()
})

$(document).on('click', `
    .housing_creator div[data-type="create-new-shell"] > div > .side-boxes > .box > .options .mt-2 > .button,
    .housing_creator div[data-type="create-new-shell"] > div > .side-boxes > .box > .options .static-interactions .button,
    .housing_creator > div > .menu > #modify-interaction .buttons > .button,
    .housing_creator > div > .menu > #modify-interaction .data .mt-2 > .button
`, function(e) {
    if ($(this).hasClass('not-allowed')) return;

    let buttonAction = $(this).data('button-action');
    if (!buttonAction) return;
    
    let jsonData = {
        type: 'create-shell',
        action: buttonAction.replace(/^create-shell-?/, "")
    }

    if (buttonAction == "create-shell-model") {
        jsonData.model = $('input[name="create-shell-model"]').val();
        if (!jsonData.model) return;

    } else if (buttonAction == "create-shell-remove_interaction") {
        jsonData.interactionId = $(this).data('interaction-id');
        if (!jsonData.interactionId) return;
        
    } else if (buttonAction == "create-shell-modify_interaction") {
        jsonData.interactionId = $(this).data('interaction-id');
        if (!jsonData.interactionId) return;
        
    } else if (
        buttonAction == "create-shell-create_sink_action_1" ||
        buttonAction == "create-shell-create_sink_action_2" ||
        buttonAction == "create-shell-create_shower"
    ) {
        jsonData.interactionId = $(this).data('interaction-id');
        if (!jsonData.interactionId) return;

    } else if (buttonAction == "create-shell-remove_interaction_option") {
        jsonData.interactionId = $(this).data('interaction-id');
        jsonData.optionId = $(this).data('option-id');
        if (!jsonData.interactionId || !jsonData.optionId) return;
        
    }

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
})

$(document).on('click', '.housing_creator div[data-type="create-new-shell"] .save', function(e) {
    let jsonData = {
        type: 'furniture',
        action: 'save',
        model: HousingCreator.ModifyingIdentifier,
    }
    
    jsonData.label = $('input[name="furniture-label"]').val();
    jsonData.price = $('input[name="furniture-price"]').val();

    let selectedTag = "";
    if ($('.housing_creator div[data-type="configuration-furniture"]>div>.side-boxes>.box > .options .mt-4 > div[data-tag].active')) {
        selectedTag = $('.housing_creator div[data-type="configuration-furniture"]>div>.side-boxes>.box > .options .mt-4 > div[data-tag].active').data('tag');
    }
    jsonData.tag = selectedTag;

    jsonData.isFurnitureInside = $('.inp-cbx[data-toggle="furniture-inside"]').prop('checked');
    jsonData.isFurnitureOutside = $('.inp-cbx[data-toggle="furniture-outside"]').prop('checked');
    
    jsonData.isSmallDelivery = $('.inp-cbx[data-toggle="furniture-delivery_small"]').prop('checked');
    jsonData.isMediumDelivery = $('.inp-cbx[data-toggle="furniture-delivery_medium"]').prop('checked');
    jsonData.isBigDelivery = $('.inp-cbx[data-toggle="furniture-delivery_big"]').prop('checked');

    jsonData.interactableName = $('.housing_creator div[data-type="configuration-furniture"] select[name="furniture-interactable-name"]').select2('data')[0].id;
    if (jsonData.interactableName == 0 || jsonData.interactableName == "0") jsonData.interactableName = null;

    if (jsonData.interactableName && config.configuratorFurnitureMetadata[jsonData.interactableName]) {
        jsonData.metadata = {};
        config.configuratorFurnitureMetadata[jsonData.interactableName].forEach(element => {
            jsonData.metadata[element.key] = $(`.housing_creator div[data-type="configuration-furniture"] input[name="metadata-${element.key}-value"]`).val();
            if (element.key == 'slots' || element.key == 'weight') {
                jsonData.metadata[element.key] = Number(jsonData.metadata[element.key])
            }
        });
    }

    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify(jsonData));
    setTimeout(() => {
        updateSection('.housing_creator', 'all-furniture');
    }, 500);
})

$(document).on('click', '.housing_creator > div > .menu > #modify-interaction', function(e) {
    if (!$(e.target).closest('#modify-interaction > div').length) {
        $('.housing_creator>div>.menu>#modify-interaction').fadeOut(120);
    }
})

$(document).on('click', '.housing_creator div[data-type="create-new-shell"] .configuration-file .copy', function() {
    const txt = document.querySelector('#create-shell-code').value;
    copy(txt);
    $.post(`https://${GetParentResourceName()}/sendNotification`, JSON.stringify({name: 'notify.creator:copied_code', type: 'success'}));
});

function checkCreateShellInputs() {
    const root = $('.housing_creator div[data-type="create-new-shell"]');

    const sModelInput = root.find('input[name="create-shell-model"]').val();
    const sLabelInput = root.find('input[name="create-shell-label"]').val();
    const sRoomsInput = root.find('input[name="create-shell-rooms"]').val() || 0;

    const doorsJSONtxt = root.find('input[name="create-shell-doors"]').val() || '[]';
    const interJSONtxt = root.find('textarea[name="create-shell-interactions--temp"]').val() || '[]';

    const doorsJSON = parseJSONsafe(doorsJSONtxt, []);
    const interJSON = parseJSONsafe(interJSONtxt, []);

    const doorsLua = toLua(doorsJSON, 1);
    const interactLua = toLua(interJSON, 1);

    const sTags = Array.from(document.querySelectorAll('.housing_creator div[data-type="create-new-shell"] #tags [data-tag].active'))
        .map(el => `'${el.getAttribute('data-tag')}'`)
        .join(', ');

    const luaOut = (CreatorShellTemplate).format(
        sModelInput,
        sTags,
        esc(sLabelInput),
        esc(sModelInput),
        sRoomsInput,
        doorsLua,
        interactLua
    ).trimStart();

    root.find('> div > .side-boxes > .box > .options > .configuration-file > textarea').val(luaOut);
}
$(`.housing_creator div[data-type="create-new-shell"] .mt-2 > input`).on("input change", checkCreateShellInputs);



// ███████╗██╗   ██╗██████╗ ███╗   ██╗██╗████████╗██╗   ██╗██████╗ ███████╗
// ██╔════╝██║   ██║██╔══██╗████╗  ██║██║╚══██╔══╝██║   ██║██╔══██╗██╔════╝
// █████╗  ██║   ██║██████╔╝██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝█████╗  
// ██╔══╝  ██║   ██║██╔══██╗██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗██╔══╝  
// ██║     ╚██████╔╝██║  ██║██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║███████╗
// ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
$(document).on('click', '.housing_creator div[data-type="all-furniture"] > div > .side-boxes > .box .text .title.button-create', function(e) {
    $('.housing_creator>div>.menu>#register-new-furniture').fadeIn(120);
})

$(document).on('click', '.housing_creator > div > .menu > #register-new-furniture > div > .buttons > div', function(e) {
    let props = [];

    for (const [k, v] of Object.entries(propsList.value)) {
        props.push(v.value)
    }

    const makePhotos = $('.inp-cbx[data-toggle="make-photos-furniture"]').prop('checked');
    
    $.post(`https://${GetParentResourceName()}/creator:actionButton`, JSON.stringify({
        type: 'furniture',
        action: 'register',
        props: props,
        makePhotos: makePhotos
    }));

    propsList.removeAllTags()
})

$(document).on('click', '.housing_creator > div > .menu > #register-new-furniture', function(e) {
    if (!$(e.target).closest('#register-new-furniture > div').length) {
        $('.housing_creator>div>.menu>#register-new-furniture').fadeOut(120);
        propsList.removeAllTags()
    }
})

$(document).on('keypress', '.housing_creator div[data-type="all-furniture"] > div > .side-boxes > .box .text input', function (e) {
    if (e.key === "Enter") {
        e.preventDefault();
        
        const searchTerm = $(this).val().trim().toLowerCase();
        HousingCreator.Pagination.CurrentPage = 1;
        HousingCreator.Pagination.SearchTerm = searchTerm;

        if (searchTerm === "") {
            HousingCreator.Pagination.ArrayFiltered = [];
            HousingCreator.RenderPagination('all-furniture');
            return;
        }

        HousingCreator.Pagination.ArrayFiltered = HousingCreator.Pagination.Array.filter(item => {
            return item.label.toLowerCase().includes(searchTerm) || item.model.toLowerCase().includes(searchTerm);
        });

        HousingCreator.RenderPagination('all-furniture');
    }
});

$('.housing_creator .main > div[data-type="all-furniture"] #prev-page').click(function() {
    if (HousingCreator.Pagination.CurrentPage > 1) {
        HousingCreator.Pagination.CurrentPage--;
        HousingCreator.RenderPagination('all-furniture');
        HousingCreator.UpdatePagination('all-furniture');
    }
});

$('.housing_creator .main > div[data-type="all-furniture"] #next-page').click(function() {
    if (HousingCreator.Pagination.CurrentPage < Math.ceil((HousingCreator.Pagination.SearchTerm != "" ? HousingCreator.Pagination.ArrayFiltered.length : HousingCreator.Pagination.Array.length) / HousingCreator.Pagination.ItemsPerPage)) {
        HousingCreator.Pagination.CurrentPage++;
        HousingCreator.RenderPagination('all-furniture');
        HousingCreator.UpdatePagination('all-furniture');
    }
});

$('.housing_creator').on('select2:select', 'select[name="furniture-interactable-name"]', function (e) {
    let interableName = $(this).select2('data')[0]

    $('.housing_creator div[data-type="configuration-furniture"] .metadata-list').hide();
    $('.housing_creator div[data-type="configuration-furniture"] .metadata-elements').empty();
    
    
    if (interableName.id && interableName.id != '0' && config.configuratorFurnitureMetadata[interableName.id]) {
        let metadataElementsHTML = '';
     
        config.configuratorFurnitureMetadata[interableName.id].forEach(element => {
            metadataElementsHTML += `
                <input name="metadata-${element.key}-key" type="text" value="${element.key}" disabled>
                <input name="metadata-${element.key}-value" type="${element.allowedValue || "text"}" value="${element.defaultValue}">
            `
        });

        $('.housing_creator div[data-type="configuration-furniture"] .metadata-list').show();
        $('.housing_creator div[data-type="configuration-furniture"] .metadata-elements').html(metadataElementsHTML);
    }
});


// ██████╗ ██████╗  ██████╗ ██████╗ ███████╗██████╗ ████████╗██╗███████╗███████╗
// ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██║██╔════╝██╔════╝
// ██████╔╝██████╔╝██║   ██║██████╔╝█████╗  ██████╔╝   ██║   ██║█████╗  ███████╗
// ██╔═══╝ ██╔══██╗██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗   ██║   ██║██╔══╝  ╚════██║
// ██║     ██║  ██║╚██████╔╝██║     ███████╗██║  ██║   ██║   ██║███████╗███████║
// ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚══════╝╚══════╝
const filterAllProperties = function(searchTerm) {
    HousingCreator.Pagination.CurrentPage = 1;
    HousingCreator.Pagination.SearchTerm = searchTerm;

    if (searchTerm === "" && HousingCreator.Pagination.ActiveFilters < 1) {
        HousingCreator.Pagination.ArrayFiltered = [];
        HousingCreator.RenderPagination('all-properties');
        return;
    }

    HousingCreator.Pagination.ArrayFiltered = HousingCreator.Pagination.Array.filter(item => {
        if (HousingCreator.Pagination.ActiveFilters.includes('exclude_starting_apartments') && item.object_id == startingApartmentObjectId) {
            return false
        };

        if (searchTerm === "") return true;
        
        const searchName = item.name.toLowerCase().includes(searchTerm);
        const searchAddress = item.address.toLowerCase().includes(searchTerm);
        const searchOwner = (item.owner && item.owner.toLowerCase().includes(searchTerm));
        const searchRenter = (item.renter && item.renter.toLowerCase().includes(searchTerm));

        return searchName || searchAddress || searchOwner || searchRenter;
    });

    HousingCreator.RenderPagination('all-properties');
}

$(document).on('keypress', '.housing_creator div[data-type="all-properties"] > div > .side-boxes > .box .text input', function (e) {
    if (e.key === "Enter") {
        e.preventDefault();
        
        const searchTerm = $(this).val().trim().toLowerCase();
        filterAllProperties(searchTerm);
        
        // const searchTerm = $(this).val().trim().toLowerCase();
        // HousingCreator.Pagination.CurrentPage = 1;
        // HousingCreator.Pagination.SearchTerm = searchTerm;

        // if (searchTerm === "") {
        //     HousingCreator.Pagination.ArrayFiltered = [];
        //     HousingCreator.RenderPagination('all-properties');
        //     return;
        // }

        // HousingCreator.Pagination.ArrayFiltered = HousingCreator.Pagination.Array.filter(item => {
        //     if (HousingCreator.Pagination.ActiveFilters['exclude_starting_apartments'] && item.object_id == startingApartmentObjectId) return false;
        //     return item.name.toLowerCase().includes(searchTerm) || item.address.toLowerCase().includes(searchTerm) || (item.owner && item.owner.toLowerCase().includes(searchTerm)) || (item.renter && item.renter.toLowerCase().includes(searchTerm));
        // });

        // HousingCreator.RenderPagination('all-properties');
    }
});

$(document).on('click', '.housing_creator div[data-type="all-properties"] > div > .side-boxes > .box .text .filters', function (e) {
    HousingCreator.ShowModal(
        translation.creator.all_properties['filters:modal'].title,
        `
            ${renderCheckbox(
                'filter_properties-exclude_starting_apartments',
                translation.creator.all_properties['filters:modal']['option.exclude_starting_apartments'],
                HousingCreator.Pagination.ActiveFilters.includes('exclude_starting_apartments')
            )}
        `,
        null,
        `
            <div id="accept" data-action="apply-properties-filters">${translation.creator.all_properties['filters:modal']['btn.apply']}</div>
            <div id="cancel">${translation['button.cancel']}</div>
        `
    );
});


$('.housing_creator .main > div[data-type="all-properties"] #prev-page').click(function() {
    if (HousingCreator.Pagination.CurrentPage > 1) {
        HousingCreator.Pagination.CurrentPage--;
        HousingCreator.RenderPagination('all-properties');
        HousingCreator.UpdatePagination('all-properties');
    }
});

$('.housing_creator .main > div[data-type="all-properties"] #next-page').click(function() {
    if (HousingCreator.Pagination.CurrentPage < Math.ceil(((HousingCreator.Pagination.SearchTerm != "" || HousingCreator.Pagination.ActiveFilters.length >= 1) ? HousingCreator.Pagination.ArrayFiltered.length : HousingCreator.Pagination.Array.length) / HousingCreator.Pagination.ItemsPerPage)) {
        HousingCreator.Pagination.CurrentPage++;
        HousingCreator.RenderPagination('all-properties');
        HousingCreator.UpdatePagination('all-properties');
    }
});


// ██████╗ ███████╗ █████╗ ██╗         ███████╗███████╗████████╗ █████╗ ████████╗███████╗
// ██╔══██╗██╔════╝██╔══██╗██║         ██╔════╝██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██╔════╝
// ██████╔╝█████╗  ███████║██║         █████╗  ███████╗   ██║   ███████║   ██║   █████╗  
// ██╔══██╗██╔══╝  ██╔══██║██║         ██╔══╝  ╚════██║   ██║   ██╔══██║   ██║   ██╔══╝  
// ██║  ██║███████╗██║  ██║███████╗    ███████╗███████║   ██║   ██║  ██║   ██║   ███████╗
// ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝    ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚══════╝
$(document).on('click', '.housing_creator div[data-type="company-properties"] #properties-list .buttons > #terminate-now-property', function (e) {
    const propertyId = $(this).data('property-id');
    $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
        action: 'terminateNow',
        propertyId: propertyId,
    }));
})

$(document).on('click', '.housing_creator div[data-type="company-properties"] #properties-list .buttons > #termination-property', function (e) {
    const propertyId = $(this).data('property-id');
    $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
        action: 'terminate',
        propertyId: propertyId,
    }));
})

$(document).on('click', '.housing_creator div[data-type="company-properties"] #properties-list .buttons > #cancel-termination-property', function (e) {
    const propertyId = $(this).data('property-id');
    $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
        action: 'cancelTermination',
        propertyId: propertyId,
    }));
})

$(document).on('click', '.housing_creator div[data-type="company-properties"] #properties-list .buttons > #transaction-property', function (e) {
    const propertyId = $(this).data('property-id');
    if (HousingCreator.AllowSellProperties && HousingCreator.AllowRentProperties) {
        HousingCreator.ShowModal(
            translation.realestate.company_properties['transaction:modal'].title,
            undefined,
            undefined,
            `
                <div id="accept" data-property-id="${propertyId}" data-action="transaction-sale">${translation.realestate.company_properties['transaction:modal']['btn.sale']}</div>
                <div id="accept" data-property-id="${propertyId}" data-action="transaction-rent">${translation.realestate.company_properties['transaction:modal']['btn.rent']}</div>
                <div id="cancel">${translation['button.cancel']}</div>
            `
        );
    } else {
        $.post(`https://${GetParentResourceName()}/realestate:getCompanyProperty`, JSON.stringify({
            id: propertyId,
            isTransaction: true
        }), function (property) {
            let contractType = null;

            if (HousingCreator.AllowSellProperties) {
                contractType = 'transfer'
            } else if (HousingCreator.AllowRentProperties) {
                contractType = 'rent-out'
            }

            if (!contractType) return;

            HousingCreator.AgentContractPropertyId = propertyId
            reloadContract(contractType, {
                data: {
                    address: property.property.address,
                    electricity: property.bills.electricity,
                    internet: property.bills.internet,
                    water: property.bills.water,
                },
            })
            $('.housing_creator').fadeOut(120);
            $('.contract').fadeIn(150);
        });
    }
});

$(document).on('click', '.housing_creator div[data-type="company-properties"] #properties-list .buttons > #update-property', function (e) {
    const propertyId = $(this).data('property-id');
    const priceSale = $(`.housing_creator div[data-type="company-properties"] #properties-list div[data-property-id="${propertyId}"] #price-details input[name="price"]`).val();
    const priceRent = $(`.housing_creator div[data-type="company-properties"] #properties-list div[data-property-id="${propertyId}"] #rent-price-details input[name="price"]`).val();

    $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
        action: 'updatePrice',
        propertyId: propertyId,
        priceSale: priceSale,
        priceRent: priceRent
    }));
});

$(document).on('click', '.housing_creator div[data-type="company-properties"] #properties-list .buttons > #unlist-property', function (e) {
    let propertyId = $(this).data('property-id');
    $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
        action: 'unlistProperty',
        propertyId: propertyId,
    }));
});

$(document).on('click', '.housing_creator div[data-type="company-properties"] #properties-list .buttons > #list-property', function (e) {
    const propertyId = $(this).data('property-id');
    if (HousingCreator.AllowSellProperties && HousingCreator.AllowRentProperties) {
        HousingCreator.ShowModal(
            translation.realestate.company_properties['list:modal'].title,
            undefined,
            undefined,
            `
                <div id="accept" data-property-id="${propertyId}" data-action="confirm-list-sale">${translation.realestate.company_properties['list:modal']['btn.sale']}</div>
                <div id="accept" data-property-id="${propertyId}" data-action="confirm-list-rent">${translation.realestate.company_properties['list:modal']['btn.rent']}</div>
                <div id="accept" data-property-id="${propertyId}" data-action="confirm-list-both">${translation.realestate.company_properties['list:modal']['btn.both']}</div>
                <div id="cancel">${translation['button.cancel']}</div>
            `
        );
    } else {
        if (HousingCreator.AllowSellProperties) {
            $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
                action: 'listProperty',
                type: 'sale',
                propertyId: propertyId,
            }));
        } else if (HousingCreator.AllowRentProperties) {
            $.post(`https://${GetParentResourceName()}/realestate:action`, JSON.stringify({
                action: 'listProperty',
                type: 'rent',
                propertyId: propertyId,
            }));
        }
    }
});

$(document).on('input', '.housing_creator div[data-type="company-properties"] #properties-list .details input', function (e) {
    const propertyId = $(this).data('property-id');
    const onSale = $(this).data('on-sale');
    const defaultPrice = Number($(this).data('default'));
    const price = Number($(this).val());

    if (defaultPrice === price) {
        $(`.housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${propertyId}"] .buttons > #update-property`).hide();
        
        if (onSale == 1) {
            $(`.housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${propertyId}"] .buttons > #unlist-property`).show()
        } else {
            $(`.housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${propertyId}"] .buttons > #list-property`).show()
        }

        return;
    }
    
    $(`.housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${propertyId}"] .buttons > #update-property`).show();
    $(`
        .housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${propertyId}"] .buttons > #unlist-property,
        .housing_creator div[data-type="company-properties"] #properties-list > div[data-property-id="${propertyId}"] .buttons > #list-property
    `).hide();
});



function initGallery(container, buttonsContainer) {
    if (container.hasClass('gallery-initialized')) return;

    let currentTheme = null;
    const gallery = container.find(".gallery");
    const images = container.find(".gallery img");
    const prevBtn = container.find(".prev");
    const nextBtn = container.find(".next");
    const thumbnails = container.find(".thumbnail");

    let currentIndex = 0;

    function updateGallery(index) {
        if (container.hasClass('theme_selection_gallery')) {
            currentTheme = images.eq(index).data("theme");
        }
        gallery.css("transform", `translateX(-${index * 100}%)`);
        thumbnails.removeClass("active");
        thumbnails.eq(index).addClass("active");
    }

    nextBtn.on("click", function () {
        currentIndex = (currentIndex + 1) % images.length;
        updateGallery(currentIndex);
    });

    prevBtn.on("click", function () {
        currentIndex = (currentIndex - 1 + images.length) % images.length;
        updateGallery(currentIndex);
    });

    thumbnails.each(function (index) {
        $(this).on("click", function () {
            currentIndex = index;
            updateGallery(currentIndex);
        });
    });

    if (buttonsContainer && container.hasClass('theme_selection_gallery')) {
        const selectBtn = buttonsContainer.find('#select-ipl-theme');

        selectBtn.on('click', () => {
            Property.SelectedTheme = currentTheme;
        });
    }

    if (container.hasClass('theme_selection_gallery')) {
        currentTheme = images.eq(currentIndex).data("theme");
    }

    container.addClass('gallery-initialized');
}

function targetUrl(url) {
	window.invokeNative('openUrl', url)
}