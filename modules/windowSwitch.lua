
local function getCurrentScreen()
  local win = hs.window.frontmostWindow()
  local screenId = hs.screen.primaryScreen():getUUID()
  if win ~= nil then
    screenId = win:screen():getUUID()
  end
  -- log.i("Current ScreenId %s", screenId)
  return screenId
end
local wf = hs.window.filter.new():setCurrentSpace(true)
local wf_n = hs.window.filter.copy(wf)

local function createSwitcher(screenId)
  wf_n = hs.window.filter.copy(wf):setScreens(screenId)
  return hs.window.switcher.new(wf_n)
end

local ws1 = {}
local currentScreenUUID = ''

local function nextWindow() 
  if currentScreenUUID ~= getCurrentScreen() then
    currentScreenUUID = getCurrentScreen()
    ws1 = createSwitcher(currentScreenUUID)
  end
  ws1:next()
end

hs.hotkey.bind(Hyper,'tab','Next window',nextWindow, nil, function() ws1:next() end)
hs.hotkey.bind(Hyper,'9','Prev window',function() ws1:previous() end) -- , nil, function() ws1:previous() end)



