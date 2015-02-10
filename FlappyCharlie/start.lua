--------------------------------------------
--	start.lua
--------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
physics = require "physics"
physics.start()

local world
local _W, _H = display.contentWidth, display.contentHeight
local groundSettings = {density = 1, friction = 0.9, bounce = 0.2}

-- function
function game(event)
     if event.phase == "ended" then
        storyboard.gotoScene( "game" )
     end
end

--funtion to create scene game
function scene:createScene( event )

   world = display.newGroup()

   local sky = display.newRect(60, 240, 520, 570)
   sky:setFillColor(170/255, 255/255, 255/255)
   world:insert(sky)

   local ground1 = display.newRect(_W/2.5, _H+25, _W+65, 100)
   ground1:setFillColor(102/255, 204/255, 0/255)
   physics.addBody(ground1, 'static', groundSettings)
   world:insert(ground1)

end

-- function call it before the scene game goes on screen
function scene:willEnterScene( event )
        local sceneGroup = self.view
        playing = false
        lose = false
end

-- function call it after the scene game goes on screen
function scene:enterScene( event )
   local sceneGroup = self.view
    
end

-- function call it before the scene game goes off screen
function scene:exitScene( event )
        local sceneGroup = self.view

        if event.phase == "ended" then
        storyboard.gotoScene( "game" )
     end
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