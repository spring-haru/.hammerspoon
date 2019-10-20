--- importing packages
local canvas = require("hs.canvas")
local window = require("hs.window")

--- ##### Settings for Borders ######################################## {{{1
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
normalON_border = function()
    border:delete()

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
    border:show()
end


--- Blue borders (visual mode)
visualON_border = function()
    border:delete()

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
    border:show()
end


indicatorOFF_border = function()
    border:delete()

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
    border:show()
end

-- }}}1

--- ##### Settings for Menu Item ###################################### {{{1
local imageHolder = canvas.new{x=0, y=0, h=16, w=16}

imageHolder[1] = {
    type = "rectangle",
    action="strokeAndFill",
    fillColor= {white=1.0},
    strokeColor = {white=1.0},
    frame = {x=0, y=0, h=16, w=16}
    }
local modeInsert = imageHolder:imageFromCanvas():setSize({w=16, h=16})

imageHolder[2] = {
    type = "rectangle",
    action="strokeAndFill",
    fillColor= {red=1.0},
    strokeColor = {red=1.0},
    frame = {x=0, y=0, h=16, w=16}
    }
local modeNormal = imageHolder:imageFromCanvas():setSize({w=16, h=16})

imageHolder[3] = {
    type = "rectangle",
    action="strokeAndFill",
    fillColor= {blue=1.0},
    strokeColor = {blue=1.0},
    frame = {x=0, y=0, h=16, w=16}
    }
local modeVisual = imageHolder:imageFromCanvas():setSize({w=16, h=16})

imageHolder = imageHolder:delete()


 -- Initial menu
myMenu = hs.menubar.new():setTitle("Initial"):setIcon(
    modeInsert, false
    )

normalON_menu = function()
    myMenu:removeFromMenuBar()
    myMenu = hs.menubar.new():setTitle("N"):setIcon(
        modeNormal, false)
    end


normalOFF_menu = function()
    myMenu:removeFromMenuBar()
    myMenu = hs.menubar.new():setTitle("I"):setIcon(
        modeInsert, false)
    end


visualON_menu = function()
    myMenu:removeFromMenuBar()
    myMenu = hs.menubar.new():setTitle("V"):setIcon(
        modeVisual, false)
    end


visualOFF_menu = function()
    myMenu:removeFromMenuBar()
    myMenu = hs.menubar.new():setTitle("I"):setIcon(
        modeInsert, false)
    end

-- }}}1

--- ##### Key Bindings ################################################ {{{1
-- Red Boarders ON
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "1", function()
    normalON_border()
    normalON_menu()
end)


-- Red Boarders OFF
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, '0', function()
    indicatorOFF_border()
    normalOFF_menu()
end)


-- Blue Boarders ON
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "2", function()
    visualON_border()
    visualON_menu()
end)


-- Blue Boarders OFF
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "9", function()
    indicatorOFF_border()
    visualOFF_menu()
end)

-- }}}1
