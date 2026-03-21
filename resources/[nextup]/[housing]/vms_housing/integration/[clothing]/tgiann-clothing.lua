if Config.Clothing ~= 'tgiann-clothing' then
    return
end

function OpenWardrobe()
    exports["tgiann-clothing"]:OpenOutfitStash('HouseClothes')
end