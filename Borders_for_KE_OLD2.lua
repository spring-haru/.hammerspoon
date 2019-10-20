--- importing packages
local canvas = require("hs.canvas")
local window = require("hs.window")

--- Dummy borders
border1 = canvas.new{x=0, y=0, h=0, w=0}:appendElements({
        type = "rectangle",
        action="skip"
        })

border2 = canvas.new{x=0, y=0, h=0, w=0}:appendElements({
        type = "rectangle",
        action="skip"
        })


local border_width = 4

--- Red borders (normal mode)
redON = function()
    local win = window.focusedWindow()
    local screen = win:screen()
    local s = screen:frame()

    -- redefine border1
    border1 = canvas.new{x=s.x, y=s.y, h=s.h, w=s.w}:appendElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {red=1.0},
        frame = {x=s.x, y=s.y, h=border_width, w=s.w}
        })

    -- redefine border 2
    border2 = canvas.new{x=s.x, y=s.y, h=s.h, w=s.w}:appendElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {red=1.0},
        frame = {x=s.x, y=s.h*0.99, h=border_width, w=s.w}
        })
end


--- Blue borders (visual mode)
blueON = function()
    local win = window.focusedWindow()
    local screen = win:screen()
    local s = screen:frame()

    -- redefine border 1
    border1 = canvas.new{x=s.x, y=s.y, h=s.h, w=s.w}:appendElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {blue=1.0},
        frame = {x=s.x, y=s.y, h=border_width, w=s.w}
        })

    -- redefine border 2
    border2 = canvas.new{x=s.x, y=s.y, h=s.h, w=s.w}:appendElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {blue=1.0},
        frame = {x=s.x, y=s.h*0.99, h=border_width, w=s.w}
        })
end


indicatorOFF = function()
    local win = window.focusedWindow()
    local screen = win:screen()
    local s = screen:frame()

    -- redefine border 1
    border1 = canvas.new{x=s.x, y=s.y, h=border_width, w=s.w}:appendElements({
       type = "segments",
       action="skip"
       })

    -- redefine border 2
    border2 = canvas.new{x=s.x, y=s.y, h=border_width, w=s.w}:appendElements({
       type = "segments",
       action="skip"
       })
end


-- Red Boarders ON
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "1", function()
    border1:delete()
    border2:delete()
    redON()
    border1:show()
    border2:show()
end)


-- Red Boarders OFF
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, '0', function()
    border1:delete()
    border2:delete()
    indicatorOFF()
    border1:show()
    border2:show()
end)


-- Blue Boarders ON
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "2", function()
    border1:delete()
    border2:delete()
    blueON()
    border1:show()
    border2:show()
end)


-- Blue Boarders OFF
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "9", function()
    border1:delete()
    border2:delete()
    indicatorOFF()
    border1:show()
    border2:show()
end)
