CreateThread(function()
    Wait(1000)

    if Config.Phone ~= 'yseries' then
        return
    end
    
    function SendSMS(data)
        exports["yseries"]:SendNotification({
            title = TRANSLATE('sms.alarm:sender'),
            text = data.message,
            timeout = 0,
        }, 'phoneNumber', data.phoneNumber)
    end
end)