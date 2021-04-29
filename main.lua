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
  local model = nil
  local sex = ESX.GetPlayerData().skin.sex
  if sex == 1 then 
    model = GetHashKey("mp_f_freemode_01") 
  else 
    model = GetHashKey("mp_m_freemode_01") 
  end 
  
  RequestModel(model)

  SetPlayerModel(PlayerId(), model)
  SetModelAsNoLongerNeeded(model)
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    TriggerEvent('skinchanger:loadSkin', skin)
  end)
end

---COMMAND
RegisterCommand(Config.Commandname, function()
  refreshskin()
end)
