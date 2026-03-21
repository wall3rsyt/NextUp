local variations = require "shared.variations"


local anim = {
    tie_negative = { dict = "clothingtie",    name = "try_tie_negative_a", flag = 51, dur = 1200 },
    wrist        = { dict = "nmt_3_rcm-10",   name = "cs_nigel_dual-10",   flag = 51, dur = 1200 },
    helmet_on    = { dict = "mp_masks@standard_car@ds@",       name = "put_on_mask",          flag = 51, dur = 600  },
    helmet_off   = { dict = "missheist_agency2ahelmet",        name = "take_off_helmet_stand", flag = 51, dur = 1200 },
    specs        = { dict = "clothingspecs",  name = "take_off",           flag = 51, dur = 1400 },
    ear          = { dict = "mp_cp_stolen_tut", name = "b_think",          flag = 51, dur = 900  },
}

return {
    ["top"] = {
        drawable = 11,
        table    = variations.jackets,
        anim     = { dict = "missmic4", name = "michael_tux_fidget", flag = 51, dur = 1500 },
    },
    ["shirt"] = {
        
        drawable = 11,
        table    = {
            standalone = true,
            male       = 252,
            female     = 74,
            extra      = {
                { drawable = 8,  id = 15, tex = 0, name = "extra undershirt" },
                { drawable = 3,  id = 15, tex = 0, name = "extra gloves"     },
                { drawable = 10, id = 0,  tex = 0, name = "extra decals"     },
            },
        },
        anim = anim.tie_negative,
    },
    ["gloves"] = {
        drawable = 3,
        table    = variations.gloves,
        remember = true,
        anim     = anim.wrist,
    },
    ["shoes"] = {
        drawable = 6,
        table    = { standalone = true, male = 34, female = 35 },
        anim     = { dict = "random@domestic", name = "pickup_low", flag = 0, dur = 1200 },
    },
    ["pants"] = {
        drawable = 4,
        table    = { standalone = true, male = 61, female = 14 },
        anim     = { dict = "re@construction", name = "out_of_breath", flag = 51, dur = 1300 },
    },
    ["neck"] = {
        drawable = 7,
        
        table    = { standalone = true, male = 0, female = 0 },
        anim     = { dict = "clothingtie", name = "try_tie_positive_a", flag = 51, dur = 2100 },
    },
    ["vest"] = {
        drawable = 9,
        
        table    = { standalone = true, male = 0, female = 0 },
        anim     = anim.tie_negative,
    },
    ["bag"] = {
        drawable = 5,
        table    = variations.bags,
        anim     = { dict = "anim@heists@ornate_bank@grab_cash", name = "intro", flag = 51, dur = 1600 },
    },
    ["mask"] = {
        drawable = 1,
        table    = { standalone = true, male = 0, female = 0 },
        anim     = { dict = "mp_masks@standard_car@ds@", name = "put_on_mask", flag = 51, dur = 800 },
    },
    ["hair"] = {
        drawable = 2,
        table    = variations.hair,
        remember = true,
        anim     = { dict = "clothingtie", name = "check_out_a", flag = 51, dur = 2000 },
    },

    -- Props
    ["visor"] = {
        prop     = 0,
        variants = variations.visor,
        anim     = { on = anim.helmet_on, off = anim.helmet_off },
    },
    ["hat"] = {
        prop = 0,
        
        anim = { on = anim.helmet_on, off = anim.helmet_off },
    },
    ["glasses"] = {
        prop = 1,
        anim = { on = anim.specs, off = anim.specs },
    },
    ["ear"] = {
        prop = 2,
        anim = { on = anim.ear, off = anim.ear },
    },
    ["watch"] = {
        prop = 6,
        anim = { on = anim.wrist, off = anim.wrist },
    },
    ["bracelet"] = {
        prop = 7,
        anim = { on = anim.wrist, off = anim.wrist },
    },
}