--------------------------------------------
--	death.lua
--------------------------------------------

local physics

function new (x, y, width, height, worldPhysics)
	physics = worldPhysics

	local death = display.newRect(x, y, width, height) 
	physics.addBody( death, "static", {isSensor = true} )
	death.type = "death"
	return death
end

return {
	new = new
}