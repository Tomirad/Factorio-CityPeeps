if (mods['aai-industry']) then
	
	local r = data.raw.recipe["k2cp-biofarm"]
	if (r) then
		table.remove(r.ingredients, 1)
		table.insert(r.ingredients, {"glass", 400})
	end
	
	r = data.raw.recipe["k2cp-equip"]
	if (r) then
		table.remove(r.ingredients, 4)
		table.insert(r.ingredients, {"glass", 10})
	end
	
	r = data.raw.recipe["k2cp-beer"]
	if (r) then
		table.remove(r.ingredients, 3)
		table.insert(r.ingredients, {"glass", 4})
	end
	
	r = data.raw.recipe["k2cp-wine"]
	if (r) then
		table.remove(r.ingredients, 2)
		table.insert(r.ingredients, {"glass", 4})
	end
	
	data.raw.recipe["k2cp-sand"]=nil
	data.raw.recipe["k2cp-glass"]=nil
	data.raw.item["k2cp-sand"]=nil
	data.raw.item["k2cp-glass"]=nil
end
