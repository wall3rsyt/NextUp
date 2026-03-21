local DISCORD_WEBHOOK = 'WEBHOOK HERE' -- SET WEBHOOK HERE ONLY!!!!

function onFinishTheoryTest(playerId, result)
    -- you can implement some logic [add document or smth]
end

function onFinishPracticeTest(playerId, result)
    -- you can implement some logic [add document or smth]
end

function sendDiscordLog(playerId, message)
    Citizen.CreateThread(function()
        if DISCORD_WEBHOOK == 'WEBHOOK_HERE' --[[DONT TOUCH IT!!!!!!!]] then return end
        local steamName, steamHex, discordId = 'Unknown', 'Unknown', 'Unknown'
        if playerId then
            steamName = GetPlayerName(playerId)
            local identifiers = GetPlayerIdentifiers(playerId)
            for i = 1, #identifiers do
                if string.find(identifiers[i], 'steam:') then
                    steamHex = identifiers[i]
                elseif string.find(identifiers[i], 'discord:') then
                    discordId = string.gsub(identifiers[i], 'discord:', '')
                end
            end
        end
    
        message = message..'\nID: '..(playerId or 'Server')..'\nSteam Name: '..steamName..'\nSteam HEX: '..steamHex..'\nDiscord: <@'..discordId..'>'
        local embedData = { {
            ['title'] = 'DMV School Creator',
            ['color'] = 14423100,
            ['footer'] = {
                ['text'] = "DMV School Creator | pScripts | " .. os.date(),
                ['icon_url'] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png"
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = "pScripts",
                ['icon_url'] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png"
            }
        } }
        PerformHttpRequest(DISCORD_WEBHOOK, nil, 'POST', json.encode({
            username = 'pScripts',
            embeds = embedData
        }), {
            ['Content-Type'] = 'application/json'
        })
    end)
end