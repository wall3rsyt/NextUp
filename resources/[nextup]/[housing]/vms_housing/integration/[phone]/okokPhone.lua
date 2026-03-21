CreateThread(function()
    Wait(1000)

    if Config.Phone ~= 'okokPhone' then
        return
    end
    
    function SendSMS(data)
        local message = {
            sender = TRANSLATE('sms.alarm:sender'),
            receiver = data.phoneNumber,
            message = data.message,
            gps = data.coords,
        }
    
        exports.okokPhone:sendMessage(message)
    end
end)