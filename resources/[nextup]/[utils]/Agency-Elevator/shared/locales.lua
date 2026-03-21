Locales = {}
CurrentLocale = nil

function SetLocale(locale)
    if Locales[locale] then
        CurrentLocale = locale
    else
        CurrentLocale = 'en'
        print('^1[Agency-Elevator]^0 Locale "' .. tostring(locale) .. '" not found, falling back to "en"')
    end
end

function L(key, ...)
    local locale = CurrentLocale or 'en'
    local str = Locales[locale] and Locales[locale][key]

    if not str then
        str = Locales['en'] and Locales['en'][key]
    end

    if not str then
        return key
    end

    if ... then
        return string.format(str, ...)
    end

    return str
end

function GetLocaleData()
    local locale = CurrentLocale or 'en'
    return Locales[locale] or Locales['en'] or {}
end
