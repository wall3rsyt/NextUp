-- Webhook for instapic posts, recommended to be a public channel
INSTAPIC_WEBHOOK = "https://discord.com/api/webhooks/"
-- Webhook for birdy posts, recommended to be a public channel
BIRDY_WEBHOOK = "https://discord.com/api/webhooks/"

-- Discord webhook or API key for server logs
-- We recommend https://fivemanage.com/ for logs. Use code "LBLOGS" for 20% off the Logs Pro plan
LOGS = {
    Default = "https://discord.com/api/webhooks/1435448464874930270/uh8YdeseDWM6SwXzNqVId39OZTamS2Cp74bBsHqSACtXLKoiUCZ_Be1ijliZZOXXDHto", -- set to false to disable
    Calls = "https://discord.com/api/webhooks/1435449152728203296/NurHCugVSvrid8_41tdxlUROorT3EjiRj8Vx2Bc0vJk-J-sebq1JbiX-m3nqCZeKrqBg",
    Messages = "https://discord.com/api/webhooks/1435449247724994631/6rg2D2tm0i5Jy43M7bOcWjM2tw2rtaTQjo4W2yaPAAdwYpQPb8xtJ73P1D-tfYIlqL9i",
    InstaPic = "https://discord.com/api/webhooks/1435449350934364293/vBuEE_-ARCHfTCHULozUkzP_FALZsb5YElGpR0MtwBle1OvFRqh_u47FvzTH-siyI5Pa",
    Birdy = "https://discord.com/api/webhooks/1435449481901637672/wwq3ty3kbG-Lnj9A9YwxJXvRYkJsyJwXUza-wXx3CQaALxxVTGqGtcd7cYZM2IkLXDn6",
    YellowPages = "https://discord.com/api/webhooks/",
    Marketplace = "https://discord.com/api/webhooks/",
    Mail = "https://discord.com/api/webhooks/",
    Wallet = "https://discord.com/api/webhooks/",
    DarkChat = "https://discord.com/api/webhooks/",
    Services = "https://discord.com/api/webhooks/",
    Crypto = "https://discord.com/api/webhooks/",
    Trendy = "https://discord.com/api/webhooks/",
    Uploads = "https://discord.com/api/webhooks/1435447162875023470/GztEVib1vsElNGfiJqw5apFjOzqlR80XX4g7JU1RijQndlKkfhok5Whkt64hKFH9RSdX" 
}

DISCORD_TOKEN = nil -- you can set a discord bot token here to get the players discord avatar for logs

-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- You can get your API keys from https://fivemanage.com/
-- Use code LBPHONE10 for 10% off on Fivemanage
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = "fCYfOU5yOgObkDb1lfw5iXq4aU1Mrs8m",
    Image = "O7WCQolcRgKksSv3FqZ1oHShdjvyQRKB",
    Audio = "oZq14qbBdIrLYDyFSr0jLvd4kT447LCT",
}

-- Here you can set your credentials for Config.DynamicWebRTC
-- This is needed if video calls or InstaPic live streams are not working
-- You can get your credentials from https://dash.cloudflare.com/?to=/:account/realtime/turn/overview
WEBRTC = {
    TokenID = nil,
    APIToken = nil,
}
