--------------------------------------------
--	hero.lua
--------------------------------------------

local physics = require("physics")
physics.start( )
local Power = 10
local _W, _H = display.contentWidth, display.contentHeight

local function new(x, y, worldPhysics, worldGroup)
	physics = worldPhysics 

	-------------create hero-------------
	local hero = display.newCircle( x, y, 20 )
	hero:setFillColor( 23/255, 155/255, 200/255 )
	physics.addBody( hero, 'dynamic', {density=1, friction=0.4, bounce=0.1, radius})
	hero.isFixedRotation = true

	function hero:step(event)
		if moving ~= 0 then
			self:applyForce(10*moving, 0, self.x, self.y)
		end
	end

	-------------fly function-------------
local function fly(event)
	if event.phase == "began" then
		if event.x then
			hero:setLinearVelocity( 0, -250 )
			hero.x = hero.x +10
			hero.y = hero.y - 1
		end
	end
end

	Runtime:addEventListener( 'touch', fly )

	return hero

end

return {
	new = new
}