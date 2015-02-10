--------------------------------------------
--	hero.lua
--------------------------------------------

local physics = require("physics")
local moving = 0
physics.start( )
local _W, _H = display.contentWidth, display.contentHeight

local function new(x, y, worldPhysics)
	physics = worldPhysics 

	local hero = display.newRect( x, y, 30, 30 )
	hero:setFillColor( 23/255, 155/255, 200/255 )
	physics.addBody( hero, 'dynamic', {density=1, friction=0.4, bounce=0.4})
	hero.isFixedRotation = true

	function hero:step()
		if moving ~= 0 then
			self:applyForce(10*moving, 0, self.x, self.y)
		end
	end

	local function fly(event)
		if event.phase == "began" then
			if event.x then
				hero:setLinearVelocity( 0,-300 )
				hero.y = hero.y - 100;
			end
		end
	end

	Runtime:addEventListener( 'touch', fly )

	return hero

end

return {
	new = new
}