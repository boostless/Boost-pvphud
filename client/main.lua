local loaded = false
local uiOpen = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    loaded = true
    ESX.TriggerServerCallback('3sidesrw-hud:GetData', function(data)
        OpenUi()
        UpdateData(data)
    end)
end)

CreateThread(function()
    loaded = ESX.PlayerLoaded
    while not loaded do
        Wait(100)
    end
    OpenUi()
    while true do
        ESX.TriggerServerCallback('3sidesrw-hud:GetData', function(data)
            UpdateData(data)
        end)
        Wait(2000)
    end
end)

RegisterCommand('hud', function()
    if uiOpen then
        CloseUi()
    else
        OpenUi()
        ESX.TriggerServerCallback('3sidesrw-hud:GetData', function(data)
            UpdateData(data)
        end)
    end
end)

OpenUi = function()
    if not uiOpen then
        SendNUIMessage({
            type = 'ui',
            show = true
        })
        uiOpen = true
    end
end

UpdateData = function(data)
    if uiOpen then
        SendNUIMessage({
            type = 'update',
            data = data
        })
    end
end

CloseUi = function()
    if uiOpen then
        SendNUIMessage({
            type = 'ui',
            show = false
        })
        uiOpen = false
    end
end