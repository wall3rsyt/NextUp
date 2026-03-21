CreateThread(function()
    Wait(1000)
    
    if Config.Phone ~= 'lb-phone' then
        return
    end
    
    function SendSMS(data)
        exports["lb-phone"]:SendMessage(TRANSLATE('sms.alarm:sender'), data.phoneNumber, data.message)
    
        if data.coords then
            exports["lb-phone"]:SendCoords(TRANSLATE('sms.alarm:sender'), data.phoneNumber, data.coords.xy)
        end
    end
end)