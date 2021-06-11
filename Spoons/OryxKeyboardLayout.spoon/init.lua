


local obj={}
obj.__index = obj

-- Metadata
obj.name = "OryxKeyboardLayout"
obj.version = "1.0"
obj.author = "Nicholas Marshall <nmarshall23@gmail.com>"
obj.homepage = "https://github.com/miromannino/miro-windows-management"
obj.license = "MIT - https://opensource.org/licenses/MIT"

--- OryxKeyboardLayout.appName
--- Variable
--- The name of the Chrome App for Oryx
obj.appName = "ErgoDox EZ Configurator"

--- OryxKeyboardLayout.
--- Variable
--- The name of the Chrome App for Oryx
obj.usbHints= { }



function obj:init()
  print("Initializing OryxKeyboardLayout")
  local keyboardWatcher = hs.usb.watcher.new(configureKeyboard)
  keyboardWatcher:start()
end

return obj