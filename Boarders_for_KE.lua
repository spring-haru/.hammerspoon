-- Colors
-- https://gist.github.com/koekeishiya/dc48db74f4fdbfbf5648
blue = hs.drawing.color.blue
red = hs.drawing.color.red
green = hs.drawing.color.osx_green
yellow = hs.drawing.color.osx_yellow
firebrick = hs.drawing.color.x11.firebrick
purple = hs.drawing.color.x11.purple
sandybrown = hs.drawing.color.x11.sandybrown

-- Indicator function
function indicatorON(myColor)
	if border1 then
		border1:delete()
	end
	if border2 then
		border2:delete()
	end

	local Bstart1 = hs.geometry(0,20)
	local Bend1 = hs.geometry(1280,20)

	local Bstart2 = hs.geometry(0,792)
	local Bend2 = hs.geometry(1280,792)


	border1 = hs.drawing.line(Bstart1, Bend1)
	border2 = hs.drawing.line(Bstart2, Bend2)
	border1:setStrokeWidth(15)
	border2:setStrokeWidth(15)
	border1:setStrokeColor(myColor)
	border2:setStrokeColor(myColor)
	border1:setStroke(true)
	border2:setStroke(true)
	border1:show()
	border2:show()
end

-- Define the function to delete the Indicator
function indicatorOFF()
	if border1 then
		border1:delete()
	end
	if border2 then
		border2:delete()
	end
end


-- Red Boarders ON
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "1", function()
	indicatorON(red)
end)

-- Red Boarders OFF
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, '0', function()
	indicatorOFF(red)
end)


-- Blue Boarders ON
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"}, "2", function()
	indicatorON(blue)
end)

-- Blue Boarders OFF
hs.hotkey.bind({"ctrl","shift", "alt", "cmd"19}, '9', function()
	indicatorOFF(blue)
end)

-- Restart vim binding and erase the Indicator once focus moves
all_win = hs.window.filter.new(nil)
all_win:subscribe(hs.window.filter.windowUnfocused,function()
	indicatorOFF()
end)
