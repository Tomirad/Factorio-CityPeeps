------------------------------------------------------------------------
-- Hub class - a processor to export goods which generates export credit.
-- 'k2cp-tradehub' is the associated entity.
------------------------------------------------------------------------
Hub = {}

function Hub:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end
	
function Hub:init(e)
	self.state = {
		entity = e,
		exports = 0
	}
end

function Hub:update()
	self.state.exports = 0
	local inventory = self.state.entity.get_inventory(1)
	if inventory.is_empty() then return end

	local crate_count = inventory.get_item_count("k2cp-crate-export")
	if crate_count > 0 then
		inventory.remove{name="k2cp-crate-export", count=crate_count}
	end	

	local datacron_count = inventory.get_item_count("k2cp-datacron")
	if datacron_count > 0 then
		inventory.remove{name="k2cp-datacron", count=datacron_count}
	end	

	self.state.exports = crate_count + datacron_count
end
