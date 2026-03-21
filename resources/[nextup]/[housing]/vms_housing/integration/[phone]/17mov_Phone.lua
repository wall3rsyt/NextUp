CreateThread(function()
    Wait(1000)
    
    if Config.Phone ~= '17mov_Phone' then
        return
    end
    
    function SendSMS(data)
        local phoneNumber = data.phoneNumber:gsub("[()%-%s]", "")

        exports["17mov_Phone"]:Messages_SendMessageToNumber(phoneNumber, data.message, TRANSLATE('sms.alarm:sender'))
    end
end)