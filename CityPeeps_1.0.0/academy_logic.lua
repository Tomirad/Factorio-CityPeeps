------------------------------------------------------------------------
-- Academy class - a processor to train students into officers.
-- 'k2cp-academy' is the associated entity.
------------------------------------------------------------------------
Academy = {}

function Academy:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end
	
function Academy:init(i, n, e)
	self.state = {
		index = i,
		internal_name = n,
		entity = e
	}
end
