hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.3

spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"}
})


hs.loadSpoon("Seal")
spoon.Seal:loadPlugins({"apps", "screencapture", "calc", "useractions"})

spoon.Seal.plugins.useractions.actions =
 {
    ["Hammerspoon docs webpage"] = {
      url = "http://hammerspoon.org/docs/",
      icon = hs.image.imageFromName(hs.image.systemImageNames.ApplicationIcon)
         -- hotkey = { hyper, "h" }
	  },
    ["Search on MDN"] = {
      url = "https://developer.mozilla.org/en-US/search?q=${query}",
      icon = 'favicon',
      keyword = "js",
	  },
    ["Search NPM"] = {
      url = "https://www.npmjs.com/search?q=${query}",
      icon = 'favicon',
      keyword = "npm",
	  },
	  ["Search on Stack overflow"] = {
      url = "https://stackoverflow.com/search?q=${query}",
      icon = 'favicon',
      keyword = "stack",
	  },
    ["Search on DuckduckGo"] = {
      url = "http://duckduckgo.com/?q=${query}",
      icon = 'favicon',
      keyword = "d",
	  }
   }

spoon.Seal:bindHotkeys({ show = { {"ctrl"}, "space" } })
-- spoon.Seal:bindHotkeys({ toggle={{"alt"}, "Space"}})
spoon.Seal:start()


require('watcher')
require('position')



hs.application.enableSpotlightForNameSearches(true)



allScreens = hs.screen.allScreens()

if #allScreens == 3 then

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
