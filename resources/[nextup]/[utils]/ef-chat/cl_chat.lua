local chatInputActive = false
local chatInputActivating = false
local chatHidden = true
local chatLoaded = false

RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('__cfx_internal:serverPrint')
RegisterNetEvent('_chat:messageEntered')
RegisterNetEvent('chat:clear')

-- Cache voor suggestions om dubbele NUI calls te voorkomen
local suggestionCache = {}

AddEventHandler('chatMessage', function(author, ctype, text)
    local ctype = ctype ~= false and ctype or "normal"
    SendNUIMessage({
        type = 'ON_MESSAGE',
        message = {
            template = '<div class="chat-message ' .. ctype ..
                '"><div class="chat-message-body"><strong>{0}:</strong> {1}</div></div>',
            args = {author, text}
        }
    })
end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
    SendNUIMessage({
        type = 'ON_MESSAGE',
        message = {templateId = 'print', multiline = true, args = {msg}}
    })
end)

AddEventHandler('chat:addMessage', function(message)
    SendNUIMessage({type = 'ON_MESSAGE', message = message})
end)

AddEventHandler('chat:addTemplate', function(id, html)
    SendNUIMessage({type = 'ON_TEMPLATE_ADD', template = {id = id, html = html}})
end)

AddEventHandler('chat:clear', function()
    SendNUIMessage({action = 'clear'})
end)

-- Suggestion helpers
local function sendSuggestion(name, help, params)
    local key = name .. (help or '')
    if suggestionCache[key] then return end
    suggestionCache[key] = true

    SendNUIMessage({
        type = 'ON_SUGGESTION_ADD',
        suggestion = {name = name, help = help, params = params or nil}
    })

    if string.find(name, '/') then
        local nameWithoutSlash = string.gsub(name, '/', '')
        local key2 = nameWithoutSlash .. (help or '')
        if not suggestionCache[key2] then
            suggestionCache[key2] = true
            SendNUIMessage({
                type = 'ON_SUGGESTION_ADD',
                suggestion = {name = nameWithoutSlash, help = help, params = params or nil}
            })
        end
    end
end

AddEventHandler('chat:addSuggestion', function(name, help, params)
    sendSuggestion(name, help, params)
end)

AddEventHandler('chat:addSuggestions', function(suggestions)
    for _, suggestion in ipairs(suggestions) do
        sendSuggestion(suggestion.name, suggestion.help, suggestion.params)
    end
end)

AddEventHandler('chat:removeSuggestion', function(name)
    suggestionCache[name] = nil
    SendNUIMessage({type = 'ON_SUGGESTION_REMOVE', name = name})

    if string.find(name, '/') then
        local nameWithoutSlash = string.gsub(name, '/', '')
        suggestionCache[nameWithoutSlash] = nil
        SendNUIMessage({type = 'ON_SUGGESTION_REMOVE', name = nameWithoutSlash})
    end
end)

-- Refresh commands: alleen uitvoeren als chatLoaded
local function refreshCommands()
    if not GetRegisteredCommands or not chatLoaded then return end

    local registeredCommands = GetRegisteredCommands()
    local suggestions = {}
    local seen = {}

    for _, command in ipairs(registeredCommands) do
        if IsAceAllowed(('command.%s'):format(command.name)) then
            local hasSlash = string.find(command.name, '/')
            local name = command.name
            local nameSlash = '/' .. command.name

            if not seen[name] then
                seen[name] = true
                table.insert(suggestions, {name = name, help = ''})
            end

            if not hasSlash and not seen[nameSlash] then
                seen[nameSlash] = true
                table.insert(suggestions, {name = nameSlash, help = ''})
            end
        end
    end

    -- Reset cache en stuur in één keer
    suggestionCache = {}
    SendNUIMessage({type = 'ON_SUGGESTIONS_SET', suggestions = suggestions})
end

-- Refresh themes: alleen als chatLoaded
local function refreshThemes()
    if not chatLoaded then return end

    local themes = {}

    for resIdx = 0, GetNumResources() - 1 do
        local resource = GetResourceByFindIndex(resIdx)

        if GetResourceState(resource) == 'started' then
            local numThemes = GetNumResourceMetadata(resource, 'chat_theme')

            if numThemes > 0 then
                local themeName = GetResourceMetadata(resource, 'chat_theme')
                local themeData = json.decode(
                    GetResourceMetadata(resource, 'chat_theme_extra') or 'null'
                )

                if themeName and themeData then
                    themeData.baseUrl = 'nui://' .. resource .. '/'
                    themes[themeName] = themeData
                end
            end
        end
    end

    SendNUIMessage({type = 'ON_UPDATE_THEMES', themes = themes})
end

-- Debounce: voorkomt dat bij snel achter elkaar starten van resources
-- refreshCommands/refreshThemes tientallen keren wordt aangeroepen
local refreshPending = false
local function scheduleRefresh(checkTheme, resName)
    if refreshPending then return end
    refreshPending = true

    SetTimeout(1000, function()
        refreshPending = false
        refreshCommands()
        -- Alleen themes refreshen als de resource een chat_theme heeft
        if checkTheme and resName and GetNumResourceMetadata(resName, 'chat_theme') > 0 then
            refreshThemes()
        end
    end)
end

AddEventHandler('onClientResourceStart', function(resName)
    scheduleRefresh(true, resName)
end)

AddEventHandler('onClientResourceStop', function(resName)
    scheduleRefresh(true, resName)
end)

RegisterNUICallback('loaded', function(data, cb)
    TriggerServerEvent('chat:init')
    chatLoaded = true
    refreshCommands()
    refreshThemes()
    cb('ok')
end)

RegisterNUICallback('chatResult', function(data, cb)
    chatInputActive = false
    SetNuiFocus(false, false)

    if not data.canceled then
        if data.message:sub(1, 1) == '/' then
            ExecuteCommand(data.message:sub(2))
        else
            ExecuteCommand(data.message:sub(1))
        end
    end

    cb('ok')
end)

RegisterKeyMapping('chatopen', 'Opens Chat Window', 'keyboard', 't')
RegisterCommand('chatopen', function()
    SetTextChatEnabled(false)
    SetNuiFocus(false, false)

    if not chatInputActive then
        chatInputActive = true
        chatInputActivating = true
        SendNUIMessage({type = 'ON_OPEN'})
    end

    if chatInputActivating then
        SetNuiFocus(true)
        chatInputActivating = false
    end

    if chatLoaded then
        local shouldBeHidden = IsScreenFadedOut() or IsPauseMenuActive()

        if (shouldBeHidden and not chatHidden) or (not shouldBeHidden and chatHidden) then
            chatHidden = shouldBeHidden
            SendNUIMessage({type = 'ON_SCREEN_STATE_CHANGE', shouldHide = shouldBeHidden})
        end
    end
end)