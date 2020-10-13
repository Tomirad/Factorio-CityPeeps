------------------------------------------------------------------------
-- Resort class - receives students from cities for credits/renown
-- 'k2cp-resort' is the associated entity.
------------------------------------------------------------------------
Resort = {}

function Resort:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end
	
function Resort:init(i, n, e, r)
	self.state = {
		index = i,
		internal_name = n,
		entity = e,
		revenue = r,
		passengers = 0,
		credits = 0
	}
end

function Resort:update()
	self.state.passengers = 0
	self.state.credits = 0
	local inventory = self.state.entity.get_inventory(1)
	if inventory.is_empty() then return end

	local student_count = inventory.get_item_count("k2cp-student")
	if student_count > 0 then
		inventory.remove{name="k2cp-student", count=student_count}
	end	

	passenger_count = inventory.get_item_count("k2cp-passenger")
	if passenger_count > 0 then
		inventory.remove{name="k2cp-passenger", count=passenger_count}
	end	
	
	self.state.passengers = student_count + passenger_count
	self.state.credits = self.state.passengers * self.state.revenue
end
