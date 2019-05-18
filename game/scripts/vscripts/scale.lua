--For some reason if we set health at various gamestates it gets reset when tower protection is applied, so we delay it via timer
if (GetMapName() == "dota_mid_3v3") then
    scaleValue = 0.6
elseif (GetMapName() == "dota_mid_5v5") then
    scaleValue = 1.0
elseif (GetMapName() == "dota_mid_8v8") then
    scaleValue = 1.6
elseif (GetMapName() == "dota_mid_10v10") then
    scaleValue = 2.0
elseif (GetMapName() == "dota_mid_12v12") then
    scaleValue = 2.4
else
    scaleValue = 1.0
end

Timers:CreateTimer({
    useGameTime = false,
    endTime = 18,
    callback = function()
        scaleClassNames = { "npc_dota_tower", "npc_dota_barracks", "npc_dota_filler", "npc_dota_fort" }
    
        for i,scaleClassName in pairs(scaleClassNames) do
            print (scaleClassName, scaleValue)
            buildings = Entities:FindAllByClassname(scaleClassName)
            for k,building in ipairs(buildings) do
                curHealth = building:GetHealth()
                newHealth = curHealth * scaleValue
                building:SetMaxHealth(newHealth)
                building:SetHealth(newHealth) --SetMaxHealth alone didn't work
            end
        end
   end
   })