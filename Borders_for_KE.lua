--- importing packages
local canvas = require("hs.canvas")
local window = require("hs.window")

--- Dummy borders
border = canvas.new{x=0, y=0, h=0, w=0}:appendElements({
        type = "rectangle",
        action="skip"
        },{
        type = "rectangle",
        action="skip"
        })


local border_width = 4

--- Red borders (normal mode)
redON = function()
    local win = window.focusedWindow()
    local screen = win:screen()
    local max = screen:frame()

    -- redefine border
    border = canvas.new{x=max.x, y=max.y, h=max.h, w=max.w}:appendElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {red=1.0},
        frame = {x=max.x, y=max.y-23, h=border_width, w=max.w}
        },{
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {red=1.0},
        frame = {x=max.x, y=max.h-border_width, h=border_width, w=max.w}
        })
end


--- Blue borders (visual mode)
blueON = function()
    local win = window.focusedWindow()
    local screen = win:screen()
    local max = screen:frame()

    -- redefine border
    border = canvas.new{x=max.x, y=max.y, h=max.h, w=max.w}:appendElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {blue=1.0},
        frame = {x=max.x, y=max.y-23, h=border_width, w=max.w}
        },{
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {blue=1.0},
        frame = {x=max.x, y=max.h-border_width, h=border_width, w=max.w}
        })
end


indicatorOFF = function()
    local win = window.focusedWindow()
    local screen = win:screen()
    local max = screen:frame()

    -- redefine border
    border = canvas.new{x=max.x, y=max.y, h=border_width, w=max.w}:appendElements({
       type = "segments",
       action="skip"
       },{
       type = "segments",
       action="skip"
       })
end


-- Red Boarders ON
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "1", function()
    border:delete()
    redON()
    border:show()
end)


-- Red Boarders OFF
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, '0', function()
    border:delete()
    indicatorOFF()
    border:show()
end)


-- Blue Boarders ON
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "2", function()
    border:delete()
    blueON()
    border:show()
end)


-- Blue Boarders OFF
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "9", function()
    border:delete()
    indicatorOFF()
    border:show()
end)
