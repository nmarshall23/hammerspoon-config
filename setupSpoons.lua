-- loads spoons using SpoonInstall 
-- see https://www.hammerspoon.org/Spoons/SpoonInstall.html
local SpoonInstall = hs.loadSpoon("SpoonInstall")

-- SpoonInstall:andUse("",
--   {
--     config = {

--     },
--     hotkeys = {

--     },
--     disable = true,
--     start = true
--   }
-- )

SpoonInstall:andUse("ReloadConfiguration", {
    disable = true,
    start = true
})

SpoonInstall:andUse("MiroWindowsManager", {
    config = {
        --- For example `{2, 3, 3/2}` means that it can be 1/2, 1/3 and 2/3 of the total screen's size
        -- sizes = { 2, 8/5, 8/3 },
        sizes = {2, 3, 3 / 2},
        --- For example `{1, 4/3, 2}` means that it can be 1/1 (hence full screen), 3/4 and 1/2 of the total screen's size
        -- fullScreenSizes = {1, 8/5 }
        fullScreenSizes = {1, 4 / 3}
    },
    hotkeys = {
        up = {Hyper, "up"},
        right = {Hyper, "right"},
        down = {Hyper, "down"},
        left = {Hyper, "left"},
        fullscreen = {Hyper, "f"}
    }
})

SpoonInstall:andUse("ClipboardTool", {
    disable = false,
    config = {
        -- show_in_menubar = false,
        paste_on_select = true,
        hist_size = 15
    },
    hotkeys = {toggle_clipboard = {Hyper, "v"}},
    start = true
})

local arrangements = {
    ['meeting'] = {
        ['4437B80B-A8EB-FF21-2C65-708DD0826E27'] = {
            ['Montior Name'] = 'Built-in Retina Display',
            ['apps'] = {
                ['Google Meet'] = {w = 1440.0, h = 877.0, x = 0.0, y = 23.0}
            }
        },
        ['6A51107B-66F6-092A-6DAD-7A30E813CAE9'] = {
            ['Montior Name'] = 'OMEN by HP 32',
            ['apps'] = {
                ['Typora'] = {w = 853.0, h = 708.0, x = -2560.0, y = 731.0},
                ['Slack'] = {w = 853.0, h = 708.0, x = -2560.0, y = 23.0},
                ['Mail'] = {w = 1706.0, h = 708.0, x = -1707.0, y = 731.0},
                ['Calendar'] = {w = 1706.0, h = 708.0, x = -1707.0, y = 23.0}
            }
        }
    },
    ['VsCodeDev'] = {
        ['4437B80B-A8EB-FF21-2C65-708DD0826E27'] = {
            ['Montior Name'] = 'Built-in Retina Display',
            ['apps'] = {
                ['Activity Monitor'] = {
                    w = 1440.0,
                    h = 877.0,
                    x = 0.0,
                    y = 23.0
                },
                ['Mail'] = {w = 1440.0, h = 877.0, x = 0.0, y = 23.0},
                ['Calendar'] = {w = 1440.0, h = 877.0, x = -0.0, y = 23.0}
            }
        },
        ['6A51107B-66F6-092A-6DAD-7A30E813CAE9'] = {
            ['Montior Name'] = 'OMEN by HP 32',
            ['apps'] = {
                ['Google Chrome'] = {
                    w = 1706.0,
                    h = 944.0,
                    x = -970.0,
                    y = -1417.0
                },
                ['Activity Monitor'] = {
                    w = 1440.0,
                    h = 877.0,
                    x = 0.0,
                    y = 23.0
                },
                ['Slack'] = {w = 853.0, h = 944.0, x = -1823.0, y = -944.0},
                ['ErgoDox EZ Configurator'] = {
                    w = 853.0,
                    h = 472.0,
                    x = -1823.0,
                    y = -1417.0
                }
            }
        },
        ['5DA606C1-7A06-7DFE-6F9E-103B873D7ED1'] = {
            ['Montior Name'] = 'OMEN by HP 32',
            ['apps'] = {
                ['iTerm2'] = {w = 853.0, h = 896.0, x = 737.0, y = -1417.0},
                ['Code'] = {w = 1706.0, h = 1344.0, x = 1590.0, y = -1417.0}
            }
        }
    }
}

local function setupArrangeDesktopMenu(ArrangeDesktop)
    local layoutMenuItems = ArrangeDesktop:addMenuItems()
    local layoutMenubar = hs.menubar.new()
    layoutMenubar:setMenu(function() return layoutMenuItems end)
    -- layoutMenubar:setTitle('layouts')
    layoutMenubar:setIcon(AssetsDir .. 'layers-triple.png')
    -- layoutMenubar:returnToMenuBar()
end

SpoonInstall:andUse("ArrangeDesktop", {
    config = {
        arrangements = arrangements,
        logger = hs.logger.new('ArrangeDesktop', 'info')
    },
    fn = setupArrangeDesktopMenu
})

SpoonInstall:andUse("WindowScreenLeftAndRight", {
    hotkeys = {screen_left = {Hyper, "a"}, screen_right = {Hyper, "r"}}
})
