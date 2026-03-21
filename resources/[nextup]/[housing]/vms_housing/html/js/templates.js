const NoShellWarning = `
    <div class="no-shells--message tag-empty tag-furnished">
        <div class="title">
            <i class="fa-solid fa-triangle-exclamation"></i>
            <h3> No shells available </h3>
        </div>
        <span>It looks like there are currently no interior shells available on your server.</span>
        <br>
        <span>This can happen when no shell resources are installed, or shell resource names do not match entries in <code>config.integrations.lua</code>.</span>
        <br>
        <br>
        <span class="bold">VMS Housing does NOT include shells by default.</span>
        <br>
        <span>Shells are external resources that must be installed and configured separately.</span>
        <br>
        <br>
        <br>
        <a class="button" onclick="targetUrl('https://docs.vames-store.com/assets/vms_housing/compatibility#shells')">
            View supported shell resources
        </a>
    </div>
`

const CreatorShellTemplate = `
['{0}'] = {
    tags = {{1}},

    label = '{2}',
    model = '{3}',
    rooms = {4},
    
    doors = {5},

    interactable = {6},

    images = {},
},
`;

const AlertTemplate = `
    <div class="alert {0}">
        <i class="{1}"></i>
        <div class="remove"><i class="fa-solid fa-xmark"></i></div>
        <div class="data">
            <div class="label">{2}</div>
            <div class="description">{3}</div>
        </div>
    </div>
`;

const ManageElementTemplate = `
    <div>
        <div class="icon">
            <i class="{0}"></i>
        </div>
        <div class="informations">
            <div class="label">{1}</div>
            <div class="value">{2}</div>
        </div>
    </div>
`;

const ManageBillElementTemplate = `
    <div>
        <div class="icon">
            <i class="{0}"></i>
        </div>
        <div class="informations">
            <div class="label">{1}</div>
            <div class="price">{2}{3}<span>{4}</span></div>
        </div>
    </div>
`;

const ManageKeysElementTemplate = `
    <div>
        <div class="icon">
            <i class="{0}"></i>
        </div>
        <div class="informations">
            <div class="label">{1}</div>
            {2}
        </div>
    </div>
`;

const ManageFurnitureElementTemplate = `
    <div class="{0}">
        <div class="icon">
            <i class="{1}"></i>
        </div>
        <div class="informations">
            <div class="label">{2}</div>
            {3}
        </div>
    </div>
`;

const MarketplaceTemplate = `
    <div data-id="{0}">
        <div class="image" style="background-image: url({1})"></div>
        <div class="price">{2}{3}</div>
        <div class="address">{4}</div>
        <div class="info">{5}{6}{7}</div>
    </div>
`;