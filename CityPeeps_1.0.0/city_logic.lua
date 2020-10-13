------------------------------------------------------------------------
-- City class - container for districts and associated peeps
-- 'k2cp-city' entity as the representation of a city.
------------------------------------------------------------------------
City = {}

function City:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end
	
function City:init(i, n, e, m, pd, pm, sd, sm)
	self.state = {
		index = i,
		internal_name = n,
		user_name = "",
		entity = e,
		max_districts = m,
		districts = 0,
		passenger_divisor = pd,
		passenger_multiplier = pm,
		student_divisor = sd,
		student_multiplier = sm,
	}
end

function City:update(needs)
	if not (self.state.entity.valid) then return end
	local inventory = self.state.entity.get_inventory(1)

	local supply = true
	if inventory.is_empty() then
		supply = false
	else
		for _, v in ipairs(needs) do
			if inventory.get_item_count(v) - self.state.districts <= 0 then
				supply = false
			end
		end		
	end
	
	if supply then
		local student_count = math.floor(self.state.districts / self.state.student_divisor) * self.state.student_multiplier
		if (student_count > 0) then 
			if (inventory.can_insert({name="k2cp-student", count=student_count})) then 
				inventory.insert({name="k2cp-student", count=student_count})
			end
		end
		
		local passenger_count =  math.floor(self.state.districts / self.state.passenger_divisor) * self.state.passenger_multiplier
		if (passenger_count > 0) then 
			if (inventory.can_insert({name="k2cp-passenger", count=passenger_count})) then 
				inventory.insert({name="k2cp-passenger", count=passenger_count})
			end
		end

		if self.state.districts < self.state.max_districts then
			self.state.districts = self.state.districts + 1
		end
		
		for _, v in ipairs(needs) do
			local stack = {name=v, count=self.state.districts}
			inventory.remove(stack)
		end		
	else
		if self.state.districts >= 1 then
			self.state.districts = self.state.districts - 1
		end
	end
end
