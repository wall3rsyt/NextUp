const config = {}

config.timeZone = 'pl-PL'

config.filterFurnitureAlphabetically = false

config.shellsTags = {
    // Required, do not modify 'default' key value!
    'default': 'Default',
    
    // Shell state:
    'empty': 'Empty',
    'furnished': 'Furnished',

    // Creators:
    'k4mb1': 'K4MB1',
    'envi': 'ENVI',
    'dccustomz': 'DC Customz',
    'kuzquality': 'KuzQuality',
    'jamaring': 'Jamaring Maps',
    'ateneastore': 'Atenea',
    'maxcreations': 'Max Creations',
}

config.iplsTags = {
    // Required, do not modify 'default' key value!
    'default': 'Default',
    
    // Shell state:
    'furnished': 'Furnished',
    'apartment': 'Apartment',
    'office': 'Office',
}

config.furnitureTags = {
    "bed": "Beds",
    "sofa": "Sofas",
    "chair": "Chairs",
    "bathroom": "Bathroom",
    "kitchen": "Kitchen",
    "electronic": "Electronics",
    "light": "Lights",
    "plant": "Plants",
    "storage": "Storages",
    "table": "Tables",
    "decorations": "Decorations",
    "outdoor": "Outdoor",
    "recreation": "Recreation",
    "door": "Doors",

    "theme": "Themes",
}

config.interactableInfo = {
    wardrobe: {
        label: "Wardrobe",      // Label
        description: `You can dress up.`,
    },
    storage: {
        label: "Storage",       // Label
        description: `You can store your items there.`,
        weight: 'Max Weight',   // Metadata weight
        slots: 'Slots',         // Metadata slots
    },
    safe: {
        label: "Safe",          // Label
        description: `You can store your items there.`,
        weight: 'Max Weight',   // Metadata weight
        slots: 'Slots',         // Metadata slots
    },
    device: {
        label: "Device",        // Label
        description: `You can use the device to make orders from IKEA.`,
    },
    door: {
        label: "Door",          // Label
        description: ``,
    },
    mop: {
        label: "Mop",           // Label
        description: `You can clean dirt in your property using a mop.`,
    },
    mower: {
        label: "Mower",           // Label
        description: `You can mow your lawn using a mower.`,
    },
}

config.configuratorFurnitureInteractables = [
    "wardrobe",
    "storage",
    "safe",
    "device",
    "door",
    "mop",
    "mower",
]

config.configuratorFurnitureMetadata = {
    safe: [
        {key: "slots", allowedValue: "number", defaultValue: 10},
        {key: "weight", allowedValue: "number", defaultValue: 1500},
    ],
    storage: [
        {key: "slots", allowedValue: "number", defaultValue: 10},
        {key: "weight", allowedValue: "number", defaultValue: 1500},
    ],
}

config.charactersLimit = {
    name: 45,
    description: 400,
}

config.controlsList = {
    'Property:mop': [
        { control: 'G',         label: 'Clean' },
    ],
    'Property:photomode_off': [
        { control: 'E',         label: 'Enter Photo Mode' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'Property:photomode_on': [
        { control: 'ENTER',     label: 'Save' },
        { control: 'E',         label: 'Exit Photo Mode' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'Property:peephole': [
        { control: 'BACKSPACE', label: 'Exit' },
    ],
    'Property:camera': [
        { control: 'ARROW LEFT', label: 'Previous' },
        { control: 'ARROW RIGHT', label: 'Next' },
        { control: 'BACKSPACE', label: 'Exit' },
    ],
    'Property:ipl_theme': [
        { control: 'ENTER', label: 'Accept' },
        { control: 'BACKSPACE', label: 'Exit' },
    ],
    'Property:visiting_time': [
        { info: 'Time remaining', label: '<span id="remaining_time"></span>s.' },
    ],
    'Furniture:gizmo': [
        { control: 'ENTER',     label: 'Place' },
        { control: 'RMB',       label: 'Toggle Cursor' },
        { control: 'G',         label: 'Change Mode' },
        { control: 'X',         label: 'Translation' },
        { control: 'C',         label: 'Rotation' },
        { control: 'LEFT ALT',  label: 'Snap to Ground' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'Furniture:walkmode': [
        { control: 'ENTER',     label: 'Place' },
        { control: 'SCROLL',    label: 'Rotate' },
        { control: 'G',         label: 'Change Mode' },
        { control: 'ARROW UP',  label: '+Z Axis' },
        { control: 'ARROW DOWN',label: '-Z Axis' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'HousingCreator:shell_position': [
        { control: 'LMB',           label: 'Save' },
        { control: 'SCROLL',        label: 'Height' },
        { control: 'BACKSPACE',     label: 'Cancel' },
        { control: 'ARROW UP',      label: 'Forward' },
        { control: 'ARROW DOWN',    label: 'Backward' },
        { control: 'ARROW LEFT',    label: 'Left' },
        { control: 'ARROW RIGHT',   label: 'Right' },
    ],
    'HousingCreator:polyzone': [
        { control: 'LMB',       label: 'Add Point' },
        { control: 'RMB',       label: 'Remove Previous Point' },
        { control: 'SCROLL',    label: 'Height' },
        { control: 'ENTER',     label: 'Save' },
        { control: 'BACKSPACE', label: 'Cancel' },
        { control: 'LEFT CTRL', label: 'Hold to change the lower zone' },
    ],
    'HousingCreator:doors': [
        { control: 'LMB',              label: 'Select door' },
        { control: 'ENTER',            label: 'Save' },
        { control: 'BACKSPACE',        label: 'Cancel' },
        { control: 'SCROLL',           label: 'Change Distance' },
        { info: 'Access Distance:',    label: '<span id="doors_distance_access"></span>m.' },
    ],
    'HousingCreator:sign': [
        { control: 'LMB',       label: 'Select position' },
        { control: 'SCROLL',    label: 'Rotate' },
        { control: 'LEFT CTRL', label: 'Slow down' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'HousingCreator:grass': [
        { control: 'LMB',       label: 'Select position' },
        { control: 'SCROLL',    label: 'Rotate' },
        { control: 'LEFT CTRL', label: 'Slow down' },
        { control: 'ARROW LEFT', label: 'Previous Model' },
        { control: 'ARROW RIGHT', label: 'Next Model' },
        { control: 'BACKSPACE', label: 'Cancel' },
        { info: 'Grass Count:', label: '<span id="grass_count"></span>' },
    ],
    'HousingCreator:garage': [
        { control: 'LMB',       label: 'Select position' },
        { control: 'SCROLL',    label: 'Rotate' },
        { control: 'LEFT CTRL', label: 'Slow down' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'HousingCreator:enter_garage': [
        { control: 'LMB',       label: 'Select position' },
        { control: 'SCROLL',    label: 'Rotate' },
        { control: 'LEFT CTRL', label: 'Slow down' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'HousingCreator:parking': [
        { control: 'LMB',       label: 'Select position' },
        { control: 'RMB',       label: 'Remove closest' },
        { control: 'SCROLL',    label: 'Rotate' },
        { control: 'LEFT CTRL', label: 'Slow down' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'HousingCreator:delivery': [
        { control: 'LMB',       label: 'Select position' },
        { control: 'SCROLL',    label: 'Rotate' },
        { control: 'LEFT CTRL', label: 'Slow down' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'HousingCreator:interaction': [
        { control: 'LMB',       label: 'Accept' },
        { control: 'SCROLL',    label: 'Rotate' },
        { control: 'CTRL + SCROLL',    label: 'Coord-Z' },

        { control: 'ARROW LEFT', label: '+X' },
        { control: 'CTRL + ARROW LEFT', label: '-X' },

        { control: 'ARROW RIGHT', label: '+Y' },
        { control: 'CTRL + ARROW RIGHT', label: '-Y' },

        { control: 'ARROW UP', label: '+Height' },
        { control: 'ARROW DOWN', label: '-Height' },
        
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'HousingCreator:interaction_option': [
        { control: 'LMB',       label: 'Select position' },
        { control: 'ARROWS',    label: 'Position' },
        { control: 'SCROLL',    label: 'Position Z' },
        { control: 'LEFT CTRL', label: 'Slow down' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
    'HousingCreator:default': [
        { control: 'LMB',       label: 'Select position' },
        { control: 'BACKSPACE', label: 'Cancel' },
    ],
}