-----------------------------------------------------------------------------------------
-- EVENT'S --
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- CALLBACK'S --
-----------------------------------------------------------------------------------------

--- Outfit add/remove action
---@enum [parent=#Server/Editable.lua] outfitAction
---@param source number The source of the player
---@param add boolean True to add outfit, false to remove
---@param outfitName string The name of the outfit. If removing, this is the UUID
---@param outfitData table The outfit data to save (only when adding)
---@param slotId number The inventory slot ID where the outfit bag is located
---@return table The result of the action (success, uuid, message) - success: boolean, uuid: string, message: string
lib.callback.register('wais:outfitbag:server:outfitAction', function(source, add, outfitName, outfitData, slotId)
    local p = promise:new()
    local src = source

    if Config.Inventory.jaksam then
        local jaksam_inventory = exports.jaksam_inventory
        local slotData = jaksam_inventory:getItemFromSlot(src, slotId)
        if (slotData ~= nil) and slotData.name == Config.Inventory.item then
            slotData.metadata.outfits = slotData.metadata.outfits or {}
            local uuid = add and generateUUID(slotData.metadata.outfits) or outfitName
            if add then
                slotData.metadata.outfits[uuid] = {
                    ["label"] = outfitName,
                    ["outfits"] = outfitData,
                }
            else
                slotData.metadata.outfits[uuid] = nil
            end

            jaksam_inventory:setItemMetadataInSlot(src, slotId, slotData.metadata)
            p:resolve({
                success = true,
                uuid = uuid,
                message = add and Lang('outfit_saved', outfitName) or Lang('outfit_deleted'),
            })
            syncBag(src, add, add and {
                uuid = uuid,
                label = outfitName,
                outfits = outfitData,
            } or {
                uuid = outfitName
            })
        else
            p:resolve({
                success = false,
                message = Lang('cannot_found_on_slot', slotId),
            })
        end

        return Citizen.Await(p)
    end

    if Config.Inventory.codem then
        local codem_inventory = exports['codem-inventory']
        local item = codem_inventory:GetItemBySlot(src, slotId)
        if item then
            item.info.outfits = item.info.outfits or {}
            local uuid = add and generateUUID(item.info.outfits) or outfitName
            if add then
                item.info.outfits[uuid] = {
                    ["label"] = outfitName,
                    ["outfits"] = outfitData,
                }
            else
                item.info.outfits[uuid] = nil
            end

           codem_inventory:SetItemMetadata(src, slotId, item.info)
            p:resolve({
                success = true,
                uuid = uuid,
                message = add and Lang('outfit_saved', outfitName) or Lang('outfit_deleted'),
            })
            syncBag(src, add, add and {
                uuid = uuid,
                label = outfitName,
                outfits = outfitData,
            } or {
                uuid = outfitName
            })
        else
            p:resolve({
                success = false,
                message = Lang('cannot_found_on_slot', slotId),
            })
        end

        return Citizen.Await(p)
    end

    if Config.Inventory.ox then
        local ox_inventory = exports.ox_inventory
        local slotData = ox_inventory:GetSlot(src, slotId)
        if (slotData ~= nil) and slotData.name == Config.Inventory.item then
            slotData.metadata.outfits = slotData.metadata.outfits or {}
            local uuid = add and generateUUID(slotData.metadata.outfits) or outfitName
            if add then
                slotData.metadata.outfits[uuid] = {
                    ["label"] = outfitName,
                    ["outfits"] = outfitData,
                }
            else
                slotData.metadata.outfits[uuid] = nil
            end

            ox_inventory:SetMetadata(src, slotId, slotData.metadata)
            p:resolve({
                success = true,
                uuid = uuid,
                message = add and Lang('outfit_saved', outfitName) or Lang('outfit_deleted'),
            })
            syncBag(src, add, add and {
                uuid = uuid,
                label = outfitName,
                outfits = outfitData,
            } or {
                uuid = outfitName
            })
        else
            p:resolve({
                success = false,
                message = Lang('cannot_found_on_slot', slotId),
            })
        end

        return Citizen.Await(p)
    end

    if Config.Inventory.qs then
        local inventory = exports['qs-inventory']:GetInventory(src)
        local itemFound = false

        if inventory == nil then
            p:resolve({
                success = false,
                message = Lang('cannot_found_on_slot', slotId),
            })
            return Citizen.Await(p)
        end
        for k, v in pairs(inventory) do
            if v.slot == slotId and v.name == Config.Inventory.item then
                itemFound = true
                v.info = v.info or {}
                v.info.outfits = v.info.outfits or {}
                local uuid = add and generateUUID(v.info.outfits) or outfitName
                if add then
                    v.info.outfits[uuid] = {
                        ["label"] = outfitName,
                        ["outfits"] = outfitData,
                    }
                else
                    v.info.outfits[uuid] = nil
                end

                exports['qs-inventory']:SetItemMetadata(src, slotId, v.info)
                p:resolve({
                    success = true,
                    uuid = uuid,
                    message = add and Lang('outfit_saved', outfitName) or Lang('outfit_deleted'),
                })
                syncBag(src, add, add and {
                    uuid = uuid,
                    label = outfitName,
                    outfits = outfitData,
                } or {
                    uuid = outfitName
                })
                break
            end
        end

        if not itemFound then
            p:resolve({
                success = false,
                message = Lang('cannot_found_on_slot', slotId),
            })
        end

        return Citizen.Await(p)
    end

    if Config.Inventory.qb or Config.Inventory.ps then
        local item = exports['qb-inventory']:GetItemBySlot(src, slotId)
        if item then
            item.info.outfits = item.info.outfits or {}
            local uuid = add and generateUUID(item.info.outfits) or outfitName
            if add then
                item.info.outfits[uuid] = {
                    ["label"] = outfitName,
                    ["outfits"] = outfitData,
                }
            else
                item.info.outfits[uuid] = nil
            end

           local success = exports['qb-inventory']:SetItemData(src, Config.Inventory.item, "info", item.info, slotId)
           if success then
                p:resolve({
                    success = true,
                    uuid = uuid,
                    message = add and Lang('outfit_saved', outfitName) or Lang('outfit_deleted'),
                })
                syncBag(src, add, add and {
                    uuid = uuid,
                    label = outfitName,
                    outfits = outfitData,
                } or {
                    uuid = outfitName
                })
           else
                p:resolve({
                    success = false,
                    message = Lang('failed_save_outfit'),
                })
           end
        else
            p:resolve({
                success = false,
                message = Lang('cannot_found_on_slot', slotId),
            })
        end

        return Citizen.Await(p)
    end

    p:resolve({
        success = false,
        message = Lang('failed_save_outfit'),
    })
    return Citizen.Await(p)
end)

-----------------------------------------------------------------------------------------
-- FUNCTION'S --
-----------------------------------------------------------------------------------------

---Generates a UUID for a new clothing table
---@param table table The table to check for existing UUIDs
---@return string The generated UUID
function generateUUID(table)
    local uuid = lib.string.random("aaaa")
    if table[uuid] ~= nil then return generateUUID(table) end
    return uuid
end

---Item usage integration for other inventories except OX
---@enum [parent=#Server/Editable.lua] createUsableItem
---@return nil
function createUsableItem()
    if Config.Inventory.jaksam then
        return exports['jaksam_inventory']:registerUsableItem(Config.Inventory.item, function(source, _, item)
            TriggerClientEvent('wais:outfitbag:client:useBagItem', source, item)
        end)
    end

    wFramework.RegisterUsableItem(Config.Inventory.item, function(source, item)
        TriggerClientEvent('wais:outfitbag:client:useBagItem', source, item)
    end)
end

-----------------------------------------------------------------------------------------
-- COMMAND'S --
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- THREAD'S --
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- EXPORT'S --
-----------------------------------------------------------------------------------------
