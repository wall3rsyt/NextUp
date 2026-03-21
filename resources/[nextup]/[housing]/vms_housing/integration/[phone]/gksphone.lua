CreateThread(function()
    Wait(1000)

    if Config.Phone ~= 'gksphone' then
        return
    end
    
    function SendSMS(data)
        local source = exports["gksphone"]:GetSourceByPhone(data.phoneNumber)
    
        if not source then
            return
        end
    
        local isV1 = pcall(function()
            return exports["gksphone"].SendNotification
        end)
        
        if isV1 then
            exports["gksphone"]:SendNotification(source, {
                title       = TRANSLATE('sms.alarm:sender'), 
                message     = data.message, 
                img         = '/html/static/img/icons/messages.png', 
                duration    = 8000
            })
        else
            exports["gksphone"]:sendNotification(source, {
                title       = TRANSLATE('sms.alarm:sender'), 
                message     = data.message, 
                icon        = '/html/img/icons/messages.png',
                duration    = 8000,
                type        = "success",
            })
        end
    end
end)
