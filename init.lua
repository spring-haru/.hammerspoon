--###### Highlighting for Karabiner-Elements ######
require("Boarders_for_KE")

--###### Resizing, moving and snapping Windows ######
require("Win_Management")

--###### Alert Messages ######
require("hs.alert")
--hs.alert.defaultStyle.atScreenEdge = 2
--hs.alert.defaultStyle.fillColor = { white = 0, alpha = 0.1 }
--hs.alert.defaultStyle.textSize = 15
--hs.alert.defaultStyle.strokeColor = { white = 1, alpha = 1 }
--hs.alert.defaultStyle.textColor = { white = 1, alpha = 1 }
--hs.alert.defaultStyle.textFont  = ".AppleSystemUIFont"

--##### Reload config #####
hs.hotkey.bind({"ctrl", "alt", "cmd"}, 'R', function()
  hs.reload()
end)
hs.alert.show("Config loaded")
