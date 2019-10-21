-- Window Management

-- ###### Indicator ############################### {{{1
--- Dummy Border
indicatorWIN = hs.canvas.new{x=0, y=0, h=0, w=0}:appendElements({
                type = "rectangle",
                action="skip"
                })


--- Green Border On
indicatorWin_ON = function()
    local maxF = hs.screen.mainScreen():fullFrame()
    local f = hs.window.focusedWindow():frame()

    -- redefine indicatorWIN
    indicatorWIN = hs.canvas.new{x=maxF.x, y=maxF.y, h=maxF.h, w=maxF.w}:appendElements({
        type = "rectangle",
        action="stroke",
        strokeWidth=4.0,
        strokeColor= {green=1.0},
        frame = {x=f.x, y=f.y, h=f.h, w=f.w}
        })
end


--- Green Border OFF
indicatorWin_OFF = function()
    local maxF = hs.screen.mainScreen():fullFrame()
    local f = hs.window.focusedWindow():frame()

    -- redefine indicatorWIN
    indicatorWIN = hs.canvas.new{x=maxF.x, y=maxF.y, h=maxF.h, w=maxF.w}:appendElements({
        type = "rectangle",
        action="skip",
        })
end

-- }}}1

-- ###### Modal Key Setting ############################ {{{1
local winman = hs.hotkey.modal.new()

start_winman = hs.hotkey.bind({"ctrl"}, "w", function()
    winman:enter()
    indicatorWIN:delete()
    indicatorWin_ON()
    indicatorWIN:show()
    hs.alert.show(hs.application.frontmostApplication():title() .. "", 600)
end)

winman:bind({"ctrl"}, 'w', function()
    winman:exit()
    indicatorWIN:delete()
    indicatorWin_OFF()
    indicatorWIN:show()
    hs.alert.closeAll()
end)
-- }}}1

-- ###### Main Scripts  ################################ {{{1
-- Based on https://github.com/exark/dotfiles/blob/master/.hammerspoon/init.lua

-- Setup environment ----------------------------------- {{{2

-- No animation
hs.window.animationDuration = 0

-- Screen Management ----------------------------------- {{{3

-- Get list of screens and refresh that list whenever screens are plugged or unplugged:
--local screens = hs.screen.allScreens()
--local screenwatcher = hs.screen.watcher.new(function()
	--screens = hs.screen.allScreens()
--end)
--screenwatcher:start()

-- }}}3

-- }}}2

-- Functions ------------------------------------------- {{{2

-- Move a window a number of pixels in x and y
function nudge(xpos, ypos)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.x = f.x + xpos
	f.y = f.y + ypos
	win:setFrame(f)
end

-- Resize a window
function yank(xpixels, ypixels, wpixels, hpixels)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.x = f.x + xpixels
	f.y = f.y + ypixels
	f.w = f.w + wpixels
	f.h = f.h + hpixels
	win:setFrame(f)
end

-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
function push(x, y, w, h)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w*x)
	f.y = max.y + (max.h*y)
	f.w = max.w*w
	f.h = max.h*h
	win:setFrame(f)
end

-- Screen Management (Functions) --------------------------------- {{{3

-- Move to monitor x. Checks to make sure monitor exists, if not moves to last monitor that exists
--function moveToMonitor(x)
	--local win = hs.window.focusedWindow()
	--local newScreen = nil
	--while not newScreen do
		--newScreen = screens[x]
		--x = x-1
	--end

	--win:moveToScreen(newScreen)
--end

-- }}}3

-- }}}2

-- Keys ------------------------------------------------- {{{2

-- Movement hotkeys {{{3
winman:bind({}, 'j', nil,
				   	 function() nudge(0,20) end,
					 function() nudge(0,20) end,
					 function() nudge(0,20) end
					 ) --down
winman:bind({}, "k", nil,
					function() nudge(0,-20) end,
					function() nudge(0,-20) end,
					function() nudge(0,-20) end
					)	--up
winman:bind({}, "l", nil,
					function() nudge(20,0) end,
					function() nudge(20,0) end,
					function() nudge(20,0) end
					)	--right
winman:bind({}, "h", nil,
					function() nudge(-20,0) end,
					function() nudge(-20,0) end,
					function() nudge(-20,0) end
					)	--left
-- }}}3

-- Resize hotkeys ---------------------------------------- {{{3
-- Enlarge --- {{{4
--
winman:bind({"ctrl", "shift"}, "h", nil, -- left longer
					function() yank(-20,0,20,0) end,
					function() yank(-20,0,20,0) end,
					function() yank(-20,0,20,0) end
					)

winman:bind({"ctrl", "shift"}, "l", nil, -- right longer
					function() yank(0,0,20,0) end,
					function() yank(0,0,20,0) end,
					function() yank(0,0,20,0) end
					)

winman:bind({"ctrl", "shift"}, "k", nil, -- top long
					function() yank(0,-20,0,20) end,
					function() yank(0,-20,0,20) end,
					function() yank(0,-20,0,20) end
					)

winman:bind({"ctrl", "shift"}, "j", nil, -- bottom long
					function() yank(0,0,0,20) end,
					function() yank(0,0,0,20) end,
					function() yank(0,0,0,20) end
					)
-- }}} 4

-- Shrink ----- {{{4
winman:bind({"cmd", "shift"}, "h", nil, -- left shorter
					function() yank(20,0,-20,0) end,
					function() yank(20,0,-20,0) end,
					function() yank(20,0,-20,0) end
					)

winman:bind({"cmd", "shift"}, "l", nil, -- right shorter
					function() yank(0,0,-20,0) end,
					function() yank(0,0,-20,0) end,
					function() yank(0,0,-20,0) end
					)

winman:bind({"cmd", "shift"}, "k", nil, -- top shorter
					function() yank(0,20,0,-20) end,
					function() yank(0,20,0,-20) end,
					function() yank(0,20,0,-20) end
					) -- yank top up
					
winman:bind({"cmd", "shift"}, "j", nil, -- bottom shorter
					function() yank(0,0,0,-20) end,
					function() yank(0,0,0,-20) end,
					function() yank(0,0,0,-20) end
					)
-- }}}4
-- }}}3

-- Push to screen edge
winman:bind({"alt", "shift"},"j", function()	push(0,0.5,1,0.5) end)	-- bottom half
winman:bind({"alt", "shift"},"k", function()	push(0,0,1,0.5) end) 		-- top half
winman:bind({"alt", "shift"},"l", function() push(0.5,0,0.5,1) end)	-- right side
winman:bind({"alt", "shift"},"h", function() push(0,0,0.5,1) end) 		-- left side

-- Center window with some room to see the desktop
winman:bind({"ctrl"}, "c", function() push(0.05,0.05,0.9,0.9) end)

-- Fullscreen
winman:bind({"ctrl"}, "f", function() push(0,0,1,1) end)

-- LaTeX (MacBook)
winman:bind({"ctrl"}, "t", function() push(0,0,0.83,1) end)

-- Chat windows (arrange in grid of 5 on right hand of screen)
--winman:bind(hyper, "1", function() push(0.8,0,0.2,0.2) end)
--winman:bind(hyper, "2", function() push(0.8,0.2,0.2,0.2) end)
--winman:bind(hyper, "3", function() push(0.8,0.4,0.2,0.2) end)
--winman:bind(hyper, "4", function() push(0.8,0.6,0.2,0.2) end)
--winman:bind(hyper, "5", function() push(0.8,0.8,0.2,0.2) end)

-- Screen Management (Keys) ----------------------------------- {{{3
-- Move a window between monitors
--winman:bind(pushkey,"1", function() moveToMonitor(1) end) -- Move to first monitor
--winman:bind(shiftpushkey,"1", function() 											 -- Move to first monitor and fullscreen
	--moveToMonitor(1)
	--push(0,0,1,1)
--end)
--winman:bind(pushkey,"2", function() moveToMonitor(2) end) -- Move to second monitor
--winman:bind(shiftpushkey,"2", function() 											 -- Move to second monitor and fullscreen
	--moveToMonitor(2)
	--push(0,0,1,1)
--end)

-- }}}3

-- }}}2

-- }}}1
