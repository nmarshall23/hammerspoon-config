

-- function resetLayout()

-- local allScreens = hs.screen.allScreens()
-- -- if #allScreens == 3 then

-- 	local laptopScreen = allScreens[1]
-- 	local bigLtScreen =  allScreens[2]
-- 	local bigRtScreen =  allScreens[3]
-- 	local layoutsTop = hs.geometry.rect(0, 0, 1, 0.66)
-- 	local layoutsRtLow = hs.geometry.rect(0.5, 0.5, 0.5, 0.5)

-- 	local windowLayout = {
-- 		{"Discord",	nil, laptopScreen, hs.layout.left75,	nil, nil},
-- 		{"Mail",	nil, laptopScreen, hs.layout.right70,	nil, nil},
-- 		{"Calendar",	nil, laptopScreen, layoutsTop,		nil, nil},

-- 		{"Slack",	nil, bigLtScreen,  hs.layout.left30,	nil, nil},

-- 	--	{"Google Chrome",  "DOCs", bigRtScreen, hs.layout.right75, nil, nil},

-- 		{"Postman",  	  nil, bigLtScreen, layoutsRtLow,  nil, nil},

-- 		{"iTerm2",  	  nil, bigRtScreen, hs.layout.left50,  nil, nil},
-- 		{"Code",   	  nil, bigRtScreen, hs.layout.right70,  nil, nil},
-- 		{"IntelliJ IDEA", nil, bigRtScreen, hs.layout.right70,  nil, nil},


-- 	}
-- 	hs.layout.apply(windowLayout)

-- end
