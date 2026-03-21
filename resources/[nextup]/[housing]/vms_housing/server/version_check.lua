local ScriptVersion = 0
FILE_VERSIONS = {}

local function CompareVersions(v1, v2)
    local a1, b1, c1 = v1:match("(%d+)%.(%d+)%.(%d+)")
    local a2, b2, c2 = v2:match("(%d+)%.(%d+)%.(%d+)")

    a1, b1, c1 = tonumber(a1), tonumber(b1), tonumber(c1)
    a2, b2, c2 = tonumber(a2), tonumber(b2), tonumber(c2)

    if a1 ~= a2 then return a1 < a2 end
    if b1 ~= b2 then return b1 < b2 end
    return c1 < c2
end

Citizen.CreateThread(function()
    Citizen.Wait(5000)

    local resourceName = GetCurrentResourceName()
    local currentVersion = GetResourceMetadata(resourceName, 'version', 0)

    PerformHttpRequest('https://raw.githubusercontent.com/vames-dev/VMS_AssetsVersions/master/'..resourceName..'.txt',function(error, result, headers)
        if not result then 
            return print('^1The version check failed, github is down.^0') 
        end
        
        local result = json.decode(result:sub(1, -2))
        
        ScriptVersion = result.version
        
        if CompareVersions(currentVersion, ScriptVersion) then
            local symbols = '^9'
            for cd = 1, 26+#resourceName do
                symbols = symbols..'-'
            end
            symbols = symbols..'^0'
            print(symbols)
            print('^3['..resourceName..'] - New update available now!^0\nCurrent Version: ^1'..currentVersion..'^0.\nNew Version: ^2'..ScriptVersion..'^0.\nNews: ^2'..result.news..'^0.\n\n^5Download it now on your keymaster.fivem.net^0.')
            print(symbols)
        else
            --[[
            if FILE_VERSIONS and next(FILE_VERSIONS) then
                local oldFiles = ''
                
                for filePath, version in pairs(FILE_VERSIONS) do
                    if CompareVersions(version, ScriptVersion) then
                        oldFiles = oldFiles .. '\n- ' .. filePath .. '^7 (^1' .. version .. '^7 => ^2' .. ScriptVersion ..  '^7)'
                    end
                end
                
                if string.len(oldFiles) >= 1 then
                    print('^3===================================================^7')
                    print(('^3Version mismatch detected in %s^7'):format(resourceName))
                    print(('^3The following files are outdated:^7%s'):format(oldFiles))
                    print('')
                    print('^3Please reinstall the resource completely.^7')
                    print('^3To avoid further issues, do not overwrite individual files.^7')
                    print('^3===================================================^7')
                end
            end
            ]]
        end
    end, 'GET')
end)

function VerifyClientFiles(files)
    --[[
    if not ScriptVersion or ScriptVersion == 0 then
        return
    end
    
    local oldFiles = ''
    
    for filePath, version in pairs(files) do
        if CompareVersions(version, ScriptVersion) then
            oldFiles = oldFiles .. '\n- ' .. filePath .. '^7 (^1' .. version .. '^7 => ^2' .. ScriptVersion ..  '^7)'
        end
    end
    
    if string.len(oldFiles) >= 1 then
        print('^3===================================================^7')
        print(('^3Version mismatch detected in %s^7'):format(GetCurrentResourceName()))
        print(('^3The following files are outdated:^7%s'):format(oldFiles))
        print('')
        print('^3Please reinstall the resource completely.^7')
        print('^3To avoid further issues, do not overwrite individual files.^7')
        print('^3===================================================^7')
    end
    ]]
end