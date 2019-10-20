--###### Highlighting for Karabiner-Elements ######
require("Indicator_KE")

--###### Resizing, moving and snapping Windows ######
require("Win_Management")

--###### Alert Messages ######
require("hs.alert")

--##### Reload config #####
hs.hotkey.bind({"ctrl", "alt", "shift"}, 'R', function()
  hs.reload()
end)
hs.alert.show("Config loaded")
