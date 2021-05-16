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

  local model, sex, fullSkin = nil

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
end
---COMMAND
RegisterCommand("refreshskin", function()
  refreshskin()
end)

