ConfigLogger.i('Initializing - HyperTabWindow')
do

    local defaultWinFiter = hs.window.filter.new():setCurrentSpace(true)
    local screenFilters = {}

    local function updateScreens()
        screenFilters = {}

        ConfigLogger.i('Update screens')

        hs.fnutils.each(hs.screen.allScreens(), function(screen)
            local screenUUID = screen:getUUID()
            local filterForSceen =
                hs.window.filter.copy(defaultWinFiter):setScreens(screenUUID)
            ConfigLogger.i('screen %s', screenUUID)
            screenFilters[screenUUID] = hs.window.switcher.new(filterForSceen)
        end)
    end

    local scnWatcher = hs.screen.watcher.new(updateScreens)

    scnWatcher:start()
    updateScreens()

    local windowSwitcher = {}
    local currentScreenUUID = ''

    local function getCurrentScreen()
        local win = hs.window.frontmostWindow()
        local screenUUID = hs.screen.primaryScreen():getUUID()
        if win ~= nil then screenUUID = win:screen():getUUID() end
        -- log.i("Current ScreenId %s", screenId)
        return screenUUID
    end

    local function createSwitcher(screenId)
        local filterForSceen =
            hs.window.filter.copy(defaultWinFiter):setScreens(screenId)
        return hs.window.switcher.new(filterForSceen)
    end

    local function checkCurrentScreen()
        if currentScreenUUID ~= getCurrentScreen() then
            currentScreenUUID = getCurrentScreen()
            windowSwitcher = screenFilters[currentScreenUUID]
            -- windowSwitcher = createSwitcher(currentScreenUUID)
        end
    end

    local function nextFnWindow()
        checkCurrentScreen()
        windowSwitcher:next()
    end

    local function prevFnWindow()
        checkCurrentScreen()
        -- if windowSwitcher == nil then checkCurrentScreen() end
        windowSwitcher:previous()
    end

    hs.hotkey.bind(Hyper, 'tab', 'Next window', nextFnWindow, nil,
                   function() windowSwitcher:next() end)
    hs.hotkey.bind(Hyper, 'forwarddelete', 'Prev window', prevFnWindow) -- , nil, function() ws1:previous() end)

end
