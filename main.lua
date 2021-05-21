-- CHANGE CORE NAME ACCORDINGLY
ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(200)
  end
end)

-- FUNCTION
function refreshskin()
  local playerPed = PlayerPedId()
  local maxhealth = GetEntityMaxHealth(playerPed)
  local health = GetEntityHealth(playerPed)
   local model, sex, fullSkin = nil
 local wep = GetSelectedPedWeapon(playerPed)

  TriggerEvent('skinchanger:getSkin', function(skin) sex = skin.sex fullSkin = skin end)
  
  if sex == 1 then 
    model = GetHashKey("mp_f_freemode_01") 
  else 
    model = GetHashKey("mp_m_freemode_01") 
  end 
  
  RequestModel(model)

  SetPlayerModel(PlayerId(), model)
  SetModelAsNoLongerNeeded(model)
  TriggerEvent('skinchanger:loadSkin', fullSkin)
   SetPedMaxHealth(PlayerId(), maxhealth)
   Citizen.Wait(1000) 
  SetEntityHealth(PlayerPedId(), health)

end
---COMMAND
RegisterCommand("refreshskin", function()
  refreshskin()
end)

