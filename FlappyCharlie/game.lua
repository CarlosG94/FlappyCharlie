--------------------------------------------
--	game.lua
--------------------------------------------
storyboard = require( "storyboard" )
scene = storyboard.newScene()
physics = require "physics"
physics.start()
physics.setGravity(0, 9.8)
data = require("data")
highscore = 0

local world 
local _W, _H = display.contentWidth, display.contentHeight
local transitionOptions = {
	effect = "slideRight",
	time = 400
}


--funtion to create scene game
function scene:createScene( event )
   local sceneGroup = self.view

   local bg = display.newRect(0, -45, 320, 570)
   bg.anchorX, bg.anchorY = 0, 0
   bg:setFillColor(170/255, 255/255, 255/255)
   local ground = display.newRect(0, 450, 320, 100)
   ground.anchorX, ground.anchorY = 0, 0
   ground:setFillColor(20/255, 123/255, 255/255)
   --x,y = display.contentCenterX, display.contentCenterY
   --background = display.newImageRect("bg.jpg" , display.viewableContentWidth + 50, display.viewableContentHeight + 100 )
   --background.x = x; background.y = y-45
   --sceneGroup:insert(background)
   local text = display.newText("Hello World in this bitch\n", 160, 50, nil, 26)
   sceneGroup:insert(text)

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

