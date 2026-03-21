-- UI Configuration
Config = {}

-- Debug Configuration
Config.Debug = false -- Set to false to disable all debug messages

-- Text Configuration
Config.Text = {
    title = "Drive-In Light Controller",
    switchLabel = "Lights Status",
    switchOff = "OFF",
    switchOn = "ON",
    totalLights = "Total Lights:",
    status = "Status:",
    totalLightsLabel = "Total Lights:",
    statusLabel = "Status:",
    statusActive = "Active",
    statusInactive = "Inactive",
    
    -- Config Panel
    configTitle = "UI Configuration",
    textSettings = "Text Settings",
    colorSettings = "Color Settings",
    saveButton = "Save Changes",
    resetButton = "Reset to Default"
}

-- Color Configuration (CSS colors)
Config.Colors = {
    -- Background colors
    panelBackground = "linear-gradient(135deg, #1e293b 0%, #334155 100%)",
    headerBackground = "linear-gradient(135deg, #0f172a 0%, #1e293b 100%)",
    contentBackground = "rgba(15, 23, 42, 0.6)",
    
    -- Text colors
    titleColor = "#f8fafc",
    labelColor = "#e2e8f0",
    textColor = "#cbd5e1",
    highlightColor = "#60a5fa",
    
    -- Switch colors
    switchOffColor = "#ef4444",
    switchOnColor = "#10b981",
    switchBackground = "linear-gradient(135deg, #374151 0%, #4b5563 100%)",
    switchActiveBackground = "linear-gradient(135deg, #059669 0%, #10b981 100%)",
    
    -- Button colors
    closeButtonHover = "rgba(239, 68, 68, 0.1)",
    closeButtonHoverText = "#ef4444",
    
    -- Panel colors
    panelBackgroundStart = "#1e293b",
    panelBackgroundEnd = "#334155",
    headerBackgroundStart = "#0f172a",
    headerBackgroundEnd = "#1e293b",
    
    -- Info panel colors
    infoPanelBackground = "#0f172a",
    
    -- Border colors
    borderColor = "rgba(255, 255, 255, 0.1)",
    borderColorActive = "#10b981"
}

-- Default values for reset
Config.DefaultText = {
    title = "Drive-In Light Controller",
    switchLabel = "Lights Status",
    switchOff = "OFF",
    switchOn = "ON",
    totalLights = "Total Lights:",
    status = "Status:",
    totalLightsLabel = "Total Lights:",
    statusLabel = "Status:",
    statusActive = "Active",
    statusInactive = "Inactive"
}

Config.DefaultColors = {
    panelBackground = "linear-gradient(135deg, #1e293b 0%, #334155 100%)",
    headerBackground = "linear-gradient(135deg, #0f172a 0%, #1e293b 100%)",
    contentBackground = "rgba(15, 23, 42, 0.6)",
    titleColor = "#f8fafc",
    labelColor = "#e2e8f0",
    textColor = "#cbd5e1",
    highlightColor = "#60a5fa",
    switchOffColor = "#ef4444",
    switchOnColor = "#10b981",
    switchBackground = "linear-gradient(135deg, #374151 0%, #4b5563 100%)",
    switchActiveBackground = "linear-gradient(135deg, #059669 0%, #10b981 100%)",
    closeButtonHover = "rgba(239, 68, 68, 0.1)",
    closeButtonHoverText = "#ef4444",
    panelBackgroundStart = "#1e293b",
    panelBackgroundEnd = "#334155",
    headerBackgroundStart = "#0f172a",
    headerBackgroundEnd = "#1e293b",
    infoPanelBackground = "#0f172a",
    borderColor = "rgba(255, 255, 255, 0.1)",
    borderColorActive = "#10b981"
}