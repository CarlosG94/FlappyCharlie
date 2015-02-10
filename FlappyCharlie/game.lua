--------------------------------------------
--	game.lua
--------------------------------------------
storyboard = require( "storyboard" )
scene = storyboard.newScene()
physics = require "physics"
block = require("block")
physics.start()
physics.setGravity(0, 9.8)
data = require("data")
Hero = require "Hero"
highscore = 0

local world, hero 
local _W, _H = display.contentWidth, display.contentHeight
local groundSettings = {density = 1, friction = 0.9, bounce = 0.2}
local transitionOptions = {
	effect = "slideRight",
	time = 400
}

physics.setDrawMode("Hybrid")

local function moveSquare( event )
	block1:move()
	block1:setColor()
	block2:move()
	block2:setColor()
end


--funtion to create scene game
function scene:createScene( event )
   local sceneGroup = self.view

   world = display.newGroup()

   local hero = Hero.new(100, 100, physics)
   world:insert(hero)


end

local function step(event)
   		--hero:step(event)
end

-- function call it before the scence goes on screen
function scene:willEnterScene( event )
        local sceneGroup = self.view
        playing = false
        lose = false
end

-- function call it after the scene game goes on screen
function scene:enterScene( event )
   local sceneGroup = self.view

    	Runtime:addEventListener("tap", moveSquare)

    	Runtime:addEventListener("enterFrame", step)
end

-- function call it before the scene game goes off screen
function scene:exitScene( event )
        local sceneGroup = self.view

        Runtime:removeEventListener("enterFrame", step)
end

-- function call it after the scene game goes off screen
function scene:didExitScene( event )
   local sceneGroup = self.view
    
end

--function to destroy the scene game
function scene:destroyScene( event )
   local sceneGroup = self.view
end



scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "didExitScene", scene )
scene:addEventListener( "destroyScene", scene )


return scene

