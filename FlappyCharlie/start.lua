--------------------------------------------
--	start.lua
--------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
physics = require "physics"
physics.start()

-- function
function game(event)
     if event.phase == "ended" then
        storyboard.gotoScene( "game" )
     end
end

--funtion to create scene game
function scene:createScene( event )
   local sceneGroup = self.view
   local text = display.newText("Hello World in this bitch\n", 160, 50, nil, 26)

   sceneGroup:insert(text)


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