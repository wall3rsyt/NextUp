-- 5 minuten melding
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 300 then
        exports["lb-phone"]:EmergencyNotification(-1, {
            title   = "⚠️ Server herstart",
            content = "De server herstart over 5 minuten. Sla op en zoek een veilige plek.",
            icon    = "warning",
        })
    end
end)
 
-- 1 minuut melding
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        exports["lb-phone"]:EmergencyNotification(-1, {
            title   = "🚨 Herstart over 1 minuut!",
            content = "De server herstart over 1 minuut. Stop alle activiteiten.",
            icon    = "danger",
        })
    end
end)
 