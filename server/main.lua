ESX.RegisterServerCallback('3sidesrw-hud:GetData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb({
        kills = 1, -- kills
        deaths = 0, -- deaths
        kd = GetKD(1 --[[Change this to your kills]], 0 --[[Change this to your deaths]]),
        level = tostring(1), --[[Change this to your level]]
        xp = tostring(400), --[[Change this to your xp]]
        nextXp = 800,  --[[Change this to your next level xp]]
        money = xPlayer.getAccount('bank').money
    })
end)

GetKD = function(kills, deaths)
    if kills == 0 and deaths == 0 then
        return 0
    elseif kills == 0 and deaths ~= 0 or kills ~= 0 and deaths == 0 then
        return 0
    else
        return math.floor((kills / deaths) * 10) / 10
    end
end