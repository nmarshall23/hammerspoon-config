
local log = hs.logger.new('WindowInfo','debug')
local inspect = hs.inspect.inspect

function logWinInfo(window)
  log.df("window\n app: %s\n title: %s\n role: %s\n size: %s\n screen: %s",
    window:application():name(),
    window:title(),
    window:subrole(),
    window:size(),
    window:screen()
  )

end
