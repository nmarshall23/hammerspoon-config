hyper = {"ctrl", "cmd", "shift"}

-- hs.logger.defaultLogLevel = 'debug'
local log = hs.logger.new('config','debug')
log.i('Initializing') -- will print "[mymodule] Initializing" to the console

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:andUse("MiroWindowsManager", 
  {
    config = {
        sizes = { 2, 4, 1/4},
        fullScreenSizes = { 5/3, 1 }
    },
    hotkeys = {
        up = { hyper, "up"},
        right = { hyper, "right"},
        down = { hyper, "down"},
        left = { hyper, "left"},
        fullscreen = { hyper, "f"}
    }
  }
)

spoon.SpoonInstall:andUse("ClipboardTool",
  {
    disable = false,
    config = {
      -- show_in_menubar = false,
      paste_on_select = true,
      hist_size = 15
    },
    hotkeys = {
      toggle_clipboard = { hyper, "v" } 
    },
    start = true,
  }
)

-- spoon.MiroWindowsManager:init()

-- hs.loadSpoon("MiroWindowsManager")

-- hs.window.animationDuration = 0.3

-- spoon.MiroWindowsManager.sizes = {2, 4, 1/4}
-- spoon.MiroWindowsManager.fullScreenSizes = { 1, 4/3, 5/3 }

-- spoon.MiroWindowsManager:bindHotkeys({
--   up = {hyper, "up"},
--   right = {hyper, "right"},
--   down = {hyper, "down"},
--   left = {hyper, "left"},
--   fullscreen = {hyper, "f"}
-- })

hs.loadSpoon("ArrangeDesktop")
spoon.ArrangeDesktop.arrangements = {
  ['meeting'] = {
    ['4437B80B-A8EB-FF21-2C65-708DD0826E27'] = {
      ['Montior Name'] = 'Built-in Retina Display',
      ['apps'] = {
          ['Google Meet'] = { w = 1440.0, h = 877.0, x = 0.0, y = 23.0 }
      }
    },
    ['6A51107B-66F6-092A-6DAD-7A30E813CAE9'] = {
      ['Montior Name'] = 'OMEN by HP 32',
      ['apps'] = {
          ['Mail'] = { w = 1706.0, h = 708.0, x = -970.0, y = -1417.0 },
          ['Calendar'] = { w = 1706.0, h = 708.0, x = -970.0, y = -709.0 },
          ['Slack'] = { w = 853.0, h = 826.0, x = -1823.0, y = -1417.0 }
      }
    }
  },
  ['VsCodeDev'] = {
    ['4437B80B-A8EB-FF21-2C65-708DD0826E27'] = {
        ['Montior Name'] = 'Built-in Retina Display',
        ['apps'] = {
            ['Activity Monitor'] = { w = 1440.0, h = 877.0, x = 0.0, y = 23.0 },
            ['Mail'] = { w = 1440.0, h = 877.0, x = 0.0, y = 23.0 },
            ['Calendar'] = { w = 1440.0, h = 877.0, x = -0.0, y = 23.0 }
        },
    },
    ['6A51107B-66F6-092A-6DAD-7A30E813CAE9'] = {
        ['Montior Name'] = 'OMEN by HP 32',
        ['apps'] = {
            ['Google Chrome'] = { w = 1706.0, h = 944.0, x = -970.0, y = -1417.0 },
            ['Activity Monitor'] = { w = 1440.0, h = 877.0, x = 0.0, y = 23.0 },
            ['Slack'] = { w = 853.0, h = 944.0, x = -1823.0, y = -944.0 },
            ['ErgoDox EZ Configurator'] = { w = 853.0, h = 472.0, x = -1823.0, y = -1417.0 }
        },
    },
    ['5DA606C1-7A06-7DFE-6F9E-103B873D7ED1'] = {
        ['Montior Name'] = 'OMEN by HP 32',
        ['apps'] = {
            ['iTerm2'] = { w = 853.0, h = 896.0, x = 737.0, y = -1417.0 },
            ['Code'] = { w = 1706.0, h = 1344.0, x = 1590.0, y = -1417.0 }
        },
    },
  }
}

layoutMenuItems = spoon.ArrangeDesktop:addMenuItems()
layoutMenubar = hs.menubar.new()
layoutMenubar:setMenu(function () return layoutMenuItems end)
-- layoutMenubar:setTitle('layouts')
layoutMenubar:setIcon('~/.hammerspoon/layers-triple.png')
layoutMenubar:returnToMenuBar()

-- mb:setTooltip('Desktop Arrangments')

-- spoon.ArrangeDesktop:logCurrentArrangement()
-- spoon.ArrangeDesktop:arrange('meeting')

-- hs.loadSpoon("MouseFollowsFocus")
-- spoon.MouseFollowsFocus:start()

require("useful/logWindowInfo")
hs.fnutils.each(hs.window.allWindows(), logWinInfo)

-- local wf=hs.window.filter
-- hs.hotkey.bind(hyper, "h", wf.focusWest, nil, nil)
-- hs.hotkey.bind(hyper, "j", wf.focusNorth, nil, nil)
-- hs.hotkey.bind(hyper, "k", wf.focusSouth, nil, nil)
-- hs.hotkey.bind(hyper, "l", wf.focusEast, nil, nil)

local expose = hs.expose.new(nil,{})
hs.hotkey.bind(hyper,'e','Expose',function()expose:toggleShow()end)


-- hs.loadSpoon("Seal")
-- spoon.Seal:loadPlugins({"apps", "screencapture", "calc", "useractions"})


-- spoon.Seal.plugins.useractions.actions =
--  {
--     ["Search on MDN"] = {
--       url = "https://developer.mozilla.org/en-US/search?q=${query}",
--       icon = 'favicon',
--       keyword = "js",
-- 	  },
--     ["Search NPM"] = {
--       url = "https://www.npmjs.com/search?q=${query}",
--       icon = 'favicon',
--       keyword = "npm",
-- 	  },
-- 	  ["Search on Stack overflow"] = {
--       url = "https://stackoverflow.com/search?q=${query}",
--       icon = 'favicon',
--       keyword = "stack",
-- 	  },
--     ["Search on DuckduckGo"] = {
--       url = "http://duckduckgo.com/?q=${query}",
--       icon = 'favicon',
--       keyword = "d",
-- 	  }
--    }

-- -- spoon.Seal:bindHotkeys({ show = { {"ctrl"}, "space" } })
-- -- spoon.Seal:bindHotkeys({ toggle={{"alt"}, "Space"}})
-- spoon.Seal:start()


require('watcher')
require('position')


hs.application.enableSpotlightForNameSearches(true)



function getCurrentScreen()
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

function createSwitcher(screenId)
  wf_n = hs.window.filter.copy(wf):setScreens(screenId)
  return hs.window.switcher.new(wf_n)
end

local ws1 = {}
local currentScreenUUID = ''

function nextWindow() 
  if currentScreenUUID ~= getCurrentScreen() then
    currentScreenUUID = getCurrentScreen()
    ws1 = createSwitcher(currentScreenUUID)
  end
  ws1:next()
end

hs.hotkey.bind(hyper,'tab','Next window',nextWindow, nil, function() ws1:next() end)
hs.hotkey.bind(hyper,'9','Prev window',function() ws1:previous() end) -- , nil, function() ws1:previous() end)






function resetLayout()

local allScreens = hs.screen.allScreens()
-- if #allScreens == 3 then

	local laptopScreen = allScreens[1]
	local bigLtScreen =  allScreens[2]
	local bigRtScreen =  allScreens[3]
	local layoutsTop = hs.geometry.rect(0, 0, 1, 0.66)
	local layoutsRtLow = hs.geometry.rect(0.5, 0.5, 0.5, 0.5)

	local windowLayout = {
		{"Discord",	nil, laptopScreen, hs.layout.left75,	nil, nil},
		{"Mail",	nil, laptopScreen, hs.layout.right70,	nil, nil},
		{"Calendar",	nil, laptopScreen, layoutsTop,		nil, nil},

		{"Slack",	nil, bigLtScreen,  hs.layout.left30,	nil, nil},

	--	{"Google Chrome",  "DOCs", bigRtScreen, hs.layout.right75, nil, nil},

		{"Postman",  	  nil, bigLtScreen, layoutsRtLow,  nil, nil},

		{"iTerm2",  	  nil, bigRtScreen, hs.layout.left50,  nil, nil},
		{"Code",   	  nil, bigRtScreen, hs.layout.right70,  nil, nil},
		{"IntelliJ IDEA", nil, bigRtScreen, hs.layout.right70,  nil, nil},


	}
	hs.layout.apply(windowLayout)

end
