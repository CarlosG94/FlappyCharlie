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
highscore = 0

local world 
local _W, _H = display.contentWidth, display.contentHeight
local groundSettings = {density = 1, friction = 0.9, bounce = 0.2}
local transitionOptions = {
	effect = "slideRight",
	time = 400
}

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

   local sky = display.newRect(60, 240, 520, 570)
   sky:setFillColor(170/255, 255/255, 255/255)
   physics.addBody(sky, 'static')
   world:insert(sky) 

   local ground1 = display.newRect(_W/2.5, _H+25, _W+65, 100)
   ground1:setFillColor(102/255, 204/255, 0/255)
   physics.addBody(ground1, 'static', groundSettings)
   world:insert(ground1)

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
    	Runtime:addEventListener("tap", moveSquare)
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

