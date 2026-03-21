Config = Config or {}

-- ▀█▀ █▀▄ ▄▀▄ █▄ █ ▄▀▀ █   ▄▀▄ ▀█▀ ██▀
--  █  █▀▄ █▀█ █ ▀█ ▄██ █▄▄ █▀█  █  █▄▄
Config.Language = 'EN' -- 'EN' / 'DE' / 'FR' / 'ES' / 'PT' / 'PL' / 'IT' / 'CZ' / 'SV'

Config.Translate = {
    ['EN'] = {
        ['control.gizmo:select'] = "Gizmo Select",
        ['control.gizmo:translation'] = "Gizmo Translation",
        ['control.gizmo:rotation'] = "Gizmo Rotation",
        
        -- Blips:
        ['blip.motel'] = "Motel",
        ['blip.building'] = "Apartment",
        ['blip.house_agency'] = "Agency Property",
        ['blip.house_owner'] = "Owned Property",
        ['blip.house_renter'] = "Rented Property",
        ['blip.house_key_holder'] = "Owned Property",
        ['blip.house_for_sale'] = "Property For Sale",
        ['blip.marketplace'] = "Property Marketplace",
        ['blip.alarm'] = "House Alarm",

        -- Sale / Rent Sign
        ['dui.sale_sign:for_sale'] = "FOR SALE",
        ['dui.sale_sign:for_rent'] = "FOR RENT",
        ['dui.sale_sign:price'] = "${0}",
        ['dui.sale_sign:rent_weekly'] = "${0}<span>/week</span>",
        ['dui.sale_sign:rent_monthly'] = "${0}<span>/month</span>",

        -- 3D Text Main:
        ['3dtext.agency_showroom'] = "~p~[E]~s~ Showroom",
        ['3dtext.marketplace'] = "~p~[E]~s~ Marketplace",
        ['3dtext.view_house'] = "~p~[E]~s~ View Offer",
        ['3dtext.building'] = "~p~[E]~s~ Building",
        ['3dtext.reception'] = "~p~[E]~s~ Reception",
        ['3dtext.show_house'] = "~p~[E]~s~ Show",
        ['3dtext.exit_house'] = "~p~[E]~s~ Exit",
        ['3dtext.parking'] = "~p~[E]~s~ Parking",
        ['3dtext.garage'] = "~p~[E]~s~ Garage",
        ['3dtext.wardrobe'] = "~p~[E]~s~ Wardrobe",
        ['3dtext.storage'] = "~p~[E]~s~ Storage",
        ['3dtext.emergency_exit'] = "~p~[E]~s~ Emergency Exit",
        ['3dtext.power_box'] = '~p~[E]~s~ Power Box',

        -- Text UI Main:
        ['textui.agency_showroom'] = "Showroom",
        ['textui.marketplace'] = "Marketplace",
        ['textui.view_house'] = "View Offer",
        ['textui.building'] = "Building",
        ['textui.reception'] = "Reception",
        ['textui.show_house'] = "Show",
        ['textui.exit_house'] = "Exit",
        ['textui.parking'] = "Parking",
        ['textui.garage'] = "Garage",
        ['textui.wardrobe'] = "Wardrobe",
        ['textui.storage'] = "Storage",
        ['textui.emergency_exit'] = "Emergency Exit",
        ['textui.power_box'] = 'Power Box',
        ['textui.door'] = 'Door',

        ['menu:header'] = "Property #%s",
        ['menu.enter'] = "Enter",
        ['menu.exit'] = "Exit",
        ['menu.manage'] = "Manage",
        ['menu.furniture'] = "Furniture",
        ['menu.toggle_light'] = "Toggle Light",
        ['menu.toggle_lock'] = "Toggle Lock",
        ['menu.lockpick'] = "Lockpick",
        ['menu.lockdown'] = "Lockdown",
        ['menu.removeseal'] = "Remove Police Seal",
        ['menu.raid'] = "Raid",
        ['menu.complete_raid'] = "Close Doors",
        ['menu.doorbell'] = "Ring the Doorbell",
        ['menu.door_peephole'] = "Peephole",
        ['menu.enter_underground_parking'] = "Enter parking (Floor -%s)",

        ['menu.power_box_open'] = "Open Power Box",
        ['menu.power_box_close'] = "Close Power Box",
        ['menu.power_box_destroy'] = "Destroy",
        ['menu.power_box_turn_off'] = "Turn Off",
        ['menu.power_box_turn_on'] = "Turn On",
        ['menu.power_box_repair'] = "Repair",

        -- Target Main:
        ['target.agency_showroom'] = "Showroom",
        ['target.marketplace'] = "Marketplace",
        ['target.view_house'] = "View Offer",
        ['target.building'] = "Building",
        ['target.reception'] = "Reception",
        ['target.enter'] = "Enter",
        ['target.exit'] = "Exit",
        ['target.garage'] = "Garage",
        ['target.wardrobe'] = "Wardrobe",
        ['target.storage'] = "Storage",
        ['target.manage'] = "Manage",
        ['target.furniture'] = "Furniture",
        ['target.toggle_light'] = "Toggle Light",
        ['target.toggle_lock'] = "Toggle Lock",
        ['target.toggle_lock_door'] = "Toggle Lock",
        ['target.doorbell'] = "Ring the Doorbell",
        ['target.door_peephole'] = "Peephole",
        ['target.lockpick'] = "Lockpick",
        ['target.lockdown'] = "Lockdown",
        ['target.removeseal'] = "Remove Police Seal",
        ['target.raid'] = "Raid",
        ['target.complete_raid'] = "Close Doors",
        ['target.enter_underground_parking'] = "Enter parking (Floor -%s)",
        ['target.emergency_exit'] = "Emergency Exit",

        -- Furniture Interactable:
        ['target.interactable:delivery'] = 'Unpack shipment',
        ['target.interactable:wardrobe'] = 'Wardrobe',
        ['target.interactable:storage'] = 'Storage',
        ['target.interactable:safe'] = 'Safe',
        ['target.interactable:device'] = 'Laptop',
        ['target.interactable:mop'] = 'Mop',
        ['target.interactable:mower'] = 'Mower',
        ['target.interactable:power_box_open'] = 'Open Power Box',
        ['target.interactable:power_box_close'] = 'Close Power Box',
        ['target.interactable:power_box_destroy'] = 'Destroy',
        ['target.interactable:power_box_turn_off'] = 'Turn Off',
        ['target.interactable:power_box_turn_on'] = 'Turn On',
        ['target.interactable:power_box_repair'] = 'Repair',

        ['3dtext.interactable:delivery'] = '~p~[E]~s~ Unpack shipment',
        ['3dtext.interactable:wardrobe'] = '~p~[E]~s~ Wardrobe',
        ['3dtext.interactable:storage'] = '~p~[E]~s~ Storage',
        ['3dtext.interactable:safe'] = '~p~[E]~s~ Safe',
        ['3dtext.interactable:device'] = '~p~[E]~s~ Laptop',
        ['3dtext.interactable:mop'] = '~p~[E]~s~ Mop',
        ['3dtext.interactable:mower'] = '~p~[E]~s~ Mower',

        ['textui.interactable:delivery'] = 'Unpack shipment',
        ['textui.interactable:wardrobe'] = 'Wardrobe',
        ['textui.interactable:storage'] = 'Storage',
        ['textui.interactable:safe'] = 'Safe',
        ['textui.interactable:device'] = 'Laptop',
        ['textui.interactable:mop'] = 'Mop',
        ['textui.interactable:mower'] = 'Mower',

        -- Static Interactable:
        ['target.interactable:sink'] = 'Wash your hands',
        ['target.interactable:sink_drink'] = 'Drink',
        ['target.interactable:shower'] = 'Take a shower',

        ['3dtext.interactable'] = '~p~[E]~s~',

        ['textui.interactable'] = '',

        ['menu.interactable:sink'] = 'Wash your hands',
        ['menu.interactable:sink_drink'] = 'Drink',
        ['menu.interactable:shower'] = 'Take a shower',
        
        -- General:
        ['notify.wait'] = "Try again in a while...",
        ['notify.not_allowed'] = "You are not allowed to do that!",
        ['notify.not_enough_money'] = "You don't have enough money!",
        ['notify.reached_properties_limit'] = "You have reached properties limit!",
        
        -- Commands:
        ['notify.command_giveproperty:success'] = "You have given property %s to player %s.",
        ['notify.command_giveproperty:player_offline'] = "Player is offline.",
        ['notify.command_giveproperty:property_doesnt_exist'] = "Property %s doesn't exist.",
        ['notify.command_giveproperty:invalid_property_type'] = "You can't give a property of this type.",
        ['notify.command_giveproperty:property_has_owner'] = "Property %s already have an owner.",

        -- Property:
        ['notify.property:purchased'] = "You've bought this property for $%s.",
        ['notify.property:rented_monthly'] = "You're now renting this property for $%s per month.",
        ['notify.property:rented_weekly'] = "You're now renting this property for $%s per week.",
        ['notify.property:already_owned'] = "You already own this property.",
        ['notify.property:marketplace_blocked_by_renter'] = "You cannot access the marketplace while this property is rented out.",
        ['notify.property:cannot_sell_with_renter'] = "You cannot sell the property while it's rented.",
        ['notify.property:sold_property'] = "You have successfully sold the property for $%s.",
        ['notify.property:purchased_theme'] = "You purchased theme %s for $%s.",
        ['notify.property:purchased_furniture'] = "You purchased furniture %s for $%s.",
        ['notify.property:ordered_furniture'] = "You have ordered furniture %s for $%s.",
        ['notify.property:reached_furniture_limit'] = "You have reached furniture limit!<br>Sell your current furniture or upgrade Furniture Limit.",
        ['notify.property:reached_furniture_model_limit'] = "You have reached the furniture limit!<br>Limit of %s is %s, you can't have more of them.",
        ['notify.property:no_electricity'] = "You cannot turn on the lights - there's no electricity. Please pay your bills!",
        ['notify.property:no_power'] = "You cannot do that - the power box is turned off.",
        ['notify.property:purchased_upgrade'] = "You purchased the upgrade: %s for $%s.",
        ['notify.property:purchased_upgrade_free'] = "You received the upgrade: %s for free.",
        ['notify.property:marketplace_offer_added'] = "The property has been listed on the marketplace.",
        ['notify.property:marketplace_offer_updated'] = "The property offer has been updated.",
        ['notify.property:marketplace_offer_removed'] = "The property has been removed from the marketplace.",
        ['notify.property:marketplace_photomode_on'] = "Photo mode enabled.",
        ['notify.property:marketplace_photomode_off'] = "Photo mode disabled.",
        ['notify.property:paid_services'] = "You paid $%s for utility bills from period %s.",
        ['notify.property:paid_rent'] = "You paid $%s for the rent of period %s.",
        ['notify.property:rent_terminated_now'] = "The rental contract has been terminated immediately.",
        ['notify.property:rent_termination_scheduled'] = "The rental contract will end at the end of current month.",
        ['notify.property:rent_termination_cancelled'] = "The rental termination has been cancelled.",
        ['notify.property:wardrobe_moved'] = "You have updated the wardrobe location.",
        ['notify.property:storage_moved'] = "You have updated the storage location.",
        ['notify.property:already_have_keys'] = "This player already holds the keys to this property.",
        ['notify.property:added_keys'] = "You have passed on the key for %s.",
        ['notify.property:player_dont_have_keys'] = "This player does not hold the keys to the property.",
        ['notify.property:removed_keys'] = "You took the keys from the %s.",
        ['notify.property:reached_keys_limit'] = "You have reached keys limit!",
        ['notify.property:reached_permissions_limit'] = "You have reached players with permissions limit!",
        ['notify.property:moved_out'] = "You have successfully moved out. The rental has been terminated.",
        ['notify.property:furniture_is_used'] = "This furniture is in use, you cannot do that now.",
        ['notify.property:put_the_mop_away'] = "You have to put the mop away - you can't go out with it.",

        -- Cameras:
        ['notify.cameras:no_cameras_installed'] = "You don't have any cameras installed.",

        -- Alarm Alert:
        ['notify.alarm_alert:code_already_sent'] = "The verification code has already been sent. Please wait a moment before requesting a new code.",
        ['notify.alarm_alert:already_set'] = "Alarm is already set up.",
        ['notify.alarm_alert:invalid_phone_number'] = "The phone number you entered is invalid.",
        ['notify.alarm_alert:code_expired'] = "The authentication code has expired. Please request a new one.",
        ['notify.alarm_alert:invalid_code'] = "The authentication code you entered is invalid.",
        ['notify.alarm_alert:code_verified'] = "The authentication code has been verified. The alarm has been successfully activated for number %s.",
        ['notify.alarm_alert:removed'] = "The phone number has been removed, you will no longer receive alarm notifications.",

        ['sms.alarm:sender'] = "Alarm System",
        ['sms.alarm:authentication_code'] = "Your alarm authentication code is: %s. It will expire in %s seconds.",
        ['sms.alarm:authentication_success'] = "✅ The number %s has been successfully linked to the alarm system at %s %s. You will now receive notifications whenever the alarm is triggered.",
        ['sms.alarm:authentication_removed'] = "❌ The number %s has been unlinked from the alarm system at %s %s. You will no longer receive notifications from this property.",
        ['sms.alarm:lockpick_start'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_success'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_fail'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",

        -- Furniture:
        ['notify.furniture:removed'] = "Furniture #%s removed.",
        ['notify.furniture:sold'] = "Furniture #%s sold for $%s",
        ['notify.furniture:cannot_sold'] = "This furniture cannot be sold.",
        ['notify.furniture:you_are_in_furniture_mode'] = "You cannot do this because you are in furniture mode.",
        ['notify.furniture:cannot_place_inside'] = "You cannot place this furniture inside the property.",
        ['notify.furniture:inside_disabled'] = "This property does not allow furniture inside.",
        ['notify.furniture:cannot_place_outside'] = "You cannot place this furniture outside the property.",
        ['notify.furniture:outside_disabled'] = "This property does not allow outdoor furniture.",
        ['notify.furniture:no_outdoor_area'] = "This property does not have an outdoor area.",
        ['notify.furniture:outside_zone'] = "You cannot place furniture outside of the property zone.",
        ['notify.furniture:mode_cooldown'] = "You need to wait before changing mode again.",

        -- Doors:
        ['notify.doors:wait'] = "You can't open and close the door so often.",

        -- Mop:
        ['notify.mop:you_cannot_put_down'] = "You cannot put the mop in another bucket - put it back in your bucket.",

        -- Power Box:
        ['notify.powerbox:missing_item_turn_on'] = "You are missing a required item to turn on the power.",
        ['notify.powerbox:missing_item_repair'] = "You are missing a required item to repair the power box.",
        ['notify.powerbox:missing_item_turn_off'] = "You are missing a required item to turn off the power.",
        ['notify.powerbox:missing_item_destroy'] = "You are missing a required item to destroy the power box.",

        -- Contract:
        ['notify.contract:player_too_far'] = "The target player is too far away to sign the contract.",
        ['notify.contract:sent'] = "You have sent a property contract to %s.",
        ['notify.contract:canceled'] = "The player has not signed a contract.",
        ['notify.contract:seller_too_far'] = "The other player is too far away to finalize the contract.",
        ['notify.contract:purchased_from_player'] = "You have purchased the property from %s.",
        ['notify.contract:sold_to_player'] = "You have successfully sold the property to %s.",
        ['notify.contract:rented_to_player'] = "You have successfully rented the property to %s.",
        ['notify.contract:started_rent_from_player'] = "You have rented the property from %s.",
        ['notify.contract:already_rented'] = "This property is already rented by another player.",

        -- Marketplace:
        ['notify.marketplace:started_rent'] = "You have started renting the property from the marketplace.",
        ['notify.marketplace:purchased'] = "You have purchased the property from the marketplace.",
        ['notify.marketplace:rented'] = "Your property has been rented through the marketplace. It was rented by %s.",
        ['notify.marketplace:sold'] = "Your property has been sold through the marketplace. It was purchased by %s.",
        ['notify.marketplace:marked_on_gps'] = "Marked property on GPS.",

        -- Raid:
        ['notify.raid:anti_burglary_doors'] = "You can't raid this property. It is protected by anti-burglary doors.",
        ['notify.raid:missing_job'] = "You don't have the required job to raid this property.",
        ['notify.raid:missing_item'] = "You are missing a required item to perform the raid.",
        ['notify.raid:failed_due_to_anti_burglary'] = "Your attempt to break in has failed. The anti-burglary doors resisted the intrusion.",

        -- Safe:
        ['notify.safe:cannot_set_same_pin'] = "You cannot set the same PIN as the current one.",
        ['notify.safe:wrong_old_pin_was_entered'] = "The old PIN you entered is incorrect.",
        ['notify.safe:changed_pin'] = "PIN changed from %s to %s.",

        -- Lockpick:
        ['notify.lockpick:alarm_start'] = "Alarm triggered! Lockpicking attempt detected.",
        ['notify.lockpick:alarm_success'] = "Alarm triggered! The lock has been picked.",
        ['notify.lockpick:alarm_failed'] = "Alarm triggered! Lockpicking attempt failed.",
        ['notify.lockpick:missing_item'] = "You don't have a lockpick in your inventory!",
        ['notify.lockpick:failed_not_enough_police'] = "Not enough police online to attempt a lockpick.",
        ['notify.lockpick:failed_owner_not_online'] = "The owner is not online, you cannot lockpick their property.",

        -- Lockdown:
        ['notify.lockdown:missing_item'] = "You don't have the required item in your inventory!",

        -- Permissions:
        ['notify.permissions:cannot_remove_owner'] = "You cannot remove the owner's permissions.",
        ['notify.permissions:cannot_remove_self'] = "You cannot remove your own permissions.",
        ['notify.permissions:error'] = "An error has occurred.",

        -- Creator:
        ['notify.creator:copied_code'] = "You copied the code, paste it into your configuration file!",
        ['notify.creator:out_of_zone'] = "You can't set it outside the yard zone!",
        ['notify.creator:cannot_inside_property'] = "You need to get out of the property...",
    },
    ['DE'] = {
        ['control.gizmo:select'] = "Gizmo Auswählen",
        ['control.gizmo:translation'] = "Gizmo Übersetzung",
        ['control.gizmo:rotation'] = "Gizmo Drehung",

        -- Blips:
        ['blip.motel'] = "Motel",
        ['blip.building'] = "Wohnung",
        ['blip.house_agency'] = "Agentur-Eigentum",
        ['blip.house_owner'] = "Eigentum",
        ['blip.house_renter'] = "Vermietetes Eigentum",
        ['blip.house_key_holder'] = "Eigentum",
        ['blip.house_for_sale'] = "Immobilie zur Verkauf",
        ['blip.marketplace'] = "Immobilienmarkt",
        ['blip.alarm'] = "Hausalarm",
        
        -- Sale / Rent Sign
        ['dui.sale_sign:for_sale'] = "FOR SALE",
        ['dui.sale_sign:for_rent'] = "FOR RENT",
        ['dui.sale_sign:price'] = "${0}",
        ['dui.sale_sign:rent_weekly'] = "${0}<span>/week</span>",
        ['dui.sale_sign:rent_monthly'] = "${0}<span>/month</span>",

        -- 3D Text Main:
        ['3dtext.agency_showroom'] = "~p~[E]~s~ Showroom",
        ['3dtext.marketplace'] = "~p~[E]~s~ Marktplatz",
        ['3dtext.view_house'] = "~p~[E]~s~ Angebot ansehen",
        ['3dtext.building'] = "~p~[E]~s~ Building",
        ['3dtext.reception'] = "~p~[E]~s~ Reception",
        ['3dtext.show_house'] = "~p~[E]~s~ Zeigen",
        ['3dtext.exit_house'] = "~p~[E]~s~ Verlassen",
        ['3dtext.parking'] = "~p~[E]~s~ Parking",
        ['3dtext.garage'] = "~p~[E]~s~ Garage",
        ['3dtext.wardrobe'] = "~p~[E]~s~ Kleiderschrank",
        ['3dtext.storage'] = "~p~[E]~s~ Lager",
        ['3dtext.emergency_exit'] = "~p~[E]~s~ Notausgang",
        ['3dtext.power_box'] = '~p~[E]~s~ Stromkasten',

        -- Text UI Main:
        ['textui.agency_showroom'] = "Showroom",
        ['textui.marketplace'] = "Marktplatz",
        ['textui.view_house'] = "Angebot ansehen",
        ['textui.building'] = "Building",
        ['textui.reception'] = "Reception",
        ['textui.show_house'] = "Zeigen",
        ['textui.exit_house'] = "Verlassen",
        ['textui.parking'] = "Parking",
        ['textui.garage'] = "Garage",
        ['textui.wardrobe'] = "Kleiderschrank",
        ['textui.storage'] = "Lager",
        ['textui.emergency_exit'] = "Notausgang",
        ['textui.power_box'] = 'Stromkasten',
        ['textui.door'] = '~INPUT_CONTEXT~ Door',

        ['menu:header'] = "Immobilie #%s",
        ['menu.enter'] = "Eintreten",
        ['menu.exit'] = "Verlassen",
        ['menu.manage'] = "Verwalten",
        ['menu.furniture'] = "Möbel",
        ['menu.toggle_light'] = "Licht umschalten",
        ['menu.toggle_lock'] = "Schloss umschalten",
        ['menu.lockpick'] = "Lockpick",
        ['menu.lockdown'] = "Lockdown",
        ['menu.removeseal'] = "Polizeibesiegelung entfernen",
        ['menu.raid'] = "Razzia",
        ['menu.complete_raid'] = "Türen schließen",
        ['menu.doorbell'] = "Ring the Doorbell",
        ['menu.door_peephole'] = "Türspion",
        ['menu.enter_underground_parking'] = "Parken betreten (Etage -%s)",

        ['menu.power_box_open'] = "Stromkasten öffnen",
        ['menu.power_box_close'] = "Stromkasten schließen",
        ['menu.power_box_destroy'] = "Zerstören",
        ['menu.power_box_turn_off'] = "Ausschalten",
        ['menu.power_box_turn_on'] = "Einschalten",
        ['menu.power_box_repair'] = "Reparieren",

        -- Target Main:
        ['target.agency_showroom'] = "Showroom",
        ['target.marketplace'] = "Marktplatz",
        ['target.view_house'] = "Angebot ansehen",
        ['target.building'] = "Building",
        ['target.reception'] = "Reception",
        ['target.enter'] = "Eintreten",
        ['target.exit'] = "Verlassen",
        ['target.garage'] = "Garage",
        ['target.wardrobe'] = "Kleiderschrank",
        ['target.storage'] = "Lager",
        ['target.manage'] = "Verwalten",
        ['target.furniture'] = "Möbel",
        ['target.toggle_light'] = "Licht umschalten",
        ['target.toggle_lock'] = "Schloss umschalten",
        ['target.toggle_lock_door'] = "Schloss umschalten",
        ['target.doorbell'] = "Klingeln",
        ['target.door_peephole'] = "Türspion",
        ['target.lockpick'] = "Schloss knacken",
        ['target.lockdown'] = "Lockdown",
        ['target.removeseal'] = "Polizeibesiegelung entfernen",
        ['target.raid'] = "Razzia",
        ['target.complete_raid'] = "Türen schließen",
        ['target.enter_underground_parking'] = "Parken betreten (Etage -%s)",
        ['target.emergency_exit'] = "Notausgang",

        -- Furniture Interactable:
        ['target.interactable:delivery'] = 'Lieferung auspacken',
        ['target.interactable:wardrobe'] = 'Kleiderschrank',
        ['target.interactable:storage'] = 'Lager',
        ['target.interactable:safe'] = 'Safe',
        ['target.interactable:device'] = 'Laptop',
        ['target.interactable:mop'] = 'Mopp',
        ['target.interactable:mower'] = 'Mower',
        ['target.interactable:power_box_open'] = 'Stromkasten öffnen',
        ['target.interactable:power_box_close'] = 'Stromkasten schließen',
        ['target.interactable:power_box_destroy'] = 'Zerstören',
        ['target.interactable:power_box_turn_off'] = 'Ausschalten',
        ['target.interactable:power_box_turn_on'] = 'Einschalten',
        ['target.interactable:power_box_repair'] = 'Reparieren',

        ['3dtext.interactable:delivery'] = '~p~[E]~s~ Lieferung auspacken',
        ['3dtext.interactable:wardrobe'] = '~p~[E]~s~ Kleiderschrank',
        ['3dtext.interactable:storage'] = '~p~[E]~s~ Lager',
        ['3dtext.interactable:safe'] = '~p~[E]~s~ Safe',
        ['3dtext.interactable:device'] = '~p~[E]~s~ Laptop',
        ['3dtext.interactable:mop'] = '~p~[E]~s~ Mopp',
        ['3dtext.interactable:mower'] = '~p~[E]~s~ Mower',

        ['textui.interactable:delivery'] = 'Lieferung auspacken',
        ['textui.interactable:wardrobe'] = 'Kleiderschrank',
        ['textui.interactable:storage'] = 'Lager',
        ['textui.interactable:safe'] = 'Safe',
        ['textui.interactable:device'] = 'Laptop',
        ['textui.interactable:mop'] = 'Mopp',
        ['textui.interactable:mower'] = 'Mower',

        -- Static Interactable:
        ['target.interactable:sink'] = 'Hände waschen',
        ['target.interactable:sink_drink'] = 'Trinken',
        ['target.interactable:shower'] = 'Duschen',

        ['3dtext.interactable'] = '~p~[E]~s~',

        ['textui.interactable'] = '',

        ['menu.interactable:sink'] = 'Hände waschen',
        ['menu.interactable:sink_drink'] = 'Trinken',
        ['menu.interactable:shower'] = 'Duschen',

        -- General:
        ['notify.wait'] = "Versuche es später noch einmal...",
        ['notify.not_allowed'] = "Du darfst das nicht tun!",
        ['notify.not_enough_money'] = "Du hast nicht genug Geld!",
        ['notify.reached_properties_limit'] = "Du hast das Limit für Immobilien erreicht!",

        -- Commands:
        ['notify.command_giveproperty:success'] = "You have given property %s to player %s.",
        ['notify.command_giveproperty:player_offline'] = "Player is offline.",
        ['notify.command_giveproperty:property_doesnt_exist'] = "Property %s doesn't exist.",
        ['notify.command_giveproperty:invalid_property_type'] = "You can't give a property of this type.",
        ['notify.command_giveproperty:property_has_owner'] = "Property %s already have an owner.",

        -- Property:
        ['notify.property:purchased'] = "Du hast dieses Eigentum für $%s gekauft.",
        ['notify.property:rented_monthly'] = "Du mietest diese Immobilie jetzt für $%s pro Monat.",
        ['notify.property:rented_weekly'] = "Du mietest diese Immobilie jetzt für $%s pro Woche.",
        ['notify.property:already_owned'] = "Du besitzt dieses Eigentum bereits.",
        ['notify.property:marketplace_blocked_by_renter'] = "Du kannst nicht auf den Markt zugreifen, solange dieses Eigentum vermietet ist.",
        ['notify.property:cannot_sell_with_renter'] = "Du kannst das Eigentum nicht verkaufen, solange es vermietet ist.",
        ['notify.property:sold_property'] = "Du hast das Eigentum erfolgreich für $%s verkauft.",
        ['notify.property:purchased_theme'] = "Du hast das Theme %s für $%s gekauft.",
        ['notify.property:purchased_furniture'] = "Du hast das Möbel %s für $%s gekauft.",
        ['notify.property:ordered_furniture'] = "Du hast das Möbel %s für $%s bestellt.",
        ['notify.property:reached_furniture_limit'] = "Du hast das Möbel Limit erreicht!<br>Verkaufe deine aktuellen Möbel oder erhöhe das Möbellimit.",
        ['notify.property:reached_furniture_model_limit'] = "You have reached the furniture limit!<br>Limit of %s is %s, you can't have more of them.",
        ['notify.property:no_electricity'] = "Du kannst das Licht nicht einschalten - es gibt keinen Strom. Bitte bezahle deine Rechnungen!",
        ['notify.property:no_power'] = "You cannot do that - the power box is turned off.",
        ['notify.property:purchased_upgrade'] = "Du hast das Upgrade: %s für $%s gekauft.",
        ['notify.property:purchased_upgrade_free'] = "Du hast das Upgrade: %s kostenlos erhalten.",
        ['notify.property:marketplace_offer_added'] = "Das Eigentum wurde auf dem Markt gelistet.",
        ['notify.property:marketplace_offer_updated'] = "Das Angeboteigentum wurde aktualisiert.",
        ['notify.property:marketplace_offer_removed'] = "Das Eigentum wurde vom Markt entfernt.",
        ['notify.property:marketplace_photomode_on'] = "Fotomodus aktiviert.",
        ['notify.property:marketplace_photomode_off'] = "Fotomodus deaktiviert.",
        ['notify.property:paid_services'] = "Du hast $%s für die Dienstleistungen für den Zeitraum %s bezahlt.",
        ['notify.property:paid_rent'] = "Du hast $%s für die Miete des Zeitraums %s bezahlt.",
        ['notify.property:rent_terminated_now'] = "Der Mietvertrag wurde sofort beendet.",
        ['notify.property:rent_termination_scheduled'] = "Der Mietvertrag endet am Ende des aktuellen Monats.",
        ['notify.property:rent_termination_cancelled'] = "Die Mietkündigung wurde abgebrochen.",
        ['notify.property:wardrobe_moved'] = "Du hast den Kleiderschrankstandort aktualisiert.",
        ['notify.property:storage_moved'] = "Du hast den Standort des Lagers aktualisiert.",
        ['notify.property:already_have_keys'] = "Dieser Spieler besitzt bereits die Schlüssel zu diesem Eigentum.",
        ['notify.property:added_keys'] = "Du hast den Schlüssel für %s übergeben.",
        ['notify.property:player_dont_have_keys'] = "Dieser Spieler hat nicht die Schlüssel zum Eigentum.",
        ['notify.property:removed_keys'] = "Du hast die Schlüssel vom %s genommen.",
        ['notify.property:reached_keys_limit'] = "Du hast das Schlüssellimit erreicht!",
        ['notify.property:reached_permissions_limit'] = "Du hast das Limit für berechtigte Spieler erreicht!",
        ['notify.property:moved_out'] = "Du bist erfolgreich ausgezogen. Die Miete wurde beendet.",
        ['notify.property:furniture_is_used'] = "Dieses Möbelstück wird gerade benutzt, du kannst das jetzt nicht machen.",
        ['notify.property:put_the_mop_away'] = "Du musst den Mopp wegräumen - du kannst nicht damit herumlaufen.",

        -- Cameras:
        ['notify.cameras:no_cameras_installed'] = "Du hast keine Kameras installiert.",

        -- Alarm Alert:
        ['notify.alarm_alert:code_already_sent'] = "The verification code has already been sent. Please wait a moment before requesting a new code.",
        ['notify.alarm_alert:already_set'] = "Alarm is already set up.",
        ['notify.alarm_alert:invalid_phone_number'] = "The phone number you entered is invalid.",
        ['notify.alarm_alert:code_expired'] = "The authentication code has expired. Please request a new one.",
        ['notify.alarm_alert:invalid_code'] = "The authentication code you entered is invalid.",
        ['notify.alarm_alert:code_verified'] = "The authentication code has been verified. The alarm has been successfully activated for number %s.",
        ['notify.alarm_alert:removed'] = "The phone number has been removed, you will no longer receive alarm notifications.",

        ['sms.alarm:sender'] = "Alarm System",
        ['sms.alarm:authentication_code'] = "Your alarm authentication code is: %s. It will expire in %s seconds.",
        ['sms.alarm:authentication_success'] = "✅ The number %s has been successfully linked to the alarm system at %s %s. You will now receive notifications whenever the alarm is triggered.",
        ['sms.alarm:authentication_removed'] = "❌ The number %s has been unlinked from the alarm system at %s %s. You will no longer receive notifications from this property.",
        ['sms.alarm:lockpick_start'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_success'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_fail'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",

        -- Furniture:
        ['notify.furniture:removed'] = "Möbel #%s entfernt.",
        ['notify.furniture:sold'] = "Möbel #%s für $%s verkauft",
        ['notify.furniture:cannot_sold'] = "Dieses Möbel kann nicht verkauft werden.",
        ['notify.furniture:you_are_in_furniture_mode'] = "Du kannst das nicht tun, weil du im Möbelmodus bist.",
        ['notify.furniture:cannot_place_inside'] = "Du kannst dieses Möbel nicht im Eigentum platzieren.",
        ['notify.furniture:inside_disabled'] = "Dieses Eigentum erlaubt keine Möbel im Inneren.",
        ['notify.furniture:cannot_place_outside'] = "Du kannst dieses Möbel nicht außerhalb des Eigentums platzieren.",
        ['notify.furniture:outside_disabled'] = "Dieses Eigentum erlaubt keine Gartenmöbel.",
        ['notify.furniture:no_outdoor_area'] = "Dieses Eigentum hat keine Außenbereich.",
        ['notify.furniture:outside_zone'] = "Du kannst Möbel nicht außerhalb der Eigentumszone platzieren.",
        ['notify.furniture:mode_cooldown'] = "Du musst warten, bevor du den Modus erneut ändern kannst.",

        -- Doors:
        ['notify.doors:wait'] = "Du kannst die Tür nicht so oft öffnen und schließen.",

        -- Mop:
        ['notify.mop:you_cannot_put_down'] = "Du kannst den Mopp nicht in einen anderen Eimer legen - leg ihn zurück in deinen Eimer.",

        -- Power Box:
        ['notify.powerbox:missing_item_turn_on'] = "Dir fehlt ein erforderlicher Gegenstand, um die Stromversorgung einzuschalten.",
        ['notify.powerbox:missing_item_repair'] = "Dir fehlt ein erforderlicher Gegenstand, um den Stromkasten zu reparieren.",
        ['notify.powerbox:missing_item_turn_off'] = "Dir fehlt ein erforderlicher Gegenstand, um die Stromversorgung auszuschalten.",
        ['notify.powerbox:missing_item_destroy'] = "Dir fehlt ein erforderlicher Gegenstand, um den Stromkasten zu zerstören.",

        -- Contract:
        ['notify.contract:player_too_far'] = "Der Zielspieler ist zu weit entfernt, um den Vertrag zu unterschreiben.",
        ['notify.contract:sent'] = "Du hast einen Eigentumsvertrag an %s gesendet.",
        ['notify.contract:canceled'] = "Der Spieler hat den Vertrag nicht unterschrieben.",
        ['notify.contract:seller_too_far'] = "Der andere Spieler ist zu weit entfernt, um den Vertrag abzuschließen.",
        ['notify.contract:purchased_from_player'] = "Du hast das Eigentum von %s gekauft.",
        ['notify.contract:sold_to_player'] = "Du hast das Eigentum erfolgreich an %s verkauft.",
        ['notify.contract:rented_to_player'] = "Du hast das Eigentum erfolgreich an %s vermietet.",
        ['notify.contract:started_rent_from_player'] = "Du hast das Eigentum von %s vermietet.",
        ['notify.contract:already_rented'] = "Dieses Eigentum wird bereits von einem anderen Spieler vermietet.",

        -- Marketplace:
        ['notify.marketplace:started_rent'] = "Du hast begonnen, das Eigentum vom Markt zu mieten.",
        ['notify.marketplace:purchased'] = "Du hast das Eigentum vom Markt gekauft.",
        ['notify.marketplace:rented'] = "Dein Eigentum wurde über den Markt vermietet. Es wurde von %s gemietet.",
        ['notify.marketplace:sold'] = "Dein Eigentum wurde über den Markt verkauft. Es wurde von %s gekauft.",
        ['notify.marketplace:marked_on_gps'] = "Eigentum auf GPS markiert.",

        -- Raid:
        ['notify.raid:anti_burglary_doors'] = "Du kannst dieses Eigentum nicht überfallen. Es wird durch Anti-Einbruchstüren geschützt.",
        ['notify.raid:missing_job'] = "Du hast nicht den erforderlichen Job, um dieses Eigentum zu überfallen.",
        ['notify.raid:missing_item'] = "Dir fehlt ein erforderlicher Gegenstand, um den Überfall durchzuführen.",
        ['notify.raid:failed_due_to_anti_burglary'] = "Dein Versuch einzubrechen ist fehlgeschlagen. Die Anti-Einbruchstüren haben die Eindringung widerstanden.",

        -- Safe:
        ['notify.safe:cannot_set_same_pin'] = "Du kannst nicht die gleiche PIN wie die aktuelle setzten.",
        ['notify.safe:wrong_old_pin_was_entered'] = "Die alte eingegebene PIN ist falsch.",
        ['notify.safe:changed_pin'] = "PIN von %s auf %s geändert.",

        -- Lockpick:
        ['notify.lockpick:alarm_start'] = "Alarm ausgelöst! Lockpicking-Versuch erkannt.",
        ['notify.lockpick:alarm_success'] = "Alarm ausgelöst! Das Schloss wurde geknackt.",
        ['notify.lockpick:alarm_failed'] = "Alarm ausgelöst! Lockpicking-Versuch fehlgeschlagen.",
        ['notify.lockpick:missing_item'] = "Du hast kein Dietrich in deinem Inventar!",
        ['notify.lockpick:failed_not_enough_police'] = "Nicht genug Polizei online, um einen Lockpick-Versuch zu starten.",
        ['notify.lockpick:failed_owner_not_online'] = "Der Eigentümer ist nicht online, du kannst sein Eigentum nicht aufbrechen.",

        -- Lockdown:
        ['notify.lockdown:missing_item'] = "Du hast den erforderlichen Gegenstand nicht in deinem Inventar!",

        -- Permissions:
        ['notify.permissions:cannot_remove_owner'] = "Du kannst die Berechtigungen des Eigentümers nicht entfernen.",
        ['notify.permissions:cannot_remove_self'] = "Du kannst deine eigenen Berechtigungen nicht entfernen.",
        ['notify.permissions:error'] = "Ein Fehler ist aufgetreten.",

        -- Creator:
        ['notify.creator:copied_code'] = "Du hast den Code kopiert, füge ihn in deine Konfigurationsdatei ein!",
        ['notify.creator:out_of_zone'] = "Du kannst es nicht außerhalb der Hofzone platzieren!",
        ['notify.creator:cannot_inside_property'] = "You need to get out of the property...",
    },
    ['FR'] = {
        ['control.gizmo:select'] = "Sélection du Gizmo",
        ['control.gizmo:translation'] = "Translation du Gizmo",
        ['control.gizmo:rotation'] = "Rotation du Gizmo",
        
        -- Blips:
        ['blip.motel'] = "Motel",
        ['blip.building'] = "Appartement",
        ['blip.house_agency'] = "Propriété de l'agence",
        ['blip.house_owner'] = "Propriété Possédée",
        ['blip.house_renter'] = "Propriété Louée",
        ['blip.house_key_holder'] = "Propriété Possédée",
        ['blip.house_for_sale'] = "Propriété À Vendre",
        ['blip.marketplace'] = "Place du Marché Immobilier",
        ['blip.alarm'] = "Alarme Maison",
        
        -- Sale / Rent Sign
        ['dui.sale_sign:for_sale'] = "FOR SALE",
        ['dui.sale_sign:for_rent'] = "FOR RENT",
        ['dui.sale_sign:price'] = "${0}",
        ['dui.sale_sign:rent_weekly'] = "${0}<span>/week</span>",
        ['dui.sale_sign:rent_monthly'] = "${0}<span>/month</span>",

        -- 3D Text Main:
        ['3dtext.agency_showroom'] = "~p~[E]~s~ Showroom",
        ['3dtext.marketplace'] = "~p~[E]~s~ Place du Marché",
        ['3dtext.view_house'] = "~p~[E]~s~ Voir l'offre",
        ['3dtext.building'] = "~p~[E]~s~ Building",
        ['3dtext.reception'] = "~p~[E]~s~ Reception",
        ['3dtext.show_house'] = "~p~[E]~s~ Montrer",
        ['3dtext.exit_house'] = "~p~[E]~s~ Sortir",
        ['3dtext.parking'] = "~p~[E]~s~ Parking",
        ['3dtext.garage'] = "~p~[E]~s~ Garage",
        ['3dtext.wardrobe'] = "~p~[E]~s~ Garde-robe",
        ['3dtext.storage'] = "~p~[E]~s~ Stockage",
        ['3dtext.emergency_exit'] = "~p~[E]~s~ Sortie de secours",
        ['3dtext.power_box'] = '~p~[E]~s~ Boîte de puissance',

        -- Text UI Main:
        ['textui.agency_showroom'] = "Showroom",
        ['textui.marketplace'] = "Place du Marché",
        ['textui.view_house'] = "Voir l'offre",
        ['textui.building'] = "Building",
        ['textui.reception'] = "Reception",
        ['textui.show_house'] = "Montrer",
        ['textui.exit_house'] = "Sortir",
        ['textui.parking'] = "Parking",
        ['textui.garage'] = "Garage",
        ['textui.wardrobe'] = "Garde-robe",
        ['textui.storage'] = "Stockage",
        ['textui.emergency_exit'] = "Sortie de secours",
        ['textui.power_box'] = 'Boîte de puissance',
        ['textui.door'] = 'Door',

        ['menu:header'] = "Propriété #%s",
        ['menu.enter'] = "Entrer",
        ['menu.exit'] = "Sortir",
        ['menu.manage'] = "Gérer",
        ['menu.furniture'] = "Meubles",
        ['menu.toggle_light'] = "Activer/Désactiver la Lumière",
        ['menu.toggle_lock'] = "Activer/Désactiver la Serrure",
        ['menu.lockpick'] = "Crochetage",
        ['menu.lockdown'] = "Confinement",
        ['menu.removeseal'] = "Retirer le Sceau de Police",
        ['menu.raid'] = "Raid",
        ['menu.complete_raid'] = "Fermer les Portes",
        ['menu.doorbell'] = "Sonner à la Porte",
        ['menu.door_peephole'] = "Œilleton",
        ['menu.enter_underground_parking'] = "Entrer au parking (Étage -%s)",

        ['menu.power_box_open'] = "Ouvrir la boîte de puissance",
        ['menu.power_box_close'] = "Fermer la boîte de puissance",
        ['menu.power_box_destroy'] = "Détruire",
        ['menu.power_box_turn_off'] = "Éteindre",
        ['menu.power_box_turn_on'] = "Allumer",
        ['menu.power_box_repair'] = "Réparer",

        -- Target Main:
        ['target.agency_showroom'] = "Showroom",
        ['target.marketplace'] = "Place du Marché",
        ['target.view_house'] = "Voir l'offre",
        ['target.building'] = "Building",
        ['target.reception'] = "Reception",
        ['target.enter'] = "Entrer",
        ['target.exit'] = "Sortir",
        ['target.garage'] = "Garage",
        ['target.wardrobe'] = "Garde-robe",
        ['target.storage'] = "Stockage",
        ['target.manage'] = "Gérer",
        ['target.furniture'] = "Meubles",
        ['target.toggle_light'] = "Activer/Désactiver la Lumière",
        ['target.toggle_lock'] = "Activer/Désactiver la Serrure",
        ['target.toggle_lock_door'] = "Activer/Désactiver la Serrure",
        ['target.doorbell'] = "Sonner à la Porte",
        ['target.door_peephole'] = "Œilleton",
        ['target.lockpick'] = "Crochetage",
        ['target.lockdown'] = "Confinement",
        ['target.removeseal'] = "Retirer le Sceau de Police",
        ['target.raid'] = "Raid",
        ['target.complete_raid'] = "Fermer les Portes",
        ['target.enter_underground_parking'] = "Entrer au parking (Étage -%s)",
        ['target.emergency_exit'] = "Sortie de secours",

        -- Furniture Interactable:
        ['target.interactable:delivery'] = 'Déballer la livraison',
        ['target.interactable:wardrobe'] = 'Garde-robe',
        ['target.interactable:storage'] = 'Stockage',
        ['target.interactable:safe'] = 'Coffre-fort',
        ['target.interactable:device'] = 'Ordinateur portable',
        ['target.interactable:mop'] = 'Balai',
        ['target.interactable:mower'] = 'Mower',
        ['target.interactable:power_box_open'] = 'Ouvrir la boîte de puissance',
        ['target.interactable:power_box_close'] = 'Fermer la boîte de puissance',
        ['target.interactable:power_box_destroy'] = 'Détruire',
        ['target.interactable:power_box_turn_off'] = 'Éteindre',
        ['target.interactable:power_box_turn_on'] = 'Allumer',
        ['target.interactable:power_box_repair'] = 'Réparer',

        ['3dtext.interactable:delivery'] = '~p~[E]~s~ Déballer la livraison',
        ['3dtext.interactable:wardrobe'] = '~p~[E]~s~ Garde-robe',
        ['3dtext.interactable:storage'] = '~p~[E]~s~ Stockage',
        ['3dtext.interactable:safe'] = '~p~[E]~s~ Coffre-fort',
        ['3dtext.interactable:device'] = '~p~[E]~s~ Ordinateur portable',
        ['3dtext.interactable:mop'] = '~p~[E]~s~ Balai',
        ['3dtext.interactable:mower'] = '~p~[E]~s~ Mower',

        ['textui.interactable:delivery'] = 'Déballer la livraison',
        ['textui.interactable:wardrobe'] = 'Garde-robe',
        ['textui.interactable:storage'] = 'Stockage',
        ['textui.interactable:safe'] = 'Coffre-fort',
        ['textui.interactable:device'] = 'Ordinateur portable',
        ['textui.interactable:mop'] = 'Balai',
        ['textui.interactable:mower'] = 'Mower',

        -- Static Interactable:
        ['target.interactable:sink'] = 'Lavez-vous les mains',
        ['target.interactable:sink_drink'] = 'Boire',
        ['target.interactable:shower'] = 'Prendre une douche',

        ['3dtext.interactable'] = '~p~[E]~s~',

        ['textui.interactable'] = '',

        ['menu.interactable:sink'] = 'Lavez-vous les mains',
        ['menu.interactable:sink_drink'] = 'Boire',
        ['menu.interactable:shower'] = 'Prendre une douche',

        -- General:
        ['notify.wait'] = "Réessayez plus tard...",
        ['notify.not_allowed'] = "Vous n'êtes pas autorisé à faire cela!",
        ['notify.not_enough_money'] = "Vous n'avez pas assez d'argent!",
        ['notify.reached_properties_limit'] = "Vous avez atteint la limite de propriétés !",

        -- Commands:
        ['notify.command_giveproperty:success'] = "You have given property %s to player %s.",
        ['notify.command_giveproperty:player_offline'] = "Player is offline.",
        ['notify.command_giveproperty:property_doesnt_exist'] = "Property %s doesn't exist.",
        ['notify.command_giveproperty:invalid_property_type'] = "You can't give a property of this type.",
        ['notify.command_giveproperty:property_has_owner'] = "Property %s already have an owner.",
        
        -- Property:
        ['notify.property:purchased'] = "Vous avez acheté cette propriété pour $%s.",
        ['notify.property:rented_monthly'] = "Vous louez maintenant cette propriété pour $%s par mois.",
        ['notify.property:rented_weekly'] = "Vous louez maintenant cette propriété pour $%s par semaine.",
        ['notify.property:already_owned'] = "Vous possédez déjà cette propriété.",
        ['notify.property:marketplace_blocked_by_renter'] = "Vous ne pouvez pas accéder à la place du marché tant que cette propriété est louée.",
        ['notify.property:cannot_sell_with_renter'] = "Vous ne pouvez pas vendre la propriété lorsqu'elle est louée.",
        ['notify.property:sold_property'] = "Vous avez réussi à vendre la propriété pour $%s.",
        ['notify.property:purchased_theme'] = "Vous avez acheté le thème %s pour $%s.",
        ['notify.property:purchased_furniture'] = "Vous avez acheté les meubles %s pour $%s.",
        ['notify.property:ordered_furniture'] = "Vous avez commandé les meubles %s pour $%s.",
        ['notify.property:reached_furniture_limit'] = "Vous avez atteint la limite de meubles!<br>Vendez vos meubles actuels ou améliorez la limite de meubles.",
        ['notify.property:reached_furniture_model_limit'] = "You have reached the furniture limit!<br>Limit of %s is %s, you can't have more of them.",
        ['notify.property:no_electricity'] = "Vous ne pouvez pas allumer les lumières, il n'y a pas d'électricité. Veuillez payer vos factures!",
        ['notify.property:no_power'] = "You cannot do that - the power box is turned off.",
        ['notify.property:purchased_upgrade'] = "Vous avez acheté l'amélioration: %s pour $%s.",
        ['notify.property:purchased_upgrade_free'] = "Vous avez reçu l'amélioration: %s gratuitement.",
        ['notify.property:marketplace_offer_added'] = "La propriété a été listée sur la place du marché.",
        ['notify.property:marketplace_offer_updated'] = "L'offre de propriété a été mise à jour.",
        ['notify.property:marketplace_offer_removed'] = "La propriété a été retirée de la place du marché.",
        ['notify.property:marketplace_photomode_on'] = "Mode photo activé.",
        ['notify.property:marketplace_photomode_off'] = "Mode photo désactivé.",
        ['notify.property:paid_services'] = "Vous avez payé $%s pour les factures de services pour la période %s.",
        ['notify.property:paid_rent'] = "Vous avez payé $%s pour le loyer de la période %s.",
        ['notify.property:rent_terminated_now'] = "Le contrat de location a été résilié immédiatement.",
        ['notify.property:rent_termination_scheduled'] = "Le contrat de location se terminera à la fin du mois en cours.",
        ['notify.property:rent_termination_cancelled'] = "La résiliation de la location a été annulée.",
        ['notify.property:wardrobe_moved'] = "Vous avez mis à jour l'emplacement de la garde-robe.",
        ['notify.property:storage_moved'] = "Vous avez mis à jour l'emplacement du stockage.",
        ['notify.property:already_have_keys'] = "Ce joueur détient déjà les clés de cette propriété.",
        ['notify.property:added_keys'] = "Vous avez remis la clé pour %s.",
        ['notify.property:player_dont_have_keys'] = "Ce joueur ne détient pas les clés de la propriété.",
        ['notify.property:removed_keys'] = "Vous avez pris les clés du %s.",
        ['notify.property:reached_keys_limit'] = "Vous avez atteint la limite de clés!",
        ['notify.property:reached_permissions_limit'] = "Vous avez atteint la limite de joueurs avec permissions!",
        ['notify.property:moved_out'] = "Vous avez déménagé avec succès. La location a été résiliée.",
        ['notify.property:furniture_is_used'] = "Ce meuble est utilisé, vous ne pouvez pas faire cela maintenant.",
        ['notify.property:put_the_mop_away'] = "Vous devez ranger le balai - vous ne pouvez pas sortir avec.",

        -- Cameras:
        ['notify.cameras:no_cameras_installed'] = "Vous n'avez installé aucune caméra.",

        -- Alarm Alert:
        ['notify.alarm_alert:code_already_sent'] = "The verification code has already been sent. Please wait a moment before requesting a new code.",
        ['notify.alarm_alert:already_set'] = "Alarm is already set up.",
        ['notify.alarm_alert:invalid_phone_number'] = "The phone number you entered is invalid.",
        ['notify.alarm_alert:code_expired'] = "The authentication code has expired. Please request a new one.",
        ['notify.alarm_alert:invalid_code'] = "The authentication code you entered is invalid.",
        ['notify.alarm_alert:code_verified'] = "The authentication code has been verified. The alarm has been successfully activated for number %s.",
        ['notify.alarm_alert:removed'] = "The phone number has been removed, you will no longer receive alarm notifications.",

        ['sms.alarm:sender'] = "Alarm System",
        ['sms.alarm:authentication_code'] = "Your alarm authentication code is: %s. It will expire in %s seconds.",
        ['sms.alarm:authentication_success'] = "✅ The number %s has been successfully linked to the alarm system at %s %s. You will now receive notifications whenever the alarm is triggered.",
        ['sms.alarm:authentication_removed'] = "❌ The number %s has been unlinked from the alarm system at %s %s. You will no longer receive notifications from this property.",
        ['sms.alarm:lockpick_start'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_success'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_fail'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",

        -- Furniture:
        ['notify.furniture:removed'] = "Meuble #%s retiré.",
        ['notify.furniture:sold'] = "Meuble #%s vendu pour $%s",
        ['notify.furniture:cannot_sold'] = "Ce meuble ne peut pas être vendu.",
        ['notify.furniture:you_are_in_furniture_mode'] = "Vous ne pouvez pas faire cela car vous êtes en mode meubles.",
        ['notify.furniture:cannot_place_inside'] = "Vous ne pouvez pas placer ce meuble à l'intérieur de la propriété.",
        ['notify.furniture:inside_disabled'] = "Cette propriété n'autorise pas les meubles à l'intérieur.",
        ['notify.furniture:cannot_place_outside'] = "Vous ne pouvez pas placer ce meuble à l'extérieur de la propriété.",
        ['notify.furniture:outside_disabled'] = "Cette propriété n'autorise pas les meubles d'extérieur.",
        ['notify.furniture:no_outdoor_area'] = "Cette propriété n'a pas d'espace extérieur.",
        ['notify.furniture:outside_zone'] = "Vous ne pouvez pas placer de meubles en dehors de la zone de la propriété.",
        ['notify.furniture:mode_cooldown'] = "Vous devez attendre avant de changer de mode à nouveau.",

        -- Doors:
        ['notify.doors:wait'] = "Vous ne pouvez pas ouvrir et fermer la porte si souvent.",

        -- Mop:
        ['notify.mop:you_cannot_put_down'] = "Vous ne pouvez pas poser le balai dans un autre seau - remettez-le dans votre seau.",

        -- Power Box:
        ['notify.powerbox:missing_item_turn_on'] = "Vous manquez d'un objet nécessaire pour allumer l'électricité.",
        ['notify.powerbox:missing_item_repair'] = "Vous manquez d'un objet nécessaire pour réparer la boîte de puissance.",
        ['notify.powerbox:missing_item_turn_off'] = "Vous manquez d'un objet nécessaire pour éteindre l'électricité.",
        ['notify.powerbox:missing_item_destroy'] = "Vous manquez d'un objet nécessaire pour détruire la boîte de puissance.",

        -- Contract:
        ['notify.contract:player_too_far'] = "Le joueur ciblé est trop loin pour signer le contrat.",
        ['notify.contract:sent'] = "Vous avez envoyé un contrat de propriété à %s.",
        ['notify.contract:canceled'] = "Le joueur n'a pas signé le contrat.",
        ['notify.contract:seller_too_far'] = "L'autre joueur est trop loin pour finaliser le contrat.",
        ['notify.contract:purchased_from_player'] = "Vous avez acheté la propriété à %s.",
        ['notify.contract:sold_to_player'] = "Vous avez vendu la propriété avec succès à %s.",
        ['notify.contract:rented_to_player'] = "Vous avez loué avec succès la propriété à %s.",
        ['notify.contract:started_rent_from_player'] = "Vous avez loué la propriété de %s.",
        ['notify.contract:already_rented'] = "Cette propriété est déjà louée par un autre joueur.",

        -- Marketplace:
        ['notify.marketplace:started_rent'] = "Vous avez commencé à louer la propriété depuis la place du marché.",
        ['notify.marketplace:purchased'] = "Vous avez acheté la propriété depuis la place du marché.",
        ['notify.marketplace:rented'] = "Votre propriété a été louée via la place du marché. Elle a été louée par %s.",
        ['notify.marketplace:sold'] = "Votre propriété a été vendue via la place du marché. Elle a été achetée par %s.",
        ['notify.marketplace:marked_on_gps'] = "Propriété marquée sur le GPS.",

        -- Raid:
        ['notify.raid:anti_burglary_doors'] = "Vous ne pouvez pas raid cette propriété. Elle est protégée par des portes anti-effraction.",
        ['notify.raid:missing_job'] = "Vous n'avez pas le travail requis pour raid cette propriété.",
        ['notify.raid:missing_item'] = "Vous manquez d'un objet requis pour effectuer le raid.",
        ['notify.raid:failed_due_to_anti_burglary'] = "Votre tentative d'effraction a échoué. Les portes anti-effraction ont résisté à l'intrusion.",

        -- Safe:
        ['notify.safe:cannot_set_same_pin'] = "Vous ne pouvez pas définir le même code PIN que celui actuel.",
        ['notify.safe:wrong_old_pin_was_entered'] = "Le vieux code PIN que vous avez saisi est incorrect.",
        ['notify.safe:changed_pin'] = "Code PIN changé de %s à %s.",

        -- Lockpick:
        ['notify.lockpick:alarm_start'] = "Alarme déclenchée! Tentative de crochetage détectée.",
        ['notify.lockpick:alarm_success'] = "Alarme déclenchée! La serrure a été crochetée avec succès.",
        ['notify.lockpick:alarm_failed'] = "Alarme déclenchée! La tentative de crochetage a échoué.",
        ['notify.lockpick:missing_item'] = "Vous n'avez pas de crochet de serrure dans votre inventaire!",
        ['notify.lockpick:failed_not_enough_police'] = "Pas assez de police en ligne pour tenter un crochetage.",
        ['notify.lockpick:failed_owner_not_online'] = "Le propriétaire n'est pas en ligne, vous ne pouvez pas crocheter sa propriété.",

        -- Lockdown:
        ['notify.lockdown:missing_item'] = "Vous n'avez pas l'objet requis dans votre inventaire!",

        -- Permissions:
        ['notify.permissions:cannot_remove_owner'] = "Vous ne pouvez pas supprimer les permissions du propriétaire.",
        ['notify.permissions:cannot_remove_self'] = "Vous ne pouvez pas supprimer vos propres permissions.",
        ['notify.permissions:error'] = "Une erreur s'est produite.",

        -- Creator:
        ['notify.creator:copied_code'] = "Vous avez copié le code, collez-le dans votre fichier de configuration!",
        ['notify.creator:out_of_zone'] = "Vous ne pouvez pas le placer en dehors de la zone de la cour!",
        ['notify.creator:cannot_inside_property'] = "You need to get out of the property...",
    },
    ['ES'] = {
        ['control.gizmo:select'] = "Seleccionar Gizmo",
        ['control.gizmo:translation'] = "Traducción Gizmo",
        ['control.gizmo:rotation'] = "Rotación Gizmo",
        
        -- Blips:
        ['blip.motel'] = "Motel",
        ['blip.building'] = "Apartamento",
        ['blip.house_agency'] = "Propiedad de la Agencia",
        ['blip.house_owner'] = "Propiedad Propia",
        ['blip.house_renter'] = "Propiedad Alquilada",
        ['blip.house_key_holder'] = "Propiedad Propia",
        ['blip.house_for_sale'] = "Propiedad en Venta",
        ['blip.marketplace'] = "Mercado de Propiedades",
        ['blip.alarm'] = "Alarma de Casa",
        
        -- Sale / Rent Sign
        ['dui.sale_sign:for_sale'] = "FOR SALE",
        ['dui.sale_sign:for_rent'] = "FOR RENT",
        ['dui.sale_sign:price'] = "${0}",
        ['dui.sale_sign:rent_weekly'] = "${0}<span>/week</span>",
        ['dui.sale_sign:rent_monthly'] = "${0}<span>/month</span>",

        -- 3D Text Main:
        ['3dtext.agency_showroom'] = "~p~[E]~s~ Sala de Exposición",
        ['3dtext.marketplace'] = "~p~[E]~s~ Mercado",
        ['3dtext.view_house'] = "~p~[E]~s~ Ver Oferta",
        ['3dtext.building'] = "~p~[E]~s~ Building",
        ['3dtext.reception'] = "~p~[E]~s~ Reception",
        ['3dtext.show_house'] = "~p~[E]~s~ Mostrar",
        ['3dtext.exit_house'] = "~p~[E]~s~ Salir",
        ['3dtext.parking'] = "~p~[E]~s~ Parking",
        ['3dtext.garage'] = "~p~[E]~s~ Cochera",
        ['3dtext.wardrobe'] = "~p~[E]~s~ Armario",
        ['3dtext.storage'] = "~p~[E]~s~ Almacén",
        ['3dtext.emergency_exit'] = "~p~[E]~s~ Salida de emergencia",
        ['3dtext.power_box'] = '~p~[E]~s~ Caja de Electricidad',

        -- Text UI Main:
        ['textui.agency_showroom'] = "Sala de Exposición",
        ['textui.marketplace'] = "Mercado",
        ['textui.view_house'] = "Ver Oferta",
        ['textui.building'] = "Building",
        ['textui.reception'] = "Reception",
        ['textui.show_house'] = "Mostrar",
        ['textui.exit_house'] = "Salir",
        ['textui.parking'] = "Parking",
        ['textui.garage'] = "Cochera",
        ['textui.wardrobe'] = "Armario",
        ['textui.storage'] = "Almacén",
        ['textui.emergency_exit'] = "Salida de emergencia",
        ['textui.power_box'] = 'Caja de Electricidad',
        ['textui.door'] = 'Door',

        ['menu:header'] = "Propiedad #%s",
        ['menu.enter'] = "Entrar",
        ['menu.exit'] = "Salir",
        ['menu.manage'] = "Administrar",
        ['menu.furniture'] = "Furniture",
        ['menu.toggle_light'] = "Cambiar Luz",
        ['menu.toggle_lock'] = "Cambiar Cerradura",
        ['menu.lockpick'] = "Forzar Cerradura",
        ['menu.lockdown'] = "Cierre",
        ['menu.removeseal'] = "Remover Sello Policial",
        ['menu.raid'] = "Asaltar",
        ['menu.complete_raid'] = "Cerrar Puertas",
        ['menu.doorbell'] = "Timbrar",
        ['menu.door_peephole'] = "Mirilla",
        ['menu.enter_underground_parking'] = "Entrar al estacionamiento (Piso -%s)",

        ['menu.power_box_open'] = "Abrir Caja de Electricidad",
        ['menu.power_box_close'] = "Cerrar Caja de Electricidad",
        ['menu.power_box_destroy'] = "Destruir",
        ['menu.power_box_turn_off'] = "Apagar",
        ['menu.power_box_turn_on'] = "Encender",
        ['menu.power_box_repair'] = "Reparar",

        -- Target Main:
        ['target.agency_showroom'] = "Sala de Exposición",
        ['target.marketplace'] = "Mercado",
        ['target.view_house'] = "Ver Oferta",
        ['target.building'] = "Building",
        ['target.reception'] = "Reception",
        ['target.enter'] = "Entrar",
        ['target.exit'] = "Salir",
        ['target.garage'] = "Cochera",
        ['target.wardrobe'] = "Armario",
        ['target.storage'] = "Almacén",
        ['target.manage'] = "Administrar",
        ['target.furniture'] = "Muebles",
        ['target.toggle_light'] = "Cambiar Luz",
        ['target.toggle_lock'] = "Cambiar Cerradura",
        ['target.toggle_lock_door'] = "Cambiar Cerradura",
        ['target.doorbell'] = "Timbrar",
        ['target.door_peephole'] = "Mirilla",
        ['target.lockpick'] = "Forzar Cerradura",
        ['target.lockdown'] = "Cierre",
        ['target.removeseal'] = "Remover Sello Policial",
        ['target.raid'] = "Asaltar",
        ['target.complete_raid'] = "Cerrar Puertas",
        ['target.enter_underground_parking'] = "Entrar al estacionamiento (Piso -%s)",
        ['target.emergency_exit'] = "Salida de emergencia",

        -- Furniture Interactable:
        ['target.interactable:delivery'] = 'Desempacar envío',
        ['target.interactable:wardrobe'] = 'Armario',
        ['target.interactable:storage'] = 'Almacén',
        ['target.interactable:safe'] = 'Caja Fuerte',
        ['target.interactable:device'] = 'Laptop',
        ['target.interactable:mop'] = 'Trapo',
        ['target.interactable:mower'] = 'Mower',

        ['target.interactable:power_box_open'] = 'Abrir Caja de Electricidad',
        ['target.interactable:power_box_close'] = 'Cerrar Caja de Electricidad',
        ['target.interactable:power_box_destroy'] = 'Destruir',
        ['target.interactable:power_box_turn_off'] = 'Apagar',
        ['target.interactable:power_box_turn_on'] = 'Encender',
        ['target.interactable:power_box_repair'] = 'Reparar',

        ['3dtext.interactable:delivery'] = '~p~[E]~s~ Desempacar envío',
        ['3dtext.interactable:wardrobe'] = '~p~[E]~s~ Armario',
        ['3dtext.interactable:storage'] = '~p~[E]~s~ Almacén',
        ['3dtext.interactable:safe'] = '~p~[E]~s~ Caja Fuerte',
        ['3dtext.interactable:device'] = '~p~[E]~s~ Laptop',
        ['3dtext.interactable:mop'] = '~p~[E]~s~ Trapo',
        ['3dtext.interactable:mower'] = '~p~[E]~s~ Mower',

        ['textui.interactable:delivery'] = 'Desempacar envío',
        ['textui.interactable:wardrobe'] = 'Armario',
        ['textui.interactable:storage'] = 'Almacén',
        ['textui.interactable:safe'] = 'Caja Fuerte',
        ['textui.interactable:device'] = 'Laptop',
        ['textui.interactable:mop'] = 'Trapo',
        ['textui.interactable:mower'] = 'Mower',

        -- Static Interactable:
        ['target.interactable:sink'] = 'Lavarse las manos',
        ['target.interactable:sink_drink'] = 'Beber',
        ['target.interactable:shower'] = 'Tomar una ducha',

        ['3dtext.interactable'] = '~p~[E]~s~',

        ['textui.interactable'] = '',

        ['menu.interactable:sink'] = 'Lavarse las manos',
        ['menu.interactable:sink_drink'] = 'Beber',
        ['menu.interactable:shower'] = 'Tomar una ducha',

        -- General:
        ['notify.wait'] = "Intenta de nuevo más tarde...",
        ['notify.not_allowed'] = "¡No tienes permitido hacer eso!",
        ['notify.not_enough_money'] = "¡No tienes suficiente dinero!",
        ['notify.reached_properties_limit'] = "¡Has alcanzado el límite de propiedades!",
        
        -- Commands:
        ['notify.command_giveproperty:success'] = "You have given property %s to player %s.",
        ['notify.command_giveproperty:player_offline'] = "Player is offline.",
        ['notify.command_giveproperty:property_doesnt_exist'] = "Property %s doesn't exist.",
        ['notify.command_giveproperty:invalid_property_type'] = "You can't give a property of this type.",
        ['notify.command_giveproperty:property_has_owner'] = "Property %s already have an owner.",
        
        -- Property:
        ['notify.property:purchased'] = "Has comprado esta propiedad por $%s.",
        ['notify.property:rented_monthly'] = "Ahora estás alquilando esta propiedad por $%s al mes.",
        ['notify.property:rented_weekly'] = "Ahora estás alquilando esta propiedad por $%s a la semana.",
        ['notify.property:already_owned'] = "Ya posees esta propiedad.",
        ['notify.property:marketplace_blocked_by_renter'] = "No puedes acceder al mercado mientras esta propiedad esté alquilada.",
        ['notify.property:cannot_sell_with_renter'] = "No puedes vender la propiedad mientras esté alquilada.",
        ['notify.property:sold_property'] = "Has vendido la propiedad con éxito por $%s.",
        ['notify.property:purchased_theme'] = "Has comprado el tema %s por $%s.",
        ['notify.property:purchased_furniture'] = "Has comprado el mueble %s por $%s.",
        ['notify.property:ordered_furniture'] = "Has ordenado el mueble %s por $%s.",
        ['notify.property:reached_furniture_limit'] = "¡Has alcanzado el límite de muebles!<br>Vende tus muebles actuales o aumenta el Límite de Muebles.",
        ['notify.property:reached_furniture_model_limit'] = "You have reached the furniture limit!<br>Limit of %s is %s, you can't have more of them.",
        ['notify.property:no_electricity'] = "No puedes encender las luces - no hay electricidad. ¡Por favor, paga tus facturas!",
        ['notify.property:no_power'] = "You cannot do that - the power box is turned off.",
        ['notify.property:purchased_upgrade'] = "Has comprado la mejora: %s por $%s.",
        ['notify.property:purchased_upgrade_free'] = "Recibiste la mejora: %s gratis.",
        ['notify.property:marketplace_offer_added'] = "La propiedad ha sido listada en el mercado.",
        ['notify.property:marketplace_offer_updated'] = "La oferta de la propiedad ha sido actualizada.",
        ['notify.property:marketplace_offer_removed'] = "La propiedad ha sido eliminada del mercado.",
        ['notify.property:marketplace_photomode_on'] = "Modo foto habilitado.",
        ['notify.property:marketplace_photomode_off'] = "Modo foto deshabilitado.",
        ['notify.property:paid_services'] = "Pagaste $%s por los recibos de servicios del período %s.",
        ['notify.property:paid_rent'] = "Pagaste $%s por el alquiler del período %s.",
        ['notify.property:rent_terminated_now'] = "El contrato de alquiler ha sido terminado inmediatamente.",
        ['notify.property:rent_termination_scheduled'] = "El contrato de alquiler terminará al final del mes actual.",
        ['notify.property:rent_termination_cancelled'] = "La terminación del contrato de alquiler ha sido cancelada.",
        ['notify.property:wardrobe_moved'] = "Has actualizado la ubicación del armario.",
        ['notify.property:storage_moved'] = "Has actualizado la ubicación del almacén.",
        ['notify.property:already_have_keys'] = "Este jugador ya tiene las llaves de esta propiedad.",
        ['notify.property:added_keys'] = "Le has dado las llaves a %s.",
        ['notify.property:player_dont_have_keys'] = "Este jugador no tiene las llaves de la propiedad.",
        ['notify.property:removed_keys'] = "Has quitado las llaves de %s.",
        ['notify.property:reached_keys_limit'] = "¡Has alcanzado el límite de llaves!",
        ['notify.property:reached_permissions_limit'] = "¡Has alcanzado el límite de jugadores con permisos!",
        ['notify.property:moved_out'] = "Has salido con éxito. El alquiler ha sido terminado.",
        ['notify.property:furniture_is_used'] = "Este mueble está siendo utilizado, no puedes hacer eso ahora.",
        ['notify.property:put_the_mop_away'] = "Debes guardar el trapo, no puedes salir con él.",

        -- Cameras:
        ['notify.cameras:no_cameras_installed'] = "No tienes cámaras instaladas.",

        -- Alarm Alert:
        ['notify.alarm_alert:code_already_sent'] = "The verification code has already been sent. Please wait a moment before requesting a new code.",
        ['notify.alarm_alert:already_set'] = "Alarm is already set up.",
        ['notify.alarm_alert:invalid_phone_number'] = "The phone number you entered is invalid.",
        ['notify.alarm_alert:code_expired'] = "The authentication code has expired. Please request a new one.",
        ['notify.alarm_alert:invalid_code'] = "The authentication code you entered is invalid.",
        ['notify.alarm_alert:code_verified'] = "The authentication code has been verified. The alarm has been successfully activated for number %s.",
        ['notify.alarm_alert:removed'] = "The phone number has been removed, you will no longer receive alarm notifications.",

        ['sms.alarm:sender'] = "Alarm System",
        ['sms.alarm:authentication_code'] = "Your alarm authentication code is: %s. It will expire in %s seconds.",
        ['sms.alarm:authentication_success'] = "✅ The number %s has been successfully linked to the alarm system at %s %s. You will now receive notifications whenever the alarm is triggered.",
        ['sms.alarm:authentication_removed'] = "❌ The number %s has been unlinked from the alarm system at %s %s. You will no longer receive notifications from this property.",
        ['sms.alarm:lockpick_start'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_success'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_fail'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",

        -- Furniture:
        ['notify.furniture:removed'] = "Mueble #%s eliminado.",
        ['notify.furniture:sold'] = "Mueble #%s vendido por $%s",
        ['notify.furniture:cannot_sold'] = "Este mueble no se puede vender.",
        ['notify.furniture:you_are_in_furniture_mode'] = "No puedes hacer esto porque estás en modo de muebles.",
        ['notify.furniture:cannot_place_inside'] = "No puedes colocar este mueble dentro de la propiedad.",
        ['notify.furniture:inside_disabled'] = "Esta propiedad no permite muebles en su interior.",
        ['notify.furniture:cannot_place_outside'] = "No puedes colocar este mueble fuera de la propiedad.",
        ['notify.furniture:outside_disabled'] = "Esta propiedad no permite muebles exteriores.",
        ['notify.furniture:no_outdoor_area'] = "Esta propiedad no tiene área exterior.",
        ['notify.furniture:outside_zone'] = "No puedes colocar muebles fuera de la zona de la propiedad.",
        ['notify.furniture:mode_cooldown'] = "Debes esperar antes de cambiar de modo nuevamente.",

        -- Doors:
        ['notify.doors:wait'] = "No puedes abrir y cerrar la puerta tan seguido.",

        -- Mop:
        ['notify.mop:you_cannot_put_down'] = "No puedes colocar el trapo en otro cubo, debes ponerlo de nuevo en tu cubo.",

        -- Power Box:
        ['notify.powerbox:missing_item_turn_on'] = "Te falta un objeto necesario para encender la electricidad.",
        ['notify.powerbox:missing_item_repair'] = "Te falta un objeto necesario para reparar la caja de electricidad.",
        ['notify.powerbox:missing_item_turn_off'] = "Te falta un objeto necesario para apagar la electricidad.",
        ['notify.powerbox:missing_item_destroy'] = "Te falta un objeto necesario para destruir la caja de electricidad.",

        -- Contract:
        ['notify.contract:player_too_far'] = "El jugador objetivo está demasiado lejos para firmar el contrato.",
        ['notify.contract:sent'] = "Has enviado un contrato de propiedad a %s.",
        ['notify.contract:canceled'] = "El jugador no ha firmado el contrato.",
        ['notify.contract:seller_too_far'] = "El otro jugador está demasiado lejos para finalizar el contrato.",
        ['notify.contract:purchased_from_player'] = "Has comprado la propiedad de %s.",
        ['notify.contract:sold_to_player'] = "Has vendido la propiedad con éxito a %s.",
        ['notify.contract:rented_to_player'] = "Has alquilado la propiedad con éxito a %s.",
        ['notify.contract:started_rent_from_player'] = "Has alquilado la propiedad de %s.",
        ['notify.contract:already_rented'] = "Esta propiedad ya está alquilada por otro jugador.",

        -- Marketplace:
        ['notify.marketplace:started_rent'] = "Has comenzado a alquilar la propiedad desde el mercado.",
        ['notify.marketplace:purchased'] = "Has comprado la propiedad del mercado.",
        ['notify.marketplace:rented'] = "Tu propiedad ha sido alquilada a través del mercado. Fue alquilada por %s.",
        ['notify.marketplace:sold'] = "Tu propiedad ha sido vendida a través del mercado. Fue comprada por %s.",
        ['notify.marketplace:marked_on_gps'] = "Propiedad marcada en GPS.",

        -- Raid:
        ['notify.raid:anti_burglary_doors'] = "No puedes saquear esta propiedad. Está protegida por puertas anti-robo.",
        ['notify.raid:missing_job'] = "No tienes el trabajo necesario para saquear esta propiedad.",
        ['notify.raid:missing_item'] = "Te falta un objeto requerido para realizar el asalto.",
        ['notify.raid:failed_due_to_anti_burglary'] = "Tu intento de ingresar ha fallado. Las puertas anti-robo resistieron la intrusión.",

        -- Safe:
        ['notify.safe:cannot_set_same_pin'] = "No puedes establecer el mismo PIN que el actual.",
        ['notify.safe:wrong_old_pin_was_entered'] = "El antiguo PIN que ingresaste es incorrecto.",
        ['notify.safe:changed_pin'] = "PIN cambiado de %s a %s.",

        -- Lockpick:
        ['notify.lockpick:alarm_start'] = "¡Alarma activada! Se detectó un intento de forzar la cerradura.",
        ['notify.lockpick:alarm_success'] = "¡Alarma activada! La cerradura ha sido forzada.",
        ['notify.lockpick:alarm_failed'] = "¡Alarma activada! El intento de forzar la cerradura falló.",
        ['notify.lockpick:missing_item'] = "¡No tienes un ganzúa en tu inventario!",
        ['notify.lockpick:failed_not_enough_police'] = "No hay suficiente policía en línea para intentar un ganzuado.",
        ['notify.lockpick:failed_owner_not_online'] = "El propietario no está en línea, no puedes ganzuar su propiedad.",

        -- Lockdown:
        ['notify.lockdown:missing_item'] = "¡No tienes el objeto requerido en tu inventario!",

        -- Permissions:
        ['notify.permissions:cannot_remove_owner'] = "No puedes quitar los permisos del propietario.",
        ['notify.permissions:cannot_remove_self'] = "No puedes quitarte tus propios permisos.",
        ['notify.permissions:error'] = "Ha ocurrido un error.",

        -- Creator:
        ['notify.creator:copied_code'] = "¡Has copiado el código, pégalo en tu archivo de configuración!",
        ['notify.creator:out_of_zone'] = "¡No puedes colocarlo fuera de la zona del patio!",
        ['notify.creator:cannot_inside_property'] = "You need to get out of the property...",
    },
    ['PT'] = {
        ['control.gizmo:select'] = "Seleção de Gizmo",
        ['control.gizmo:translation'] = "Tradução de Gizmo",
        ['control.gizmo:rotation'] = "Rotação de Gizmo",
        
        -- Blips:
        ['blip.motel'] = "Motél",
        ['blip.building'] = "Apartamento",
        ['blip.house_agency'] = "Propriedade da Agência",
        ['blip.house_owner'] = "Propriedade Própria",
        ['blip.house_renter'] = "Propriedade Alugada",
        ['blip.house_key_holder'] = "Propriedade Própria",
        ['blip.house_for_sale'] = "Propriedade à Venda",
        ['blip.marketplace'] = "Mercado de Propriedades",
        ['blip.alarm'] = "Alarme de Casa",
        
        -- Sale / Rent Sign
        ['dui.sale_sign:for_sale'] = "FOR SALE",
        ['dui.sale_sign:for_rent'] = "FOR RENT",
        ['dui.sale_sign:price'] = "${0}",
        ['dui.sale_sign:rent_weekly'] = "${0}<span>/week</span>",
        ['dui.sale_sign:rent_monthly'] = "${0}<span>/month</span>",

        -- 3D Text Main:
        ['3dtext.agency_showroom'] = "~p~[E]~s~ Sala de Exposição",
        ['3dtext.marketplace'] = "~p~[E]~s~ Mercado",
        ['3dtext.view_house'] = "~p~[E]~s~ Ver Oferta",
        ['3dtext.building'] = "~p~[E]~s~ Building",
        ['3dtext.reception'] = "~p~[E]~s~ Reception",
        ['3dtext.show_house'] = "~p~[E]~s~ Mostrar",
        ['3dtext.exit_house'] = "~p~[E]~s~ Sair",
        ['3dtext.parking'] = "~p~[E]~s~ Parking",
        ['3dtext.garage'] = "~p~[E]~s~ Garagem",
        ['3dtext.wardrobe'] = "~p~[E]~s~ Guarda-roupa",
        ['3dtext.storage'] = "~p~[E]~s~ Armazenamento",
        ['3dtext.emergency_exit'] = "~p~[E]~s~ Saída de Emergência",
        ['3dtext.power_box'] = '~p~[E]~s~ Caixa de Energia',

        -- Text UI Main:
        ['textui.agency_showroom'] = "Sala de Exposição",
        ['textui.marketplace'] = "Mercado",
        ['textui.view_house'] = "Ver Oferta",
        ['textui.building'] = "Building",
        ['textui.reception'] = "Reception",
        ['textui.show_house'] = "Mostrar",
        ['textui.exit_house'] = "Sair",
        ['textui.parking'] = "Parking",
        ['textui.garage'] = "Garagem",
        ['textui.wardrobe'] = "Guarda-roupa",
        ['textui.storage'] = "Armazenamento",
        ['textui.emergency_exit'] = "Saída de Emergência",
        ['textui.power_box'] = 'Caixa de Energia',
        ['textui.door'] = 'Door',

        ['menu:header'] = "Propriedade #%s",
        ['menu.enter'] = "Entrar",
        ['menu.exit'] = "Sair",
        ['menu.manage'] = "Gerenciar",
        ['menu.furniture'] = "Móveis",
        ['menu.toggle_light'] = "Alternar Luz",
        ['menu.toggle_lock'] = "Alternar Trava",
        ['menu.lockpick'] = "Chave de Ganzua",
        ['menu.lockdown'] = "Bloqueio",
        ['menu.removeseal'] = "Remover Selo Policial",
        ['menu.raid'] = "Invasão",
        ['menu.complete_raid'] = "Fechar Portas",
        ['menu.doorbell'] = "Ring the Doorbell",
        ['menu.door_peephole'] = "Peephole",
        ['menu.enter_underground_parking'] = "Entrar no estacionamento (Andar -%s)",

        ['menu.power_box_open'] = "Abrir Caixa de Energia",
        ['menu.power_box_close'] = "Fechar Caixa de Energia",
        ['menu.power_box_destroy'] = "Destruir",
        ['menu.power_box_turn_off'] = "Desligar",
        ['menu.power_box_turn_on'] = "Ligar",
        ['menu.power_box_repair'] = "Reparar",

        -- Target Main:
        ['target.agency_showroom'] = "Sala de Exposição",
        ['target.marketplace'] = "Mercado",
        ['target.view_house'] = "Ver Oferta",
        ['target.building'] = "Building",
        ['target.reception'] = "Reception",
        ['target.enter'] = "Entrar",
        ['target.exit'] = "Sair",
        ['target.garage'] = "Garagem",
        ['target.wardrobe'] = "Guarda-roupa",
        ['target.storage'] = "Armazenamento",
        ['target.manage'] = "Gerenciar",
        ['target.furniture'] = "Móveis",
        ['target.toggle_light'] = "Alternar Luz",
        ['target.toggle_lock'] = "Alternar Trava",
        ['target.toggle_lock_door'] = "Alternar Trava",
        ['target.doorbell'] = "Tocar a Campainha",
        ['target.door_peephole'] = "Olho Mágico",
        ['target.lockpick'] = "Chave de Ganzua",
        ['target.lockdown'] = "Bloqueio",
        ['target.removeseal'] = "Remover Selo Policial",
        ['target.raid'] = "Invasão",
        ['target.complete_raid'] = "Fechar Portas",
        ['target.enter_underground_parking'] = "Entrar no estacionamento (Andar -%s)",
        ['target.emergency_exit'] = "Saída de Emergência",

        -- Furniture Interactable:
        ['target.interactable:delivery'] = 'Desembalar remessa',
        ['target.interactable:wardrobe'] = 'Guarda-roupa',
        ['target.interactable:storage'] = 'Armazenamento',
        ['target.interactable:safe'] = 'Cofre',
        ['target.interactable:device'] = 'Laptop',
        ['target.interactable:mop'] = 'Esfregão',
        ['target.interactable:mower'] = 'Mower',
        ['target.interactable:power_box_open'] = 'Abrir Caixa de Energia',
        ['target.interactable:power_box_close'] = 'Fechar Caixa de Energia',
        ['target.interactable:power_box_destroy'] = 'Destruir',
        ['target.interactable:power_box_turn_off'] = 'Desligar',
        ['target.interactable:power_box_turn_on'] = 'Ligar',
        ['target.interactable:power_box_repair'] = 'Reparar',

        ['3dtext.interactable:delivery'] = '~p~[E]~s~ Desembalar remessa',
        ['3dtext.interactable:wardrobe'] = '~p~[E]~s~ Guarda-roupa',
        ['3dtext.interactable:storage'] = '~p~[E]~s~ Armazenamento',
        ['3dtext.interactable:safe'] = '~p~[E]~s~ Cofre',
        ['3dtext.interactable:device'] = '~p~[E]~s~ Laptop',
        ['3dtext.interactable:mop'] = '~p~[E]~s~ Esfregão',
        ['3dtext.interactable:mower'] = '~p~[E]~s~ Mower',

        ['textui.interactable:delivery'] = 'Desembalar remessa',
        ['textui.interactable:wardrobe'] = 'Guarda-roupa',
        ['textui.interactable:storage'] = 'Armazenamento',
        ['textui.interactable:safe'] = 'Cofre',
        ['textui.interactable:device'] = 'Laptop',
        ['textui.interactable:mop'] = 'Esfregão',
        ['textui.interactable:mower'] = 'Mower',

        -- Static Interactable:
        ['target.interactable:sink'] = 'Lavar as mãos',
        ['target.interactable:sink_drink'] = 'Beber',
        ['target.interactable:shower'] = 'Tomar um banho',

        ['3dtext.interactable'] = '~p~[E]~s~',

        ['textui.interactable'] = '',

        ['menu.interactable:sink'] = 'Lavar as mãos',
        ['menu.interactable:sink_drink'] = 'Beber',
        ['menu.interactable:shower'] = 'Tomar um banho',

        -- General:
        ['notify.wait'] = "Tente novamente mais tarde...",
        ['notify.not_allowed'] = "Você não tem permissão para fazer isso!",
        ['notify.not_enough_money'] = "Você não tem dinheiro suficiente!",
        ['notify.reached_properties_limit'] = "Você atingiu o limite de propriedades!",

        -- Commands:
        ['notify.command_giveproperty:success'] = "You have given property %s to player %s.",
        ['notify.command_giveproperty:player_offline'] = "Player is offline.",
        ['notify.command_giveproperty:property_doesnt_exist'] = "Property %s doesn't exist.",
        ['notify.command_giveproperty:invalid_property_type'] = "You can't give a property of this type.",
        ['notify.command_giveproperty:property_has_owner'] = "Property %s already have an owner.",
        
        -- Property:
        ['notify.property:purchased'] = "Você comprou esta propriedade por $%s.",
        ['notify.property:rented_monthly'] = "Agora você está alugando esta propriedade por $%s por mês.",
        ['notify.property:rented_weekly'] = "Agora você está alugando esta propriedade por $%s por semana.",
        ['notify.property:already_owned'] = "Você já é proprietário desta propriedade.",
        ['notify.property:marketplace_blocked_by_renter'] = "Você não pode acessar o mercado enquanto esta propriedade estiver alugada.",
        ['notify.property:cannot_sell_with_renter'] = "Você não pode vender a propriedade enquanto estiver alugada.",
        ['notify.property:sold_property'] = "Você vendeu com sucesso a propriedade por $%s.",
        ['notify.property:purchased_theme'] = "Você comprou o tema %s por $%s.",
        ['notify.property:purchased_furniture'] = "Você comprou o móvel %s por $%s.",
        ['notify.property:ordered_furniture'] = "Você encomendou o móvel %s por $%s.",
        ['notify.property:reached_furniture_limit'] = "Você atingiu o limite de móveis!<br>Venda seus móveis atuais ou atualize o Limite de Móveis.",
        ['notify.property:reached_furniture_model_limit'] = "You have reached the furniture limit!<br>Limit of %s is %s, you can't have more of them.",
        ['notify.property:no_electricity'] = "Você não pode ligar as luzes - não há eletricidade. Por favor, pague suas contas!",
        ['notify.property:no_power'] = "You cannot do that - the power box is turned off.",
        ['notify.property:purchased_upgrade'] = "Você comprou a melhoria: %s por $%s.",
        ['notify.property:purchased_upgrade_free'] = "Você recebeu a melhoria: %s de graça.",
        ['notify.property:marketplace_offer_added'] = "A propriedade foi listada no mercado.",
        ['notify.property:marketplace_offer_updated'] = "A oferta da propriedade foi atualizada.",
        ['notify.property:marketplace_offer_removed'] = "A propriedade foi removida do mercado.",
        ['notify.property:marketplace_photomode_on'] = "Modo de foto ativado.",
        ['notify.property:marketplace_photomode_off'] = "Modo de foto desativado.",
        ['notify.property:paid_services'] = "Você pagou $%s por contas de consumo do período %s.",
        ['notify.property:paid_rent'] = "Você pagou $%s pelo aluguel do período %s.",
        ['notify.property:rent_terminated_now'] = "O contrato de aluguel foi encerrado imediatamente.",
        ['notify.property:rent_termination_scheduled'] = "O contrato de aluguel terminará no final do mês atual.",
        ['notify.property:rent_termination_cancelled'] = "O término do aluguel foi cancelado.",
        ['notify.property:wardrobe_moved'] = "Você atualizou a localização do guarda-roupa.",
        ['notify.property:storage_moved'] = "Você atualizou a localização do armazenamento.",
        ['notify.property:already_have_keys'] = "Este jogador já possui as chaves desta propriedade.",
        ['notify.property:added_keys'] = "Você passou a chave para %s.",
        ['notify.property:player_dont_have_keys'] = "Este jogador não tem as chaves da propriedade.",
        ['notify.property:removed_keys'] = "Você pegou as chaves de %s.",
        ['notify.property:reached_keys_limit'] = "Você atingiu o limite de chaves!",
        ['notify.property:reached_permissions_limit'] = "Você atingiu o limite de jogadores com permissões!",
        ['notify.property:moved_out'] = "Você se mudou com sucesso. O aluguel foi encerrado.",
        ['notify.property:furniture_is_used'] = "Este móvel está em uso, você não pode fazer isso agora.",
        ['notify.property:put_the_mop_away'] = "Você precisa guardar o esfregão - não pode sair com ele.",

        -- Cameras:
        ['notify.cameras:no_cameras_installed'] = "Você não possui câmeras instaladas.",

        -- Alarm Alert:
        ['notify.alarm_alert:code_already_sent'] = "The verification code has already been sent. Please wait a moment before requesting a new code.",
        ['notify.alarm_alert:already_set'] = "Alarm is already set up.",
        ['notify.alarm_alert:invalid_phone_number'] = "The phone number you entered is invalid.",
        ['notify.alarm_alert:code_expired'] = "The authentication code has expired. Please request a new one.",
        ['notify.alarm_alert:invalid_code'] = "The authentication code you entered is invalid.",
        ['notify.alarm_alert:code_verified'] = "The authentication code has been verified. The alarm has been successfully activated for number %s.",
        ['notify.alarm_alert:removed'] = "The phone number has been removed, you will no longer receive alarm notifications.",

        ['sms.alarm:sender'] = "Alarm System",
        ['sms.alarm:authentication_code'] = "Your alarm authentication code is: %s. It will expire in %s seconds.",
        ['sms.alarm:authentication_success'] = "✅ The number %s has been successfully linked to the alarm system at %s %s. You will now receive notifications whenever the alarm is triggered.",
        ['sms.alarm:authentication_removed'] = "❌ The number %s has been unlinked from the alarm system at %s %s. You will no longer receive notifications from this property.",
        ['sms.alarm:lockpick_start'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_success'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_fail'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",

        -- Furniture:
        ['notify.furniture:removed'] = "Móvel #%s removido.",
        ['notify.furniture:sold'] = "Móvel #%s vendido por $%s",
        ['notify.furniture:cannot_sold'] = "Este móvel não pode ser vendido.",
        ['notify.furniture:you_are_in_furniture_mode'] = "Você não pode fazer isso porque está no modo de móveis.",
        ['notify.furniture:cannot_place_inside'] = "Você não pode colocar este móvel dentro da propriedade.",
        ['notify.furniture:inside_disabled'] = "Esta propriedade não permite móveis no interior.",
        ['notify.furniture:cannot_place_outside'] = "Você não pode colocar este móvel fora da propriedade.",
        ['notify.furniture:outside_disabled'] = "Esta propriedade não permite móveis externos.",
        ['notify.furniture:no_outdoor_area'] = "Esta propriedade não possui área externa.",
        ['notify.furniture:outside_zone'] = "Você não pode colocar móveis fora da zona da propriedade.",
        ['notify.furniture:mode_cooldown'] = "Você precisa esperar antes de mudar de modo novamente.",

        -- Doors:
        ['notify.doors:wait'] = "Você não pode abrir e fechar a porta tão rapidamente.",

        -- Mop:
        ['notify.mop:you_cannot_put_down'] = "Você não pode colocar o esfregão em outro balde - coloque de volta no seu balde.",

        -- Power Box:
        ['notify.powerbox:missing_item_turn_on'] = "Está faltando um item necessário para ligar a caixa de energia.",
        ['notify.powerbox:missing_item_repair'] = "Está faltando um item necessário para reparar a caixa de energia.",
        ['notify.powerbox:missing_item_turn_off'] = "Está faltando um item necessário para desligar a caixa de energia.",
        ['notify.powerbox:missing_item_destroy'] = "Está faltando um item necessário para destruir a caixa de energia.",

        -- Contract:
        ['notify.contract:player_too_far'] = "O jogador-alvo está muito longe para assinar o contrato.",
        ['notify.contract:sent'] = "Você enviou um contrato de propriedade para %s.",
        ['notify.contract:canceled'] = "O jogador não assinou o contrato.",
        ['notify.contract:seller_too_far'] = "O outro jogador está muito longe para finalizar o contrato.",
        ['notify.contract:purchased_from_player'] = "Você comprou a propriedade de %s.",
        ['notify.contract:sold_to_player'] = "Você vendeu com sucesso a propriedade para %s.",
        ['notify.contract:rented_to_player'] = "Você alugou com sucesso a propriedade para %s.",
        ['notify.contract:started_rent_from_player'] = "Você alugou a propriedade de %s.",
        ['notify.contract:already_rented'] = "Esta propriedade já está alugada por outro jogador.",

        -- Marketplace:
        ['notify.marketplace:started_rent'] = "Você começou a alugar a propriedade no mercado.",
        ['notify.marketplace:purchased'] = "Você comprou a propriedade no mercado.",
        ['notify.marketplace:rented'] = "Sua propriedade foi alugada através do mercado. Foi alugada por %s.",
        ['notify.marketplace:sold'] = "Sua propriedade foi vendida através do mercado. Foi comprada por %s.",
        ['notify.marketplace:marked_on_gps'] = "Propriedade marcada no GPS.",

        -- Raid:
        ['notify.raid:anti_burglary_doors'] = "Você não pode invadir esta propriedade. Ela é protegida por portas anti-intrusão.",
        ['notify.raid:missing_job'] = "Você não tem o trabalho necessário para invadir esta propriedade.",
        ['notify.raid:missing_item'] = "Você está sem um item necessário para realizar a invasão.",
        ['notify.raid:failed_due_to_anti_burglary'] = "Sua tentativa de invasão falhou. As portas anti-intrusão resistiram à intrusão.",

        -- Safe:
        ['notify.safe:cannot_set_same_pin'] = "Você não pode definir o mesmo PIN que o atual.",
        ['notify.safe:wrong_old_pin_was_entered'] = "O PIN antigo que você digitou está incorreto.",
        ['notify.safe:changed_pin'] = "PIN alterado de %s para %s.",

        -- Lockpick:
        ['notify.lockpick:alarm_start'] = "Alarme disparado! Tentativa de lockpicking detectada.",
        ['notify.lockpick:alarm_success'] = "Alarme disparado! A fechadura foi aberta.",
        ['notify.lockpick:alarm_failed'] = "Alarme disparado! A tentativa de lockpicking falhou.",
        ['notify.lockpick:missing_item'] = "Você não tem uma chave de gancho em seu inventário!",
        ['notify.lockpick:failed_not_enough_police'] = "Não há policiais suficientes online para tentar um lockpick.",
        ['notify.lockpick:failed_owner_not_online'] = "O proprietário não está online, você não pode lockpick sua propriedade.",

        -- Lockdown:
        ['notify.lockdown:missing_item'] = "Você não tem o item necessário em seu inventário!",

        -- Permissions:
        ['notify.permissions:cannot_remove_owner'] = "Você não pode remover as permissões do proprietário.",
        ['notify.permissions:cannot_remove_self'] = "Você não pode remover suas próprias permissões.",
        ['notify.permissions:error'] = "Ocorreu um erro.",

        -- Creator:
        ['notify.creator:copied_code'] = "Você copiou o código, cole no seu arquivo de configuração!",
        ['notify.creator:out_of_zone'] = "Você não pode colocá-lo fora da zona do quintal!",
        ['notify.creator:cannot_inside_property'] = "You need to get out of the property...",
    },
    ['PL'] = {
        ['control.gizmo:select'] = "Wybierz Gizmo",
        ['control.gizmo:translation'] = "Przesuń Gizmo",
        ['control.gizmo:rotation'] = "Obróć Gizmo",
        
        -- Blips:
        ['blip.motel'] = "Motel",
        ['blip.building'] = "Apartament",
        ['blip.house_agency'] = "Nieruchomość Agencji",
        ['blip.house_owner'] = "Twoja nieruchomość",
        ['blip.house_renter'] = "Wynajmowana nieruchomość",
        ['blip.house_key_holder'] = "Twoja nieruchomość",
        ['blip.house_for_sale'] = "Nieruchomość na sprzedaż",
        ['blip.marketplace'] = "Rynek Nieruchomości",
        ['blip.alarm'] = "Alarm w nieruchomości",
        
        -- Sale / Rent Sign
        ['dui.sale_sign:for_sale'] = "FOR SALE",
        ['dui.sale_sign:for_rent'] = "FOR RENT",
        ['dui.sale_sign:price'] = "${0}",
        ['dui.sale_sign:rent_weekly'] = "${0}<span>/week</span>",
        ['dui.sale_sign:rent_monthly'] = "${0}<span>/month</span>",

        -- 3D Text Main:
        ['3dtext.agency_showroom'] = "~p~[E]~s~ Showroom",
        ['3dtext.marketplace'] = "~p~[E]~s~ Rynek",
        ['3dtext.view_house'] = "~p~[E]~s~ Zobacz Ofertę",
        ['3dtext.building'] = "~p~[E]~s~ Building",
        ['3dtext.reception'] = "~p~[E]~s~ Reception",
        ['3dtext.show_house'] = "~p~[E]~s~ Pokaż",
        ['3dtext.exit_house'] = "~p~[E]~s~ Wyjdź",
        ['3dtext.parking'] = "~p~[E]~s~ Parking",
        ['3dtext.garage'] = "~p~[E]~s~ Garaż",
        ['3dtext.wardrobe'] = "~p~[E]~s~ Szafa",
        ['3dtext.storage'] = "~p~[E]~s~ Magazyn",
        ['3dtext.emergency_exit'] = "~p~[E]~s~ Wyjście awaryjne",
        ['3dtext.power_box'] = '~p~[E]~s~ Rozdzielnica elektryczna',

        -- Text UI Main:
        ['textui.agency_showroom'] = "Showroom",
        ['textui.marketplace'] = "Rynek",
        ['textui.view_house'] = "Zobacz Ofertę",
        ['textui.building'] = "Building",
        ['textui.reception'] = "Reception",
        ['textui.show_house'] = "Pokaż",
        ['textui.exit_house'] = "Wyjdź",
        ['textui.parking'] = "Parking",
        ['textui.garage'] = "Garaż",
        ['textui.wardrobe'] = "Szafa",
        ['textui.storage'] = "Magazyn",
        ['textui.emergency_exit'] = "Wyjście awaryjne",
        ['textui.power_box'] = 'Rozdzielnica elektryczna',
        ['textui.door'] = 'Door',

        ['menu:header'] = "Nieruchomość #%s",
        ['menu.enter'] = "Wejdź",
        ['menu.exit'] = "Wyjdź",
        ['menu.manage'] = "Zarządzaj",
        ['menu.furniture'] = "Meble",
        ['menu.toggle_light'] = "Światło",
        ['menu.toggle_lock'] = "Zamek",
        ['menu.lockpick'] = "Włam się",
        ['menu.lockdown'] = "Lockdown",
        ['menu.removeseal'] = "Usuń zabezpieczenie policji",
        ['menu.raid'] = "Wyważ drzwi",
        ['menu.complete_raid'] = "Zamknij drzwi",
        ['menu.doorbell'] = "Zadzwoń do drzwi",
        ['menu.door_peephole'] = "Wizjer",
        ['menu.enter_underground_parking'] = "Wejdź do parkingu (Piętro -%s)",

        ['menu.power_box_open'] = "Otwórz rozdzielnicę",
        ['menu.power_box_close'] = "Zamknij rozdzielnicę",
        ['menu.power_box_destroy'] = "Zniszcz",
        ['menu.power_box_turn_off'] = "Wyłącz prąd",
        ['menu.power_box_turn_on'] = "Uruchom prąd",
        ['menu.power_box_repair'] = "Napraw",

        -- Target Main:
        ['target.agency_showroom'] = "Showroom",
        ['target.marketplace'] = "Rynek",
        ['target.view_house'] = "Zobacz Ofertę",
        ['target.building'] = "Building",
        ['target.reception'] = "Reception",
        ['target.enter'] = "Wejdź",
        ['target.exit'] = "Wyjdź",
        ['target.garage'] = "Garaż",
        ['target.wardrobe'] = "Szafa",
        ['target.storage'] = "Magazyn",
        ['target.manage'] = "Zarządzaj",
        ['target.furniture'] = "Meble",
        ['target.toggle_light'] = "Światło",
        ['target.toggle_lock'] = "Zamek",
        ['target.toggle_lock_door'] = "Zamek",
        ['target.doorbell'] = "Zadzwoń do Drzwi",
        ['target.door_peephole'] = "Wizjer",
        ['target.lockpick'] = "Włam się",
        ['target.lockdown'] = "Lockdown",
        ['target.removeseal'] = "Usuń zabezpieczenie policji",
        ['target.raid'] = "Wyważ drzwi",
        ['target.complete_raid'] = "Zamknij Drzwi",
        ['target.enter_underground_parking'] = "Wejdź do parkingu (Piętro -%s)",
        ['target.emergency_exit'] = "Wyjście awaryjne",

        -- Furniture Interactable:
        ['target.interactable:delivery'] = 'Rozpakuj przesyłkę',
        ['target.interactable:wardrobe'] = 'Szafa',
        ['target.interactable:storage'] = 'Magazyn',
        ['target.interactable:safe'] = 'Sejf',
        ['target.interactable:device'] = 'Laptop',
        ['target.interactable:mop'] = 'Mop',
        ['target.interactable:mower'] = 'Mower',
        ['target.interactable:power_box_open'] = 'Otwórz rozdzielnicę',
        ['target.interactable:power_box_close'] = 'Zamknij rozdzielnicę',
        ['target.interactable:power_box_destroy'] = 'Zniszcz',
        ['target.interactable:power_box_turn_off'] = 'Wyłącz prąd',
        ['target.interactable:power_box_turn_on'] = 'Uruchom prąd',
        ['target.interactable:power_box_repair'] = 'Napraw',

        ['3dtext.interactable:delivery'] = '~p~[E]~s~ Rozpakuj przesyłkę',
        ['3dtext.interactable:wardrobe'] = '~p~[E]~s~ Szafa',
        ['3dtext.interactable:storage'] = '~p~[E]~s~ Magazyn',
        ['3dtext.interactable:safe'] = '~p~[E]~s~ Sejf',
        ['3dtext.interactable:device'] = '~p~[E]~s~ Laptop',
        ['3dtext.interactable:mop'] = '~p~[E]~s~ Mop',
        ['3dtext.interactable:mower'] = '~p~[E]~s~ Mower',

        ['textui.interactable:delivery'] = 'Rozpakuj przesyłkę',
        ['textui.interactable:wardrobe'] = 'Szafa',
        ['textui.interactable:storage'] = 'Magazyn',
        ['textui.interactable:safe'] = 'Sejf',
        ['textui.interactable:device'] = 'Laptop',
        ['textui.interactable:mop'] = 'Mop',
        ['textui.interactable:mower'] = 'Mower',

        -- Static Interactable:
        ['target.interactable:sink'] = 'Umyj Ręce',
        ['target.interactable:sink_drink'] = 'Napij się',
        ['target.interactable:shower'] = 'Weź Prysznic',

        ['3dtext.interactable'] = '~p~[E]~s~',

        ['textui.interactable'] = '',

        ['menu.interactable:sink'] = 'Umyj Ręce',
        ['menu.interactable:sink_drink'] = 'Napij się',
        ['menu.interactable:shower'] = 'Weź Prysznic',
        
        -- General:
        ['notify.wait'] = "Spróbuj ponownie za chwilę...",
        ['notify.not_allowed'] = "Nie masz do tego uprawnień!",
        ['notify.not_enough_money'] = "Nie masz wystarczająco pieniędzy!",
        ['notify.reached_properties_limit'] = "Osiągnąłeś limit nieruchomości!",

        -- Commands:
        ['notify.command_giveproperty:success'] = "You have given property %s to player %s.",
        ['notify.command_giveproperty:player_offline'] = "Player is offline.",
        ['notify.command_giveproperty:property_doesnt_exist'] = "Property %s doesn't exist.",
        ['notify.command_giveproperty:invalid_property_type'] = "You can't give a property of this type.",
        ['notify.command_giveproperty:property_has_owner'] = "Property %s already have an owner.",
        
        -- Property:
        ['notify.property:purchased'] = "Kupiłeś tę nieruchomość za $%s.",
        ['notify.property:rented_monthly'] = "Od teraz wynajmujesz tę nieruchomość za $%s miesięcznie.",
        ['notify.property:rented_weekly'] = "Od teraz wynajmujesz tę nieruchomość za $%s tygodniowo.",
        ['notify.property:already_owned'] = "Posiadasz już tę nieruchomość.",
        ['notify.property:marketplace_blocked_by_renter'] = "Nie możesz mieć dostępu do rynku, gdy nieruchomość jest wynajęta.",
        ['notify.property:cannot_sell_with_renter'] = "Nie możesz sprzedać nieruchomości, gdy jest wynajęta.",
        ['notify.property:sold_property'] = "Pomyślnie sprzedałeś nieruchomość za $%s.",
        ['notify.property:purchased_theme'] = "Zakupiłeś motyw %s za $%s.",
        ['notify.property:purchased_furniture'] = "Zakupiłeś meble %s za $%s.",
        ['notify.property:ordered_furniture'] = "Zamówiłeś meble %s za $%s.",
        ['notify.property:reached_furniture_limit'] = "Osiągnąłeś limit mebli!<br>Sprzedaj swoje obecne meble lub zaktualizuj Limit Mebli.",
        ['notify.property:reached_furniture_model_limit'] = "You have reached the furniture limit!<br>Limit of %s is %s, you can't have more of them.",
        ['notify.property:no_electricity'] = "Nie możesz włączyć świateł - nie ma prądu. Proszę opłać rachunki!",
        ['notify.property:no_power'] = "You cannot do that - the power box is turned off.",
        ['notify.property:purchased_upgrade'] = "Zakupiłeś ulepszenie: %s za $%s.",
        ['notify.property:purchased_upgrade_free'] = "Otrzymałeś ulepszenie: %s za darmo.",
        ['notify.property:marketplace_offer_added'] = "Nieruchomość została dodana do oferty na rynku.",
        ['notify.property:marketplace_offer_updated'] = "Oferta nieruchomości została zaktualizowana.",
        ['notify.property:marketplace_offer_removed'] = "Nieruchomość została usunięta z rynku.",
        ['notify.property:marketplace_photomode_on'] = "Włączony tryb zdjęć.",
        ['notify.property:marketplace_photomode_off'] = "Wyłączony tryb zdjęć.",
        ['notify.property:paid_services'] = "Zapłaciłeś $%s za rachunki za media za okres %s.",
        ['notify.property:paid_rent'] = "Zapłaciłeś $%s za wynajem za okres %s.",
        ['notify.property:rent_terminated_now'] = "Umowa wynajmu została natychmiast zakończona.",
        ['notify.property:rent_termination_scheduled'] = "Umowa wynajmu zakończy się pod koniec bieżącego miesiąca.",
        ['notify.property:rent_termination_cancelled'] = "Anulowano zakończenie wynajmu.",
        ['notify.property:wardrobe_moved'] = "Zaktualizowałeś lokalizację szafy.",
        ['notify.property:storage_moved'] = "Zaktualizowałeś lokalizację magazynu.",
        ['notify.property:already_have_keys'] = "Ten gracz już posiada klucze do tej nieruchomości.",
        ['notify.property:added_keys'] = "Przekazałeś klucz dla %s.",
        ['notify.property:player_dont_have_keys'] = "Ten gracz nie ma kluczy do nieruchomości.",
        ['notify.property:removed_keys'] = "Odebrałeś klucze od %s.",
        ['notify.property:reached_keys_limit'] = "Osiągnąłeś limit kluczy!",
        ['notify.property:reached_permissions_limit'] = "Osiągnięto limit graczy z uprawnieniami!",
        ['notify.property:moved_out'] = "Wyprowadziłeś się - wynajem został zakończony.",
        ['notify.property:furniture_is_used'] = "Te meble są w użyciu, nie możesz tego teraz zrobić..",
        ['notify.property:put_the_mop_away'] = "Musisz odłożyć mopa, nie możesz z nim wyjść.",

        -- Cameras:
        ['notify.cameras:no_cameras_installed'] = "Nie masz zainstalowanych żadnych kamer.",

        -- Alarm Alert:
        ['notify.alarm_alert:code_already_sent'] = "The verification code has already been sent. Please wait a moment before requesting a new code.",
        ['notify.alarm_alert:already_set'] = "Alarm is already set up.",
        ['notify.alarm_alert:invalid_phone_number'] = "The phone number you entered is invalid.",
        ['notify.alarm_alert:code_expired'] = "The authentication code has expired. Please request a new one.",
        ['notify.alarm_alert:invalid_code'] = "The authentication code you entered is invalid.",
        ['notify.alarm_alert:code_verified'] = "The authentication code has been verified. The alarm has been successfully activated for number %s.",
        ['notify.alarm_alert:removed'] = "The phone number has been removed, you will no longer receive alarm notifications.",

        ['sms.alarm:sender'] = "Alarm System",
        ['sms.alarm:authentication_code'] = "Your alarm authentication code is: %s. It will expire in %s seconds.",
        ['sms.alarm:authentication_success'] = "✅ The number %s has been successfully linked to the alarm system at %s %s. You will now receive notifications whenever the alarm is triggered.",
        ['sms.alarm:authentication_removed'] = "❌ The number %s has been unlinked from the alarm system at %s %s. You will no longer receive notifications from this property.",
        ['sms.alarm:lockpick_start'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_success'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_fail'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",

        -- Furniture:
        ['notify.furniture:removed'] = "Usunięto mebel #%s.",
        ['notify.furniture:sold'] = "Sprzedano mebel #%s za $%s",
        ['notify.furniture:cannot_sold'] = "Tego mebla nie można sprzedać.",
        ['notify.furniture:you_are_in_furniture_mode'] = "Nie możesz tego zrobić, ponieważ jesteś w trybie mebli.",
        ['notify.furniture:cannot_place_inside'] = "Nie możesz umieścić tego mebla wewnątrz nieruchomości.",
        ['notify.furniture:inside_disabled'] = "Ta nieruchomość nie zezwala na meble wewnątrz.",
        ['notify.furniture:cannot_place_outside'] = "Nie możesz umieścić tego mebla na zewnątrz nieruchomości.",
        ['notify.furniture:outside_disabled'] = "Ta nieruchomość nie zezwala na meble na zewnątrz.",
        ['notify.furniture:no_outdoor_area'] = "Ta nieruchomość nie ma obszaru na zewnątrz.",
        ['notify.furniture:outside_zone'] = "Nie możesz umieszczać mebli poza strefą nieruchomości.",
        ['notify.furniture:mode_cooldown'] = "Musisz poczekać przed ponownym zmienieniem trybu.",

        -- Doors:
        ['notify.doors:wait'] = "Nie możesz otwierać i zamykać drzwi tak często.",

        -- Mop:
        ['notify.mop:you_cannot_put_down'] = "Nie możesz włożyć mopa do innego wiadra, włóż go z powrotem do swojego wiadra.",

        -- Power Box:
        ['notify.powerbox:missing_item_turn_on'] = "Brakuje Ci przedmiotu niezbędnego do włączenia zasilania.",
        ['notify.powerbox:missing_item_repair'] = "Brakuje Ci przedmiotu niezbędnego do naprawy skrzynki zasilającej.",
        ['notify.powerbox:missing_item_turn_off'] = "Brakuje Ci przedmiotu niezbędnego do wyłączenia zasilania.",
        ['notify.powerbox:missing_item_destroy'] = "Brakuje Ci przedmiotu niezbędnego do zniszczenia skrzynki zasilającej.",

        -- Contract:
        ['notify.contract:player_too_far'] = "Docelowy gracz jest zbyt daleko, aby podpisać kontrakt.",
        ['notify.contract:sent'] = "Wysłałeś kontrakt nieruchomości do %s.",
        ['notify.contract:canceled'] = "Gracz nie podpisał umowy.",
        ['notify.contract:seller_too_far'] = "Inny gracz jest zbyt daleko, aby finalizować umowę.",
        ['notify.contract:purchased_from_player'] = "Zakupiłeś nieruchomość od %s.",
        ['notify.contract:sold_to_player'] = "Pomyślnie sprzedałeś nieruchomość do %s.",
        ['notify.contract:rented_to_player'] = "Pomyślnie wynająłeś nieruchomość do %s.",
        ['notify.contract:started_rent_from_player'] = "Wynająłeś nieruchomość od %s.",
        ['notify.contract:already_rented'] = "Ta nieruchomość jest już wynajęta przez innego gracza.",

        -- Marketplace:
        ['notify.marketplace:started_rent'] = "Rozpocząłeś wynajem nieruchomości z rynku.",
        ['notify.marketplace:purchased'] = "Zakupiłeś nieruchomość z rynku.",
        ['notify.marketplace:rented'] = "Twoja nieruchomość została wynajęta za pośrednictwem rynku. wynajął ją %s.",
        ['notify.marketplace:sold'] = "Twoja nieruchomość została sprzedana za pośrednictwem rynku. Zakupił ją %s.",
        ['notify.marketplace:marked_on_gps'] = "Nieruchomość zaznaczona na GPS.",

        -- Raid:
        ['notify.raid:anti_burglary_doors'] = "Nie możesz napadać na tę nieruchomość. Jest chroniona przez drzwi antywłamaniowe.",
        ['notify.raid:missing_job'] = "Nie masz wymaganego stanowiska, aby zaatakować tę nieruchomość.",
        ['notify.raid:missing_item'] = "Brakuje Ci wymaganego przedmiotu do przeprowadzenia napadu.",
        ['notify.raid:failed_due_to_anti_burglary'] = "Twoja próba włamania zakończyła się niepowodzeniem. Drzwi antywłamaniowe zapobiegły wtargnięciu.",

        -- Safe:
        ['notify.safe:cannot_set_same_pin'] = "Nie możesz ustawić tego samego PINu co obecny.",
        ['notify.safe:wrong_old_pin_was_entered'] = "Wprowadzony stary PIN jest niepoprawny.",
        ['notify.safe:changed_pin'] = "PIN zmieniony z %s na %s.",

        -- Lockpick:
        ['notify.lockpick:alarm_start'] = "Włączył się alarm! Wykryto próbę otwarcia zamka.",
        ['notify.lockpick:alarm_success'] = "Włączył się alarm! Zamek został otwarty.",
        ['notify.lockpick:alarm_failed'] = "Włączył się alarm! Próba otwarcia zamka nie powiodła się.",
        ['notify.lockpick:missing_item'] = "Nie masz wytrytu w swoim inwentarzu!",
        ['notify.lockpick:failed_not_enough_police'] = "Nie ma wystarczającej liczby policjantów online, aby spróbować otworzyć zamek.",
        ['notify.lockpick:failed_owner_not_online'] = "Właściciel nie jest online, nie możesz otworzyć jego nieruchomości.",

        -- Lockdown:
        ['notify.lockdown:missing_item'] = "Nie masz wymaganego przedmiotu w swoim inwentarzu!",

        -- Permissions:
        ['notify.permissions:cannot_remove_owner'] = "Nie możesz usunąć uprawnień właściciela.",
        ['notify.permissions:cannot_remove_self'] = "Nie możesz usunąć własnych uprawnień.",
        ['notify.permissions:error'] = "Wystąpił błąd.",

        -- Creator:
        ['notify.creator:copied_code'] = "Skopiowano kod, wklej go do pliku konfiguracyjnego!",
        ['notify.creator:out_of_zone'] = "Nie możesz ustawić tego poza strefą ogrodu!",
        ['notify.creator:cannot_inside_property'] = "You need to get out of the property...",
    },
    ['IT'] = {
        ['control.gizmo:select'] = "Seleziona Gizmo",
        ['control.gizmo:translation'] = "Traslazione Gizmo",
        ['control.gizmo:rotation'] = "Rotazione Gizmo",
        
        -- Blips:
        ['blip.motel'] = "Motel",
        ['blip.building'] = "Appartamento",
        ['blip.house_agency'] = "Proprietà Agenzia",
        ['blip.house_owner'] = "Proprietà Posseduta",
        ['blip.house_renter'] = "Proprietà Affittata",
        ['blip.house_key_holder'] = "Proprietà Posseduta",
        ['blip.house_for_sale'] = "Proprietà in Vendita",
        ['blip.marketplace'] = "Mercato Immobiliare",
        ['blip.alarm'] = "Allarme Casa",
        
        -- Sale / Rent Sign
        ['dui.sale_sign:for_sale'] = "FOR SALE",
        ['dui.sale_sign:for_rent'] = "FOR RENT",
        ['dui.sale_sign:price'] = "${0}",
        ['dui.sale_sign:rent_weekly'] = "${0}<span>/week</span>",
        ['dui.sale_sign:rent_monthly'] = "${0}<span>/month</span>",

        -- 3D Text Main:
        ['3dtext.agency_showroom'] = "~p~[E]~s~ Sala esposizione",
        ['3dtext.marketplace'] = "~p~[E]~s~ Mercato Immobiliare",
        ['3dtext.view_house'] = "~p~[E]~s~ Visualizza Offerta",
        ['3dtext.building'] = "~p~[E]~s~ Building",
        ['3dtext.reception'] = "~p~[E]~s~ Reception",
        ['3dtext.show_house'] = "~p~[E]~s~ Mostra",
        ['3dtext.exit_house'] = "~p~[E]~s~ Esci",
        ['3dtext.parking'] = "~p~[E]~s~ Parking",
        ['3dtext.garage'] = "~p~[E]~s~ Garage",
        ['3dtext.wardrobe'] = "~p~[E]~s~ Guardaroba",
        ['3dtext.storage'] = "~p~[E]~s~ Magazzino",
        ['3dtext.emergency_exit'] = "~p~[E]~s~ Uscita di emergenza",
        ['3dtext.power_box'] = '~p~[E]~s~ Scatola di alimentazione',

        -- Text UI Main:
        ['textui.agency_showroom'] = "Sala esposizione",
        ['textui.marketplace'] = "Mercato Immobiliare",
        ['textui.view_house'] = "Visualizza Offerta",
        ['textui.building'] = "Building",
        ['textui.reception'] = "Reception",
        ['textui.show_house'] = "Mostra",
        ['textui.exit_house'] = "Esci",
        ['textui.parking'] = "Parking",
        ['textui.garage'] = "Garage",
        ['textui.wardrobe'] = "Guardaroba",
        ['textui.storage'] = "Magazzino",
        ['textui.emergency_exit'] = "Uscita di emergenza",
        ['textui.power_box'] = 'Scatola di alimentazione',
        ['textui.door'] = 'Door',

        ['menu:header'] = "Proprietà #%s",
        ['menu.enter'] = "Entra",
        ['menu.exit'] = "Esci",
        ['menu.manage'] = "Gestisci",
        ['menu.furniture'] = "Mobili",
        ['menu.toggle_light'] = "Attiva/Disattiva Luci",
        ['menu.toggle_lock'] = "Attiva/Disattiva Serratura",
        ['menu.lockpick'] = "Scassina Serratura",
        ['menu.lockdown'] = "Lockdown",
        ['menu.removeseal'] = "Rimuovi Sigillo Polizia",
        ['menu.raid'] = "Raid",
        ['menu.complete_raid'] = "Chiudi Porte",
        ['menu.doorbell'] = "Ring the Doorbell",
        ['menu.door_peephole'] = "Peephole",
        ['menu.enter_underground_parking'] = "Entra nel Parcheggio (Piano -%s)",

        ['menu.power_box_open'] = "Apri scatola di alimentazione",
        ['menu.power_box_close'] = "Chiudi scatola di alimentazione",
        ['menu.power_box_destroy'] = "Distruggi",
        ['menu.power_box_turn_off'] = "Spegni",
        ['menu.power_box_turn_on'] = "Accendi",
        ['menu.power_box_repair'] = "Ripara",

        -- Target Main:
        ['target.agency_showroom'] = "Sala esposizione",
        ['target.marketplace'] = "Mercato Immobiliare",
        ['target.view_house'] = "Visualizza Offerta",
        ['target.building'] = "Building",
        ['target.reception'] = "Reception",
        ['target.enter'] = "Entra",
        ['target.exit'] = "Esci",
        ['target.garage'] = "Garage",
        ['target.wardrobe'] = "Guardaroba",
        ['target.storage'] = "Magazzino",
        ['target.manage'] = "Gestisci",
        ['target.furniture'] = "Mobili",
        ['target.toggle_light'] = "Attiva/Disattiva Luci",
        ['target.toggle_lock'] = "Attiva/Disattiva Serratura",
        ['target.toggle_lock_door'] = "Attiva/Disattiva Serratura",
        ['target.doorbell'] = "Suona il Campanello",
        ['target.door_peephole'] = "Sbircia dal Traditore",
        ['target.lockpick'] = "Scassina Serratura",
        ['target.lockdown'] = "Lockdown",
        ['target.removeseal'] = "Rimuovi Sigillo Polizia",
        ['target.raid'] = "Raid",
        ['target.complete_raid'] = "Chiudi Porte",
        ['target.enter_underground_parking'] = "Entra nel Parcheggio (Piano -%s)",
        ['target.emergency_exit'] = "Uscita di emergenza",

        -- Furniture Interactable:
        ['target.interactable:delivery'] = 'Spacchetta Spedizione',
        ['target.interactable:wardrobe'] = 'Guardaroba',
        ['target.interactable:storage'] = 'Magazzino',
        ['target.interactable:safe'] = 'Cassaforte',
        ['target.interactable:device'] = 'Laptop',
        ['target.interactable:mop'] = 'Mocio',
        ['target.interactable:mower'] = 'Mower',
        ['target.interactable:power_box_open'] = 'Apri scatola di alimentazione',
        ['target.interactable:power_box_close'] = 'Chiudi scatola di alimentazione',
        ['target.interactable:power_box_destroy'] = 'Distruggi',
        ['target.interactable:power_box_turn_off'] = 'Spegni',
        ['target.interactable:power_box_turn_on'] = 'Accendi',
        ['target.interactable:power_box_repair'] = 'Ripara',

        ['3dtext.interactable:delivery'] = '~p~[E]~s~ Spacchetta Spedizione',
        ['3dtext.interactable:wardrobe'] = '~p~[E]~s~ Guardaroba',
        ['3dtext.interactable:storage'] = '~p~[E]~s~ Magazzino',
        ['3dtext.interactable:safe'] = '~p~[E]~s~ Cassaforte',
        ['3dtext.interactable:device'] = '~p~[E]~s~ Laptop',
        ['3dtext.interactable:mop'] = '~p~[E]~s~ Mocio',
        ['3dtext.interactable:mower'] = '~p~[E]~s~ Mower',

        ['textui.interactable:delivery'] = 'Spacchetta Spedizione',
        ['textui.interactable:wardrobe'] = 'Guardaroba',
        ['textui.interactable:storage'] = 'Magazzino',
        ['textui.interactable:safe'] = 'Cassaforte',
        ['textui.interactable:device'] = 'Laptop',
        ['textui.interactable:mop'] = 'Mocio',
        ['textui.interactable:mower'] = 'Mower',

        -- Static Interactable:
        ['target.interactable:sink'] = 'Lavati le Mani',
        ['target.interactable:sink_drink'] = 'Bevi',
        ['target.interactable:shower'] = 'Fatti una Doccia',

        ['3dtext.interactable'] = '~p~[E]~s~',

        ['textui.interactable'] = '',

        ['menu.interactable:sink'] = 'Lavati le Mani',
        ['menu.interactable:sink_drink'] = 'Bevi',
        ['menu.interactable:shower'] = 'Fatti una Doccia',

        -- General:
        ['notify.wait'] = "Riprova tra un po'...",
        ['notify.not_allowed'] = "Non hai il permesso per fare ciò!",
        ['notify.not_enough_money'] = "Non hai abbastanza soldi!",
        ['notify.reached_properties_limit'] = "Hai raggiunto il limite delle proprietà!",

        -- Commands:
        ['notify.command_giveproperty:success'] = "You have given property %s to player %s.",
        ['notify.command_giveproperty:player_offline'] = "Player is offline.",
        ['notify.command_giveproperty:property_doesnt_exist'] = "Property %s doesn't exist.",
        ['notify.command_giveproperty:invalid_property_type'] = "You can't give a property of this type.",
        ['notify.command_giveproperty:property_has_owner'] = "Property %s already have an owner.",
        
        -- Property:
        ['notify.property:purchased'] = "Hai comprato questa proprietà per $%s.",
        ['notify.property:rented_monthly'] = "Ora stai affittando questa proprietà per $%s al mese.",
        ['notify.property:rented_weekly'] = "Ora stai affittando questa proprietà per $%s a settimana.",
        ['notify.property:already_owned'] = "Possiedi già questa proprietà.",
        ['notify.property:marketplace_blocked_by_renter'] = "Non puoi accedere al mercato mentre questa proprietà è affittata.",
        ['notify.property:cannot_sell_with_renter'] = "Non puoi vendere la proprietà mentre è affittata.",
        ['notify.property:sold_property'] = "Hai venduto con successo la proprietà per $%s.",
        ['notify.property:purchased_theme'] = "Hai acquistato il tema %s per $%s.",
        ['notify.property:purchased_furniture'] = "Hai acquistato il mobile %s per $%s.",
        ['notify.property:ordered_furniture'] = "Hai ordinato il mobile %s per $%s.",
        ['notify.property:reached_furniture_limit'] = "Hai raggiunto il limite di mobili!<br>Vendi i mobili attuali o aggiorna il Limite di Mobili.",
        ['notify.property:reached_furniture_model_limit'] = "You have reached the furniture limit!<br>Limit of %s is %s, you can't have more of them.",
        ['notify.property:no_electricity'] = "Non puoi accendere le luci - non c'è elettricità. Per favore paga le bollette!",
        ['notify.property:no_power'] = "You cannot do that - the power box is turned off.",
        ['notify.property:purchased_upgrade'] = "Hai acquistato l'aggiornamento: %s per $%s.",
        ['notify.property:purchased_upgrade_free'] = "Hai ricevuto l'aggiornamento: %s gratuitamente.",
        ['notify.property:marketplace_offer_added'] = "La proprietà è stata inserita nel mercato.",
        ['notify.property:marketplace_offer_updated'] = "L'offerta della proprietà è stata aggiornata.",
        ['notify.property:marketplace_offer_removed'] = "La proprietà è stata rimossa dal mercato.",
        ['notify.property:marketplace_photomode_on'] = "Modalità Foto attivata.",
        ['notify.property:marketplace_photomode_off'] = "Modalità Foto disattivata.",
        ['notify.property:paid_services'] = "Hai pagato $%s per le bollette di utilità dal periodo %s.",
        ['notify.property:paid_rent'] = "Hai pagato $%s per l'affitto del periodo %s.",
        ['notify.property:rent_terminated_now'] = "Il contratto di affitto è stato terminato immediatamente.",
        ['notify.property:rent_termination_scheduled'] = "Il contratto di affitto terminerà alla fine del mese corrente.",
        ['notify.property:rent_termination_cancelled'] = "La terminazione dell'affitto è stata annullata.",
        ['notify.property:wardrobe_moved'] = "Hai aggiornato la posizione del guardaroba.",
        ['notify.property:storage_moved'] = "Hai aggiornato la posizione del magazzino.",
        ['notify.property:already_have_keys'] = "Questo giocatore ha già le chiavi di questa proprietà.",
        ['notify.property:added_keys'] = "Hai passato la chiave a %s.",
        ['notify.property:player_dont_have_keys'] = "Questo giocatore non ha le chiavi della proprietà.",
        ['notify.property:removed_keys'] = "Hai preso le chiavi dal %s.",
        ['notify.property:reached_keys_limit'] = "Hai raggiunto il limite di chiavi!",
        ['notify.property:reached_permissions_limit'] = "Hai raggiunto il limite di giocatori con permessi!",
        ['notify.property:moved_out'] = "Hai effettuato il trasloco con successo. Il contratto di locazione è stato terminato.",
        ['notify.property:furniture_is_used'] = "Questo mobile è in uso, non puoi farlo adesso.",
        ['notify.property:put_the_mop_away'] = "Devi riporre il secchio e lo straccio - non puoi uscire con loro.",

        -- Cameras:
        ['notify.cameras:no_cameras_installed'] = "Non hai installato alcuna telecamera.",

        -- Alarm Alert:
        ['notify.alarm_alert:code_already_sent'] = "The verification code has already been sent. Please wait a moment before requesting a new code.",
        ['notify.alarm_alert:already_set'] = "Alarm is already set up.",
        ['notify.alarm_alert:invalid_phone_number'] = "The phone number you entered is invalid.",
        ['notify.alarm_alert:code_expired'] = "The authentication code has expired. Please request a new one.",
        ['notify.alarm_alert:invalid_code'] = "The authentication code you entered is invalid.",
        ['notify.alarm_alert:code_verified'] = "The authentication code has been verified. The alarm has been successfully activated for number %s.",
        ['notify.alarm_alert:removed'] = "The phone number has been removed, you will no longer receive alarm notifications.",

        ['sms.alarm:sender'] = "Alarm System",
        ['sms.alarm:authentication_code'] = "Your alarm authentication code is: %s. It will expire in %s seconds.",
        ['sms.alarm:authentication_success'] = "✅ The number %s has been successfully linked to the alarm system at %s %s. You will now receive notifications whenever the alarm is triggered.",
        ['sms.alarm:authentication_removed'] = "❌ The number %s has been unlinked from the alarm system at %s %s. You will no longer receive notifications from this property.",
        ['sms.alarm:lockpick_start'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_success'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_fail'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",

        -- Furniture:
        ['notify.furniture:removed'] = "Mobile #%s rimosso.",
        ['notify.furniture:sold'] = "Mobile #%s venduto per $%s",
        ['notify.furniture:cannot_sold'] = "Questo mobile non può essere venduto.",
        ['notify.furniture:you_are_in_furniture_mode'] = "Non puoi farlo perché sei in modalità arredamento.",
        ['notify.furniture:cannot_place_inside'] = "Non puoi mettere questo mobile all'interno della proprietà.",
        ['notify.furniture:inside_disabled'] = "Questa proprietà non consente mobili interni.",
        ['notify.furniture:cannot_place_outside'] = "Non puoi mettere questo mobile all'esterno della proprietà.",
        ['notify.furniture:outside_disabled'] = "Questa proprietà non consente mobili esterni.",
        ['notify.furniture:no_outdoor_area'] = "Questa proprietà non ha un'area esterna.",
        ['notify.furniture:outside_zone'] = "Non puoi mettere mobili al di fuori della zona di proprietà.",
        ['notify.furniture:mode_cooldown'] = "Devi aspettare prima di cambiare nuovamente modalità.",

        -- Doors:
        ['notify.doors:wait'] = "Non puoi aprire e chiudere la porta così spesso.",

        -- Mop:
        ['notify.mop:you_cannot_put_down'] = "Non puoi mettere il secchio in un altro secchio - rimettilo nel tuo secchio.",

        -- Power Box:
        ['notify.powerbox:missing_item_turn_on'] = "Ti manca un oggetto necessario per accendere l'alimentazione.",
        ['notify.powerbox:missing_item_repair'] = "Ti manca un oggetto necessario per riparare la scatola di alimentazione.",
        ['notify.powerbox:missing_item_turn_off'] = "Ti manca un oggetto necessario per spegnere l'alimentazione.",
        ['notify.powerbox:missing_item_destroy'] = "Ti manca un oggetto necessario per distruggere la scatola di alimentazione.",

        -- Contract:
        ['notify.contract:player_too_far'] = "Il giocatore target è troppo lontano per firmare il contratto.",
        ['notify.contract:sent'] = "Hai inviato un contratto di proprietà a %s.",
        ['notify.contract:canceled'] = "Il giocatore non ha firmato il contratto.",
        ['notify.contract:seller_too_far'] = "L'altro giocatore è troppo lontano per finalizzare il contratto.",
        ['notify.contract:purchased_from_player'] = "Hai acquistato la proprietà da %s.",
        ['notify.contract:sold_to_player'] = "Hai venduto con successo la proprietà a %s.",
        ['notify.contract:rented_to_player'] = "Hai affittato con successo la proprietà a %s.",
        ['notify.contract:started_rent_from_player'] = "Hai affittato la proprietà da %s.",
        ['notify.contract:already_rented'] = "Questa proprietà è già affittata da un altro giocatore.",

        -- Marketplace:
        ['notify.marketplace:started_rent'] = "Hai iniziato a affittare la proprietà dal mercato.",
        ['notify.marketplace:purchased'] = "Hai acquistato la proprietà dal mercato.",
        ['notify.marketplace:rented'] = "La tua proprietà è stata affittata attraverso il mercato. È stata affittata da %s.",
        ['notify.marketplace:sold'] = "La tua proprietà è stata venduta attraverso il mercato. È stata acquistata da %s.",
        ['notify.marketplace:marked_on_gps'] = "Proprietà contrassegnata sul GPS.",

        -- Raid:
        ['notify.raid:anti_burglary_doors'] = "Non puoi fare raids su questa proprietà. È protetta da porte anti-scasso.",
        ['notify.raid:missing_job'] = "Non hai il lavoro richiesto per raidare questa proprietà.",
        ['notify.raid:missing_item'] = "Ti manca un oggetto richiesto per eseguire il raid.",
        ['notify.raid:failed_due_to_anti_burglary'] = "Il tuo tentativo di intrusione è fallito. Le porte anti-scasso hanno resistito all'intrusione.",

        -- Safe:
        ['notify.safe:cannot_set_same_pin'] = "Non puoi impostare lo stesso PIN di quello attuale.",
        ['notify.safe:wrong_old_pin_was_entered'] = "Il vecchio PIN che hai inserito è sbagliato.",
        ['notify.safe:changed_pin'] = "PIN cambiato da %s a %s.",

        -- Lockpick:
        ['notify.lockpick:alarm_start'] = "Allarme attivato! Tentativo di scasso rilevato.",
        ['notify.lockpick:alarm_success'] = "Allarme attivato! La serratura è stata scassinata.",
        ['notify.lockpick:alarm_failed'] = "Allarme attivato! Tentativo di scasso fallito.",
        ['notify.lockpick:missing_item'] = "Non hai uno scassino nella tua inventario!",
        ['notify.lockpick:failed_not_enough_police'] = "Non ci sono abbastanza poliziotti online per tentare un lockpick.",
        ['notify.lockpick:failed_owner_not_online'] = "Il proprietario non è online, non puoi lockpickare la sua proprietà.",

        -- Lockdown:
        ['notify.lockdown:missing_item'] = "Non hai l'oggetto richiesto nel tuo inventario!",

        -- Permissions:
        ['notify.permissions:cannot_remove_owner'] = "Non puoi rimuovere i permessi del proprietario.",
        ['notify.permissions:cannot_remove_self'] = "Non puoi rimuovere i tuoi stessi permessi.",
        ['notify.permissions:error'] = "Si è verificato un errore.",

        -- Creator:
        ['notify.creator:copied_code'] = "Hai copiato il codice, incollalo nel tuo file di configurazione!",
        ['notify.creator:out_of_zone'] = "Non puoi metterlo fuori dalla zona recintata!",
        ['notify.creator:cannot_inside_property'] = "You need to get out of the property...",
    },
    ['CZ'] = {
        ['control.gizmo:select'] = "Gizmo Vybrat",
        ['control.gizmo:translation'] = "Gizmo Překlad",
        ['control.gizmo:rotation'] = "Gizmo Rotace",

        -- Blips:
        ['blip.motel'] = "Motel",
        ['blip.building'] = "Apartmán",
        ['blip.house_agency'] = "Nemovitost Agentury",
        ['blip.house_owner'] = "Vlastněná Nemovitost",
        ['blip.house_renter'] = "Pronajatá Nemovitost",
        ['blip.house_key_holder'] = "Vlastněná Nemovitost",
        ['blip.house_for_sale'] = "Nemovitost Na Prodej",
        ['blip.marketplace'] = "Tržiště Nemovitostí",
        ['blip.alarm'] = "Poplach v Domě",
        
        -- Sale / Rent Sign
        ['dui.sale_sign:for_sale'] = "FOR SALE",
        ['dui.sale_sign:for_rent'] = "FOR RENT",
        ['dui.sale_sign:price'] = "${0}",
        ['dui.sale_sign:rent_weekly'] = "${0}<span>/week</span>",
        ['dui.sale_sign:rent_monthly'] = "${0}<span>/month</span>",

        -- 3D Text Main:
        ['3dtext.agency_showroom'] = "~p~[E]~s~ Showroom",
        ['3dtext.marketplace'] = "~p~[E]~s~ Tržiště",
        ['3dtext.view_house'] = "~p~[E]~s~ Zobrazit Nabídku",
        ['3dtext.building'] = "~p~[E]~s~ Building",
        ['3dtext.reception'] = "~p~[E]~s~ Reception",
        ['3dtext.show_house'] = "~p~[E]~s~ Ukázat",
        ['3dtext.exit_house'] = "~p~[E]~s~ Opustit",
        ['3dtext.parking'] = "~p~[E]~s~ Parking",
        ['3dtext.garage'] = "~p~[E]~s~ Garáž",
        ['3dtext.wardrobe'] = "~p~[E]~s~ Šatník",
        ['3dtext.storage'] = "~p~[E]~s~ Skladování",
        ['3dtext.emergency_exit'] = "~p~[E]~s~ Nouzový východ",
        ['3dtext.power_box'] = '~p~[E]~s~ Elektřina',

        -- Text UI Main:
        ['textui.agency_showroom'] = "Showroom",
        ['textui.marketplace'] = "Tržiště",
        ['textui.view_house'] = "Zobrazit Nabídku",
        ['textui.building'] = "Building",
        ['textui.reception'] = "Reception",
        ['textui.show_house'] = "Ukázat",
        ['textui.exit_house'] = "Opustit",
        ['textui.parking'] = "Parking",
        ['textui.garage'] = "Garáž",
        ['textui.wardrobe'] = "Šatník",
        ['textui.storage'] = "Skladování",
        ['textui.emergency_exit'] = "Nouzový východ",
        ['textui.power_box'] = 'Elektřina',
        ['textui.door'] = 'Door',

        ['menu:header'] = "Nemovitost #%s",
        ['menu.enter'] = "Vstoupit",
        ['menu.exit'] = "Opustit",
        ['menu.manage'] = "Správa",
        ['menu.furniture'] = "Nábytek",
        ['menu.toggle_light'] = "Přepnout Světlo",
        ['menu.toggle_lock'] = "Přepnout Zámek",
        ['menu.lockpick'] = "Zamknout Lomítkem",
        ['menu.lockdown'] = "Karanténa",
        ['menu.removeseal'] = "Odstranit Policejní Pečeť",
        ['menu.raid'] = "Razzia",
        ['menu.complete_raid'] = "Zavřít Dveře",
        ['menu.doorbell'] = "Zazvonit na Zvonek",
        ['menu.door_peephole'] = "Kukátko",
        ['menu.enter_underground_parking'] = "Vstoupit do parkoviště (Patro -%s)",

        ['menu.power_box_open'] = "Otevřít Elektřinu",
        ['menu.power_box_close'] = "Zavřít Elektřinu",
        ['menu.power_box_destroy'] = "Zničit",
        ['menu.power_box_turn_off'] = "Vypnout",
        ['menu.power_box_turn_on'] = "Zapnout",
        ['menu.power_box_repair'] = "Opravit",

        -- Target Main:
        ['target.agency_showroom'] = "Showroom",
        ['target.marketplace'] = "Tržiště",
        ['target.view_house'] = "Zobrazit Nabídku",
        ['target.building'] = "Building",
        ['target.reception'] = "Reception",
        ['target.enter'] = "Vstoupit",
        ['target.exit'] = "Opustit",
        ['target.garage'] = "Garáž",
        ['target.wardrobe'] = "Šatník",
        ['target.storage'] = "Skladování",
        ['target.manage'] = "Správa",
        ['target.furniture'] = "Nábytek",
        ['target.toggle_light'] = "Přepnout Světlo",
        ['target.toggle_lock'] = "Přepnout Zámek",
        ['target.toggle_lock_door'] = "Přepnout Zámek",
        ['target.doorbell'] = "Zazvonit na Zvonek",
        ['target.door_peephole'] = "Kukátko",
        ['target.lockpick'] = "Zamknout Lomítkem",
        ['target.lockdown'] = "Karanténa",
        ['target.removeseal'] = "Odstranit Policejní Pečeť",
        ['target.raid'] = "Razzia",
        ['target.complete_raid'] = "Zavřít Dveře",
        ['target.enter_underground_parking'] = "Vstoupit do parkoviště (Patro -%s)",
        ['target.emergency_exit'] = "Nouzový východ",

        -- Furniture Interactable:
        ['target.interactable:delivery'] = 'Rozbalit zásilku',
        ['target.interactable:wardrobe'] = 'Šatník',
        ['target.interactable:storage'] = 'Skladování',
        ['target.interactable:safe'] = 'Treasure',
        ['target.interactable:device'] = 'Notebook',
        ['target.interactable:mop'] = 'Mop',
        ['target.interactable:mower'] = 'Mower',
        ['target.interactable:power_box_open'] = 'Otevřít Elektřinu',
        ['target.interactable:power_box_close'] = 'Zavřít Elektřinu',
        ['target.interactable:power_box_destroy'] = 'Zničit',
        ['target.interactable:power_box_turn_off'] = 'Vypnout',
        ['target.interactable:power_box_turn_on'] = 'Zapnout',
        ['target.interactable:power_box_repair'] = 'Opravit',

        ['3dtext.interactable:delivery'] = '~p~[E]~s~ Rozbalit zásilku',
        ['3dtext.interactable:wardrobe'] = '~p~[E]~s~ Šatník',
        ['3dtext.interactable:storage'] = '~p~[E]~s~ Skladování',
        ['3dtext.interactable:safe'] = '~p~[E]~s~ Treasure',
        ['3dtext.interactable:device'] = '~p~[E]~s~ Notebook',
        ['3dtext.interactable:mop'] = '~p~[E]~s~ Mop',
        ['3dtext.interactable:mower'] = '~p~[E]~s~ Mower',

        ['textui.interactable:delivery'] = 'Rozbalit zásilku',
        ['textui.interactable:wardrobe'] = 'Šatník',
        ['textui.interactable:storage'] = 'Skladování',
        ['textui.interactable:safe'] = 'Treasure',
        ['textui.interactable:device'] = 'Notebook',
        ['textui.interactable:mop'] = 'Mop',
        ['textui.interactable:mower'] = 'Mower',

        -- Static Interactable:
        ['target.interactable:sink'] = 'Umyjte si ruce',
        ['target.interactable:sink_drink'] = 'Nápoj',
        ['target.interactable:shower'] = 'Vezmi si sprchu',

        ['3dtext.interactable'] = '~p~[E]~s~',

        ['textui.interactable'] = '',

        ['menu.interactable:sink'] = 'Umyjte si ruce',
        ['menu.interactable:sink_drink'] = 'Nápoj',
        ['menu.interactable:shower'] = 'Vezmi si sprchu',

        -- General:
        ['notify.wait'] = "Zkuste to znovu později...",
        ['notify.not_allowed'] = "Nemáte povolení k provedení této akce!",
        ['notify.not_enough_money'] = "Nemáte dost peněz!",
        ['notify.reached_properties_limit'] = "Dosáhli jste limitu nemovitostí!",

        -- Commands:
        ['notify.command_giveproperty:success'] = "You have given property %s to player %s.",
        ['notify.command_giveproperty:player_offline'] = "Player is offline.",
        ['notify.command_giveproperty:property_doesnt_exist'] = "Property %s doesn't exist.",
        ['notify.command_giveproperty:invalid_property_type'] = "You can't give a property of this type.",
        ['notify.command_giveproperty:property_has_owner'] = "Property %s already have an owner.",
        
        -- Property:
        ['notify.property:purchased'] = "Tuto nemovitost jste zakoupili za $%s.",
        ['notify.property:rented_monthly'] = "Nyní máte pronajatou tuto nemovitost za $%s měsíčně.",
        ['notify.property:rented_weekly'] = "Nyní máte pronajatou tuto nemovitost za $%s týdně.",
        ['notify.property:already_owned'] = "Tuto nemovitost již vlastníte.",
        ['notify.property:marketplace_blocked_by_renter'] = "Při pronajatém objektu nelze přistupovat na tržiště.",
        ['notify.property:cannot_sell_with_renter'] = "Nemůžete prodat nemovitost, která je pronajata.",
        ['notify.property:sold_property'] = "Nemovitost jste úspěšně prodali za $%s.",
        ['notify.property:purchased_theme'] = "Koupili jste téma %s za $%s.",
        ['notify.property:purchased_furniture'] = "Zakoupili jste nábytek %s za $%s.",
        ['notify.property:ordered_furniture'] = "Objednali jste nábytek %s za $%s.",
        ['notify.property:reached_furniture_limit'] = "Dosáhli jste limitu nábytku!<br>Prodejte svůj stávající nábytek nebo upgradeujte limit nábytku.",
        ['notify.property:reached_furniture_model_limit'] = "You have reached the furniture limit!<br>Limit of %s is %s, you can't have more of them.",
        ['notify.property:no_electricity'] = "Nemůžete zapnout světla - není el. energie. Prosím, zaplaťte účty!",
        ['notify.property:no_power'] = "You cannot do that - the power box is turned off.",
        ['notify.property:purchased_upgrade'] = "Zakoupili jste upgrade: %s za $%s.",
        ['notify.property:purchased_upgrade_free'] = "Obdrželi jste upgrade: %s zdarma.",
        ['notify.property:marketplace_offer_added'] = "Nemovitost byla umístěna na tržiště.",
        ['notify.property:marketplace_offer_updated'] = "Nabídka na nemovitost byla aktualizována.",
        ['notify.property:marketplace_offer_removed'] = "Nemovitost byla odstraněna z tržiště.",
        ['notify.property:marketplace_photomode_on'] = "Foto režim aktivován.",
        ['notify.property:marketplace_photomode_off'] = "Foto režim deaktivován.",
        ['notify.property:paid_services'] = "Zaplatili jste $%s za platby za služby za časové období %s.",
        ['notify.property:paid_rent'] = "Zaplatili jste $%s za nájem za období %s.",
        ['notify.property:rent_terminated_now'] = "Nájemní smlouva byla okamžitě ukončena.",
        ['notify.property:rent_termination_scheduled'] = "Nájemní smlouva skončí ke konci současného měsíce.",
        ['notify.property:rent_termination_cancelled'] = "Zrušení nájemní smlouvy bylo zrušeno.",
        ['notify.property:wardrobe_moved'] = "Aktualizovali jste polohu šatníku.",
        ['notify.property:storage_moved'] = "Aktualizovali jste polohu skladování.",
        ['notify.property:already_have_keys'] = "Tento hráč již vlastní klíče k této nemovitosti.",
        ['notify.property:added_keys'] = "Předali jste klíč pro %s.",
        ['notify.property:player_dont_have_keys'] = "Tento hráč nemá klíče k objektu.",
        ['notify.property:removed_keys'] = "Vzali jste klíče od %s.",
        ['notify.property:reached_keys_limit'] = "Dosáhli jste limitu klíčů!",
        ['notify.property:reached_permissions_limit'] = "Dosáhli jste limitu hráčů s oprávněním!",
        ['notify.property:moved_out'] = "Úspěšně jste se vystěhovali. Pronájem byl ukončen.",
        ['notify.property:furniture_is_used'] = "Tento nábytek je používán, nemůžete to udělat teď.",
        ['notify.property:put_the_mop_away'] = "Musíte dát mop stranou - nemůžete s ním ven.",

        -- Cameras:
        ['notify.cameras:no_cameras_installed'] = "Nemáte nainstalovány žádné kamery.",

        -- Alarm Alert:
        ['notify.alarm_alert:code_already_sent'] = "The verification code has already been sent. Please wait a moment before requesting a new code.",
        ['notify.alarm_alert:already_set'] = "Alarm is already set up.",
        ['notify.alarm_alert:invalid_phone_number'] = "The phone number you entered is invalid.",
        ['notify.alarm_alert:code_expired'] = "The authentication code has expired. Please request a new one.",
        ['notify.alarm_alert:invalid_code'] = "The authentication code you entered is invalid.",
        ['notify.alarm_alert:code_verified'] = "The authentication code has been verified. The alarm has been successfully activated for number %s.",
        ['notify.alarm_alert:removed'] = "The phone number has been removed, you will no longer receive alarm notifications.",

        ['sms.alarm:sender'] = "Alarm System",
        ['sms.alarm:authentication_code'] = "Your alarm authentication code is: %s. It will expire in %s seconds.",
        ['sms.alarm:authentication_success'] = "✅ The number %s has been successfully linked to the alarm system at %s %s. You will now receive notifications whenever the alarm is triggered.",
        ['sms.alarm:authentication_removed'] = "❌ The number %s has been unlinked from the alarm system at %s %s. You will no longer receive notifications from this property.",
        ['sms.alarm:lockpick_start'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_success'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_fail'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",

        -- Furniture:
        ['notify.furniture:removed'] = "Nábytek #%s odstraněn.",
        ['notify.furniture:sold'] = "Nábytek #%s prodáno za $%s",
        ['notify.furniture:cannot_sold'] = "Tento nábytek nelze prodat.",
        ['notify.furniture:you_are_in_furniture_mode'] = "Tohle nemůžete udělat, protože jste v režimu nábytku.",
        ['notify.furniture:cannot_place_inside'] = "Tento nábytek nelze umístit dovnitř nemovitosti.",
        ['notify.furniture:inside_disabled'] = "Tato nemovitost nepovoluje nábytek uvnitř.",
        ['notify.furniture:cannot_place_outside'] = "Tento nábytek nelze umístit ven z nemovitosti.",
        ['notify.furniture:outside_disabled'] = "Tato nemovitost neumožňuje venkovní nábytek.",
        ['notify.furniture:no_outdoor_area'] = "Tato nemovitost nemá venkovní prostor.",
        ['notify.furniture:outside_zone'] = "Nemůžete umístit nábytek mimo zónu nemovitosti.",
        ['notify.furniture:mode_cooldown'] = "Musíte počkat před dalším změnou režimu.",

        -- Doors:
        ['notify.doors:wait'] = "Nemůžete tak často otevírat a zavírat dveře.",

        -- Mop:
        ['notify.mop:you_cannot_put_down'] = "Nemůžete položit mop jinam - vraťte ho zpět do kbelíku.",

        -- Power Box:
        ['notify.powerbox:missing_item_turn_on'] = "Chybí vám potřebná položka pro zapnutí elektřiny.",
        ['notify.powerbox:missing_item_repair'] = "Chybí vám potřebná položka pro opravu elektřiny.",
        ['notify.powerbox:missing_item_turn_off'] = "Chybí vám potřebná položka pro vypnutí elektřiny.",
        ['notify.powerbox:missing_item_destroy'] = "Chybí vám potřebná položka pro zničení elektřiny.",

        -- Contract:
        ['notify.contract:player_too_far'] = "Cílový hráč je příliš daleko na podepsání smlouvy.",
        ['notify.contract:sent'] = "Odeslali jste smlouvu o nemovitosti %s.",
        ['notify.contract:canceled'] = "Hráč nepodepsal smlouvu.",
        ['notify.contract:seller_too_far'] = "Druhý hráč je příliš daleko na dokončení smlouvy.",
        ['notify.contract:purchased_from_player'] = "Úspěšně jste koupili nemovitost od %s.",
        ['notify.contract:sold_to_player'] = "Úspěšně jste prodali nemovitost hráči %s.",
        ['notify.contract:rented_to_player'] = "Úspěšně jste pronajali nemovitost hráči %s.",
        ['notify.contract:started_rent_from_player'] = "Pronajali jste nemovitost od hráče %s.",
        ['notify.contract:already_rented'] = "Tato nemovitost je již pronajata jiným hráčem.",

        -- Marketplace:
        ['notify.marketplace:started_rent'] = "Začali jste pronajímat nemovitost z tržiště.",
        ['notify.marketplace:purchased'] = "Zakoupili jste nemovitost z tržiště.",
        ['notify.marketplace:rented'] = "Vaše nemovitost byla pronajata prostřednictvím tržiště. Pronajal ji %s.",
        ['notify.marketplace:sold'] = "Vaše nemovitost byla prodána prostřednictvím tržiště. Zakoupil ji %s.",
        ['notify.marketplace:marked_on_gps'] = "Označená nemovitost na GPS.",

        -- Raid:
        ['notify.raid:anti_burglary_doors'] = "Nemůžete provést razzii na tuto nemovitost. Je chráněna proti vniknutí proti loupežné dveře.",
        ['notify.raid:missing_job'] = "Nemáte potřebné zaměstnání k provedení razzie na tuto nemovitost.",
        ['notify.raid:missing_item'] = "Chybí vám potřebný předmět k provedení razzie.",
        ['notify.raid:failed_due_to_anti_burglary'] = "Vaše pokus o vniknutí selhal. Protizlodějské dveře odolaly invazi.",

        -- Safe:
        ['notify.safe:cannot_set_same_pin'] = "Nemůžete nastavit stejný PIN jako aktuální.",
        ['notify.safe:wrong_old_pin_was_entered'] = "Zadali jste nesprávný starý PIN.",
        ['notify.safe:changed_pin'] = "PIN změněn z %s na %s.",

        -- Lockpick:
        ['notify.lockpick:alarm_start'] = "Poplach spuštěn! Detekován pokus o vloupání.",
        ['notify.lockpick:alarm_success'] = "Poplach spuštěn! Zámek byl otevřen lomítkem.",
        ['notify.lockpick:alarm_failed'] = "Poplach spuštěn! Pokus o lámání zámku selhal.",
        ['notify.lockpick:missing_item'] = "Nemáte lomítko ve svém inventáři!",
        ['notify.lockpick:failed_not_enough_police'] = "Není dostatek policistů online, aby se pokusili o lockpick.",
        ['notify.lockpick:failed_owner_not_online'] = "Vlastník není online, nemůžete lockpickovat jeho majetek.",

        -- Lockdown:
        ['notify.lockdown:missing_item'] = "Nemáte požadovaný předmět ve svém inventáři!",

        -- Permissions:
        ['notify.permissions:cannot_remove_owner'] = "Nemůžete odebrat oprávnění vlastníka.",
        ['notify.permissions:cannot_remove_self'] = "Nemůžete odebrat vlastní oprávnění.",
        ['notify.permissions:error'] = "Došlo k chybě.",

        -- Creator:
        ['notify.creator:copied_code'] = "Zkopírovali jste kód, vložte jej do svého konfiguračního souboru!",
        ['notify.creator:out_of_zone'] = "Nemůžete nastavit to mimo zónu zahrady!",
        ['notify.creator:cannot_inside_property'] = "You need to get out of the property...",
    },
    ['SV'] = {
        ['control.gizmo:select'] = "Gizmo Välj",
        ['control.gizmo:translation'] = "Gizmo Översättning",
        ['control.gizmo:rotation'] = "Gizmo Rotation",

        -- Blips:
        ['blip.motel'] = "Motel",
        ['blip.building'] = "Lägenhet",
        ['blip.house_agency'] = "Fastighetsbyrå",
        ['blip.house_owner'] = "Ägd Egendom",
        ['blip.house_renter'] = "Hyrd Egendom",
        ['blip.house_key_holder'] = "Ägd Egendom",
        ['blip.house_for_sale'] = "Fastighet Till Salu",
        ['blip.marketplace'] = "Fastighetsmarknaden",
        ['blip.alarm'] = "Hus Larm",
        
        -- Sale / Rent Sign
        ['dui.sale_sign:for_sale'] = "FOR SALE",
        ['dui.sale_sign:for_rent'] = "FOR RENT",
        ['dui.sale_sign:price'] = "${0}",
        ['dui.sale_sign:rent_weekly'] = "${0}<span>/week</span>",
        ['dui.sale_sign:rent_monthly'] = "${0}<span>/month</span>",

        -- 3D Text Main:
        ['3dtext.agency_showroom'] = "~p~[E]~s~ Utställningslokal",
        ['3dtext.marketplace'] = "~p~[E]~s~ Marknadsplats",
        ['3dtext.view_house'] = "~p~[E]~s~ Visa Erbjudande",
        ['3dtext.building'] = "~p~[E]~s~ Building",
        ['3dtext.reception'] = "~p~[E]~s~ Reception",
        ['3dtext.show_house'] = "~p~[E]~s~ Visa",
        ['3dtext.exit_house'] = "~p~[E]~s~ Gå ut",
        ['3dtext.parking'] = "~p~[E]~s~ Parking",
        ['3dtext.garage'] = "~p~[E]~s~ Garage",
        ['3dtext.wardrobe'] = "~p~[E]~s~ Garderob",
        ['3dtext.storage'] = "~p~[E]~s~ Förvaring",
        ['3dtext.emergency_exit'] = "~p~[E]~s~ Nödutgång",
        ['3dtext.power_box'] = '~p~[E]~s~ Strömbrytare',

        -- Text UI Main:
        ['textui.agency_showroom'] = "Utställningslokal",
        ['textui.marketplace'] = "Marknadsplats",
        ['textui.view_house'] = "Visa Erbjudande",
        ['textui.building'] = "Building",
        ['textui.reception'] = "Reception",
        ['textui.show_house'] = "Visa",
        ['textui.exit_house'] = "Gå ut",
        ['textui.parking'] = "Parking",
        ['textui.garage'] = "Garage",
        ['textui.wardrobe'] = "Garderob",
        ['textui.storage'] = "Förvaring",
        ['textui.emergency_exit'] = "Nödutgång",
        ['textui.power_box'] = 'Strömbrytare',
        ['textui.door'] = 'Door',

        ['menu:header'] = "Fastighet #%s",
        ['menu.enter'] = "Gå in",
        ['menu.exit'] = "Gå ut",
        ['menu.manage'] = "Hantera",
        ['menu.furniture'] = "Möbler",
        ['menu.toggle_light'] = "Växla Ljus",
        ['menu.toggle_lock'] = "Växla Lås",
        ['menu.lockpick'] = "Låsknackning",
        ['menu.lockdown'] = "Låsning",
        ['menu.removeseal'] = "Ta bort Polissegel",
        ['menu.raid'] = "Räd",
        ['menu.complete_raid'] = "Stäng Dörrar",
        ['menu.doorbell'] = "Ring på Dörrklockan",
        ['menu.door_peephole'] = "Dörrkikare",
        ['menu.enter_underground_parking'] = "Gå in i parkering (Våning -%s)",

        ['menu.power_box_open'] = "Öppna strömbrytare",
        ['menu.power_box_close'] = "Stäng strömbrytare",
        ['menu.power_box_destroy'] = "Förstör",
        ['menu.power_box_turn_off'] = "Stäng av",
        ['menu.power_box_turn_on'] = "Sätt på",
        ['menu.power_box_repair'] = "Laga",
        
        -- Target Main:
        ['target.agency_showroom'] = "Utställningslokal",
        ['target.marketplace'] = "Marknadsplats",
        ['target.view_house'] = "Visa Erbjudande",
        ['target.building'] = "Building",
        ['target.reception'] = "Reception",
        ['target.enter'] = "Gå in",
        ['target.exit'] = "Gå ut",
        ['target.garage'] = "Garage",
        ['target.wardrobe'] = "Garderob",
        ['target.storage'] = "Förvaring",
        ['target.manage'] = "Hantera",
        ['target.furniture'] = "Möbler",
        ['target.toggle_light'] = "Växla Ljus",
        ['target.toggle_lock'] = "Växla Lås",
        ['target.toggle_lock_door'] = "Växla Lås",
        ['target.doorbell'] = "Ring på Dörrklockan",
        ['target.door_peephole'] = "Dörrkikare",
        ['target.lockpick'] = "Låsknackning",
        ['target.lockdown'] = "Låsning",
        ['target.removeseal'] = "Ta bort Polissegel",
        ['target.raid'] = "Räd",
        ['target.complete_raid'] = "Stäng Dörrar",
        ['target.enter_underground_parking'] = "Gå in i parkering (Våning -%s)",
        ['target.emergency_exit'] = "Nödutgång",

        -- Möbler Interagerbar:
        ['target.interactable:delivery'] = 'Packa upp leveransen',
        ['target.interactable:wardrobe'] = 'Garderob',
        ['target.interactable:storage'] = 'Förvaring',
        ['target.interactable:safe'] = 'Kassaskåp',
        ['target.interactable:device'] = 'Laptop',
        ['target.interactable:mop'] = 'Mopp',
        ['target.interactable:mower'] = 'Mower',
        ['target.interactable:power_box_open'] = 'Öppna strömbrytare',
        ['target.interactable:power_box_close'] = 'Stäng strömbrytare',
        ['target.interactable:power_box_destroy'] = 'Förstör',
        ['target.interactable:power_box_turn_off'] = 'Stäng av',
        ['target.interactable:power_box_turn_on'] = 'Sätt på',
        ['target.interactable:power_box_repair'] = 'Laga',

        ['3dtext.interactable:delivery'] = '~p~[E]~s~ Packa upp leveransen',
        ['3dtext.interactable:wardrobe'] = '~p~[E]~s~ Garderob',
        ['3dtext.interactable:storage'] = '~p~[E]~s~ Förvaring',
        ['3dtext.interactable:safe'] = '~p~[E]~s~ Kassaskåp',
        ['3dtext.interactable:device'] = '~p~[E]~s~ Laptop',
        ['3dtext.interactable:mop'] = '~p~[E]~s~ Mopp',
        ['3dtext.interactable:mower'] = '~p~[E]~s~ Mower',

        ['textui.interactable:delivery'] = 'Packa upp leveransen',
        ['textui.interactable:wardrobe'] = 'Garderob',
        ['textui.interactable:storage'] = 'Förvaring',
        ['textui.interactable:safe'] = 'Kassaskåp',
        ['textui.interactable:device'] = 'Laptop',
        ['textui.interactable:mop'] = 'Mopp',
        ['textui.interactable:mower'] = 'Mower',

        -- Statisk Interagerbar:
        ['target.interactable:sink'] = 'Tvätta händerna',
        ['target.interactable:sink_drink'] = 'Drick',
        ['target.interactable:shower'] = 'Ta en dusch',

        ['3dtext.interactable'] = '~p~[E]~s~',

        ['textui.interactable'] = '',

        ['menu.interactable:sink'] = 'Tvätta händerna',
        ['menu.interactable:sink_drink'] = 'Drick',
        ['menu.interactable:shower'] = 'Ta en dusch',

        -- Allmänt:
        ['notify.wait'] = "Försök igen om en stund...",
        ['notify.not_allowed'] = "Du har inte tillstånd att göra det!",
        ['notify.not_enough_money'] = "Du har inte tillräckligt med pengar!",
        ['notify.reached_properties_limit'] = "Du har nått fastighetsgränsen!",

        -- Commands:
        ['notify.command_giveproperty:success'] = "You have given property %s to player %s.",
        ['notify.command_giveproperty:player_offline'] = "Player is offline.",
        ['notify.command_giveproperty:property_doesnt_exist'] = "Property %s doesn't exist.",
        ['notify.command_giveproperty:invalid_property_type'] = "You can't give a property of this type.",
        ['notify.command_giveproperty:property_has_owner'] = "Property %s already have an owner.",
        
        -- Egendom:
        ['notify.property:purchased'] = "Du har köpt denna egendom för $%s.",
        ['notify.property:rented_monthly'] = "Du hyr nu denna egenskap för $%s per månad.",
        ['notify.property:rented_weekly'] = "Du hyr nu denna egenskap för $%s per vecka.",
        ['notify.property:already_owned'] = "Du äger redan denna egendom.",
        ['notify.property:marketplace_blocked_by_renter'] = "Du kan inte komma åt marknadsplatsen medan denna egendom är uthyrd.",
        ['notify.property:cannot_sell_with_renter'] = "Du kan inte sälja egendomen medan den är uthyrd.",
        ['notify.property:sold_property'] = "Du har framgångsrikt sålt egendomen för $%s.",
        ['notify.property:purchased_theme'] = "Du köpte temat %s för $%s.",
        ['notify.property:purchased_furniture'] = "Du köpte möblerna %s för $%s.",
        ['notify.property:ordered_furniture'] = "Du har beställt möbler %s för $%s.",
        ['notify.property:reached_furniture_limit'] = "Du har nått möbelbegränsningen!<br>Sälj dina nuvarande möbler eller uppgradera Möbelbegränsningen.",
        ['notify.property:reached_furniture_model_limit'] = "You have reached the furniture limit!<br>Limit of %s is %s, you can't have more of them.",
        ['notify.property:no_electricity'] = "Du kan inte sätta på ljuset - det finns ingen elektricitet. Vänligen betala dina räkningar!",
        ['notify.property:no_power'] = "You cannot do that - the power box is turned off.",
        ['notify.property:purchased_upgrade'] = "Du köpte uppgraderingen: %s för $%s.",
        ['notify.property:purchased_upgrade_free'] = "Du fick uppgraderingen: %s gratis.",
        ['notify.property:marketplace_offer_added'] = "Egendomen har lagts upp på marknadsplatsen.",
        ['notify.property:marketplace_offer_updated'] = "Egendomsbudet har uppdaterats.",
        ['notify.property:marketplace_offer_removed'] = "Egendomen har tagits bort från marknadsplatsen.",
        ['notify.property:marketplace_photomode_on'] = "Fotoläge aktiverat.",
        ['notify.property:marketplace_photomode_off'] = "Fotoläge inaktiverat.",
        ['notify.property:paid_services'] = "Du betalade $%s för hushållsräkning för perioden %s.",
        ['notify.property:paid_rent'] = "Du betalade $%s för hyran för perioden %s.",
        ['notify.property:rent_terminated_now'] = "Hyresavtalet har avslutats omedelbart.",
        ['notify.property:rent_termination_scheduled'] = "Hyresavtalet kommer att upphöra vid slutet av nuvarande månad.",
        ['notify.property:rent_termination_cancelled'] = "Uppsägningen av hyresavtalet har avbrutits.",
        ['notify.property:wardrobe_moved'] = "Du har uppdaterat garderobsplatsen.",
        ['notify.property:storage_moved'] = "Du har uppdaterat förvaringsplatsen.",
        ['notify.property:already_have_keys'] = "Denna spelare har redan nycklarna till denna egendom.",
        ['notify.property:added_keys'] = "Du har lämnat över nyckeln för %s.",
        ['notify.property:player_dont_have_keys'] = "Denna spelare har inte nycklarna till egendomen.",
        ['notify.property:removed_keys'] = "Du tog nycklarna från %s.",
        ['notify.property:reached_keys_limit'] = "Du har nått nyckelgränsen!",
        ['notify.property:reached_permissions_limit'] = "Du har nått gränsen för spelare med behörighet!",
        ['notify.property:moved_out'] = "Du har flyttat ut framgångsrikt. Uthyrningen har avslutats.",
        ['notify.property:furniture_is_used'] = "Denna möbel används, du kan inte göra det nu.",
        ['notify.property:put_the_mop_away'] = "Du måste ställa undan moppen - du kan inte gå ut med den.",

        -- Kameror:
        ['notify.cameras:no_cameras_installed'] = "Du har inga kameror installerade.",

        -- Alarm Alert:
        ['notify.alarm_alert:code_already_sent'] = "The verification code has already been sent. Please wait a moment before requesting a new code.",
        ['notify.alarm_alert:already_set'] = "Alarm is already set up.",
        ['notify.alarm_alert:invalid_phone_number'] = "The phone number you entered is invalid.",
        ['notify.alarm_alert:code_expired'] = "The authentication code has expired. Please request a new one.",
        ['notify.alarm_alert:invalid_code'] = "The authentication code you entered is invalid.",
        ['notify.alarm_alert:code_verified'] = "The authentication code has been verified. The alarm has been successfully activated for number %s.",
        ['notify.alarm_alert:removed'] = "The phone number has been removed, you will no longer receive alarm notifications.",

        ['sms.alarm:sender'] = "Alarm System",
        ['sms.alarm:authentication_code'] = "Your alarm authentication code is: %s. It will expire in %s seconds.",
        ['sms.alarm:authentication_success'] = "✅ The number %s has been successfully linked to the alarm system at %s %s. You will now receive notifications whenever the alarm is triggered.",
        ['sms.alarm:authentication_removed'] = "❌ The number %s has been unlinked from the alarm system at %s %s. You will no longer receive notifications from this property.",
        ['sms.alarm:lockpick_start'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_success'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",
        ['sms.alarm:lockpick_fail'] = "🚨 Security Alert: The alarm has been triggered at %s %s.",

        -- Möbler:
        ['notify.furniture:removed'] = "Möbel #%s borttagen.",
        ['notify.furniture:sold'] = "Möbel #%s såld för $%s",
        ['notify.furniture:cannot_sold'] = "Denna möbel kan inte säljas.",
        ['notify.furniture:you_are_in_furniture_mode'] = "Du kan inte göra detta eftersom du är i möbel-läge.",
        ['notify.furniture:cannot_place_inside'] = "Du kan inte placera denna möbel inuti egendomen.",
        ['notify.furniture:inside_disabled'] = "Denna egendom tillåter inte möbler inuti.",
        ['notify.furniture:cannot_place_outside'] = "Du kan inte placera denna möbel utanför egendomen.",
        ['notify.furniture:outside_disabled'] = "Denna egendom tillåter inte utomhusmöbler.",
        ['notify.furniture:no_outdoor_area'] = "Denna egendom har ingen utomhusyta.",
        ['notify.furniture:outside_zone'] = "Du kan inte placera möbler utanför egendomens zon.",
        ['notify.furniture:mode_cooldown'] = "Du måste vänta innan du ändrar läge igen.",

        -- Dörrar:
        ['notify.doors:wait'] = "Du kan inte öppna och stänga dörren så ofta.",

        -- Mop:
        ['notify.mop:you_cannot_put_down'] = "Du kan inte lägga ner moppen i en annan hink - lägg tillbaka den i din hink.",

        -- Power Box:
        ['notify.powerbox:missing_item_turn_on'] = "Du saknar en nödvändig föremål för att slå på strömmen.",
        ['notify.powerbox:missing_item_repair'] = "Du saknar en nödvändig föremål för att laga strömbrytaren.",
        ['notify.powerbox:missing_item_turn_off'] = "Du saknar en nödvändig föremål för att stänga av strömmen.",
        ['notify.powerbox:missing_item_destroy'] = "Du saknar en nödvändig föremål för att förstöra strömbrytaren.",
        
        -- Kontrakt:
        ['notify.contract:player_too_far'] = "Målet spelare är för långt borta för att skriva under kontraktet.",
        ['notify.contract:sent'] = "Du har skickat ett egendomskontrakt till %s.",
        ['notify.contract:canceled'] = "Spelaren har inte skrivit på kontraktet.",
        ['notify.contract:seller_too_far'] = "Den andra spelaren är för långt borta för att slutföra kontraktet.",
        ['notify.contract:purchased_from_player'] = "Du har köpt egendomen från %s.",
        ['notify.contract:sold_to_player'] = "Du har framgångsrikt sålt egendomen till %s.",
        ['notify.contract:rented_to_player'] = "Du har framgångsrikt hyrt ut egendomen till %s.",
        ['notify.contract:started_rent_from_player'] = "Du har hyrt egendomen från %s.",
        ['notify.contract:already_rented'] = "Denna egendom är redan uthyrd av en annan spelare.",

        -- Marknadsplats:
        ['notify.marketplace:started_rent'] = "Du har börjat hyra egendomen från marknadsplatsen.",
        ['notify.marketplace:purchased'] = "Du har köpt egendomen från marknadsplatsen.",
        ['notify.marketplace:rented'] = "Din egendom har hyrts ut via marknadsplatsen. Den hyrdes av %s.",
        ['notify.marketplace:sold'] = "Din egendom har sålts via marknadsplatsen. Den köptes av %s.",
        ['notify.marketplace:marked_on_gps'] = "Markerad egendom på GPS.",

        -- Räd:
        ['notify.raid:anti_burglary_doors'] = "Du kan inte råna denna egendom. Den skyddas av anti-inbrottsdörrar.",
        ['notify.raid:missing_job'] = "Du har inte det nödvändiga jobbet för att råna denna egendom.",
        ['notify.raid:missing_item'] = "Du saknar en nödvändig artikel för att utföra rånet.",
        ['notify.raid:failed_due_to_anti_burglary'] = "Ditt försök att bryta dig in har misslyckats. Anti-inbrottsdörrarna motstod intrånget.",

        -- Kassaskåp:
        ['notify.safe:cannot_set_same_pin'] = "Du kan inte ställa in samma PIN som den nuvarande.",
        ['notify.safe:wrong_old_pin_was_entered'] = "Den gamla PIN-koden du angav är felaktig.",
        ['notify.safe:changed_pin'] = "PIN-koden ändrades från %s till %s.",

        -- Låsknackning:
        ['notify.lockpick:alarm_start'] = "Larm utlöst! Låsknackeriförsök upptäckt.",
        ['notify.lockpick:alarm_success'] = "Larm utlöst! Låset har knäckts.",
        ['notify.lockpick:alarm_failed'] = "Larm utlöst! Låsknackeriförsöket misslyckades.",
        ['notify.lockpick:missing_item'] = "Du har inte en låsknack i din inventory!",
        ['notify.lockpick:failed_not_enough_police'] = "Det finns inte tillräckligt med poliser online för att försöka låsa upp.",
        ['notify.lockpick:failed_owner_not_online'] = "Ägaren är inte online, du kan inte låsa upp hans egendom.",

        -- Låsning:
        ['notify.lockdown:missing_item'] = "Du har inte den nödvändiga artikeln i din inventory!",

        -- Behörigheter:
        ['notify.permissions:cannot_remove_owner'] = "Du kan inte ta bort ägarens behörigheter.",
        ['notify.permissions:cannot_remove_self'] = "Du kan inte ta bort dina egna behörigheter.",
        ['notify.permissions:error'] = "Ett fel har inträffat.",

        -- Skapare:
        ['notify.creator:copied_code'] = "Du har kopierat koden, klistra in den i din konfigurationsfil!",
        ['notify.creator:out_of_zone'] = "Du kan inte ställa det utanför gårdszonen!",
        ['notify.creator:cannot_inside_property'] = "You need to get out of the property...",
    },
}

TRANSLATE = function(name, ...)
    if Config.Translate[Config.Language] then
        if ... then
            return Config.Translate[Config.Language][name]:format(...)
        else
            return Config.Translate[Config.Language][name]
        end
    else
        if ... then
            return Config.Translate['EN'][name]:format(...)
        else
            return Config.Translate['EN'][name]
        end
    end
end