--- importing package
local canvas = require("hs.canvas")
local window = require("hs.window")

--- Empty borders
border1 = hs.canvas.new{x=0, y=0, h=1000, w=2000}:appendElements({
        type = "rectangle",
        action="skip"
        })

border2 = hs.canvas.new{x=0, y=0, h=1000, w=2000}:appendElements({
        type = "rectangle",
        action="skip"
        })


--- Red borders (normal mode)
redON = function()
    local win = window.focusedWindow()
    local screen = win:screen()
    local s = screen:frame()

    border1 = hs.canvas.new{x=s.x, y=s.y, h=s.h, w=s.w}:replaceElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {red=1.0},
        frame = {x=s.x, y=s.y, h=7, w=s.w}
        })

    border2 = hs.canvas.new{x=s.x, y=s.y, h=s.h, w=s.w}:replaceElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {red=1.0},
        frame = {x=s.x, y=s.h*0.99, h=7, w=s.w}
        })
end


--- Blue borders (visual mode)
blueON = function()
    local win = window.focusedWindow()
    local screen = win:screen()
    local s = screen:frame()

    border1 = hs.canvas.new{x=s.x, y=s.y, h=s.h, w=s.w}:replaceElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {blue=1.0},
        frame = {x=s.x, y=s.y, h=7, w=s.w}
        })

    border2 = hs.canvas.new{x=s.x, y=s.y, h=s.h, w=s.w}:replaceElements({
        type = "rectangle",
        action="strokeAndFill",
        strokeWidth=0.0001,
        fillColor= {blue=1.0},
        frame = {x=s.x, y=s.h*0.99, h=7, w=s.w}
        })
end


indicatorOFF = function()
    local win = window.focusedWindow()
    local screen = win:screen()
    local s = screen:frame()

    border1 = hs.canvas.new{x=s.x, y=s.y, h=s.h, w=s.w}:replaceElements({
       type = "segments",
       action="skip"
       })
    border2 = hs.canvas.new{x=s.x, y=s.y, h=8, w=s.w}:replaceElements({
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
