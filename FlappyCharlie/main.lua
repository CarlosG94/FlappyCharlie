--------------------------------------------
--	main.lua
--------------------------------------------

display.setStatusBar( display.HiddenStatusBar )
data = require("data")

data.score = 0
local storyboard = require("storyboard")
storyboard.gotoScene( "game" )

local Block = require("Block")

local block1 = Block.new()
local block2 = Block.new()

block1:move()
block1:setColor()
block2:move()
block2:setColor()


