local config = config.civ

-----------------------------------------------------------------------------------------
-- Civ Class - container for all high level mod variables pertaining to the civilization.
-----------------------------------------------------------------------------------------
Civ = {}

function Civ:init()
	self.state = {
		     update_interval = math.floor(GAMEDAY
		  * settings.startup["k2cp-update-interval"].value)             	, -- Time between city updates
		       max_districts = settings.startup["k2cp-max-districts"].value	, -- Max housing districts per city
		passenger_multiplier = config.passenger_multiplier                	, -- Passenger multipler
		   passenger_divisor = config.passenger_divisor	  				  	, -- Districs divided by this = passengers per cycle
		  student_multiplier = config.student_multiplier                  	, -- Passenger multipler
		     student_divisor = config.student_divisor	  					, -- Districs divided by this = students per cycle
		             revenue = config.starting_revenue	  					, -- Revenue per passenger delivered
		               tiers = config.tiers                               	, -- Status tiers and resultant status description
		            upgrades = config.upgrades							  	, -- Upgrades table
		               needs = config.needs                               	, -- Items needed to increase household count
		         needs_count = 1								          	, -- Count of needed items for the GUI
		        status_title = "-"                                        	, -- Status title from tiers array - based on score
		       status_renown = "-"                                        	, -- Status renown from tiers array - based on score
		               score = 0                                          	, -- Civilzation score - determines title and renown
		             tier_id = 0									      	, -- Current tier ID
		           next_tier = 0									      	, -- Next tier score for advancement
		                days = 0                                          	, -- Number of days that have passed in this game
		           districts = 0                                          	, -- Total districts in civ
		             exports = 0                                          	, -- Number of trade goods exported to the galaxy
		          passengers = 0									      	, -- Passengers transported to resorts for your civ
		             credits = 0						     		      	, -- Credit balance
		       academy_count = 0                                          	, -- Count of academies - tracks academies array
		           academies = {}                                         	, -- Array of instantiated city objects
		          city_count = 0                                          	, -- Count of cities - tracks cities array
		              cities = {}                                         	, -- Array of instantiated city objects
		          city_count = 0                                          	, -- Count of cities - tracks cities array
		             resorts = {}                                         	, -- Array of instantiated resort objects
		        resort_count = 0                                          	, -- Count of resorts - tracks resorts array
		                hubs = {}                                         	, -- Array of instantiated tradehub objects
			 upgrade_tracker = {}											, -- Tracks which upgrades have been applied to which entities
			    upgrade_flag = false										, -- Flag that keeps the upgrade replace from executing on_mined logic
		          main_frame = nil                                          ,
		           dtl_frame = nil                                          ,
  		           civ_frame = nil                                          ,
		          city_frame = nil                                          ,
		        resort_frame = nil                                          ,
		        credit_frame = nil                                          ,
		       upgrade_frame = nil											,
		    upgrade_dtl_flow = nil											,
	}

	-- Add in any "needs" crates selected in mod settings
	if (settings.startup["k2cp-require-crate-house"].value   ) then table.insert(self.state.needs,"k2cp-crate-house")    self.state.needs_count = self.state.needs_count + 1 end
	if (settings.startup["k2cp-require-crate-energy"].value  ) then table.insert(self.state.needs,"k2cp-crate-energy")   self.state.needs_count = self.state.needs_count + 1 end
	if (settings.startup["k2cp-require-crate-school"].value  ) then table.insert(self.state.needs,"k2cp-crate-school")   self.state.needs_count = self.state.needs_count + 1 end
	if (settings.startup["k2cp-require-crate-military"].value) then table.insert(self.state.needs,"k2cp-crate-military") self.state.needs_count = self.state.needs_count + 1 end
	if (settings.startup["k2cp-require-crate-medical"].value ) then table.insert(self.state.needs,"k2cp-crate-medical")  self.state.needs_count = self.state.needs_count + 1 end
	if (settings.startup["k2cp-require-crate-pleasure"].value) then table.insert(self.state.needs,"k2cp-crate-pleasure") self.state.needs_count = self.state.needs_count + 1 end
	
	-- Global cached gui elements for update speed
	global.day_label        	= nil
	global.districts_label  	= nil
	global.exports_label    	= nil
	global.status_label     	= nil
	global.renown_label     	= nil
	global.score_label      	= nil
	global.next_tier_label  	= nil
	global.credits_label    	= nil
	global.passenger_label  	= nil
	global.credit_textbox   	= nil
	global.interval_textbox 	= nil

	global.civ_state = self.state
end

function Civ:load()
	if global.civ_state ~= nil then
		self.state = global.civ_state
		for _, academy in pairs(self.state.academies) do
			setmetatable(academy, {__index = Academy})
		end
		for _, city in pairs(self.state.cities) do
			setmetatable(city, {__index = City})
		end
		for _, hub in pairs(self.state.hubs) do
			setmetatable(hub, {__index = Hub})
		end
		for _, resort in pairs(self.state.resorts) do
			setmetatable(resort, {__index = Resort})
		end
		if global.actions then
			script.on_event(defines.events.on_tick, on_tick)
		end
	end
end

function Civ:assist_player(event)
	if (settings.startup["k2cp-assist-mode"].value) then
		local player = game.players[event.player_index]
		if not (player and player.valid) then return end
		--/unlock-shortcut-bar

		-- Used primarily for play testing
		local box = game.surfaces[1].create_entity{name="steel-chest", position={x = 1, y = 0}, force=player.force}
		box.insert({name="iron-plate", count=400})
		box.insert({name="copper-plate", count=200})
		box.insert({name="steel-plate", count=200})
		box.insert({name="k2cp-leather", count=400})
		box.insert({name="k2cp-city", count=10})
		box.insert({name="k2cp-academy", count=20})
		box.insert({name="k2cp-tradehub", count=1})
		box.insert({name="k2cp-datacenter", count=1})
		box.insert({name="k2cp-resort", count=2})
		box.insert({name="k2cp-student", count=4})
		box.insert({name="k2cp-passenger", count=4})
		box.insert({name="k2cp-officer-1", count=2})
		box.insert({name="k2cp-crate-meals", count=4000})
		box.insert({name="k2cp-datacron", count=20000})
		box.insert({name="k2cp-coin", count=4000})
		box.insert({name="locomotive", count=2})
		box.insert({name="k2cp-passenger-wagon", count=1})
		box.insert({name="k2cp-student-wagon", count=1})
		box.insert({name="rail", count=100})
		box.insert({name="train-stop", count=2})
		self.state.credits = 10000
	end
end

-- Tick only processes two sets of logic:
--   The 'every GAMEDAY' day counter and
--   all the rest based on update_interval.
function Civ:tick(event)
	-- Daily update of day counter
	if event.tick % GAMEDAY == 0 then
		self.state.days = self.state.days + 1
	end

	if event.tick % self.state.update_interval == 0 then

		-- Process academies
		for index, academy in ipairs(self.state.academies) do
			if (academy.state.entity.valid) then
				-- no updates for academies - only tracked for upgrade purposes
			else
				table.remove(self.state.academies, index)
			end
		end

		-- Process cities and calculate household growth
		local districts = 0
		for index, city in ipairs(self.state.cities) do
			if (city.state.entity.valid) then
				city:update(self.state.needs)
				districts = districts + city.state.districts

				-- Update the dtl GUI for each city
				local city_dtl_flow = self.state.city_frame["k2cp_dtl_flow_" .. city.state.index]
				if (tonumber(city_dtl_flow.k2cp_dtl_info.k2cp_city_table.districts.caption) < city.state.districts) then
					city_dtl_flow.k2cp_dtl_info["happiness_sprite"].sprite = "happy_sprite"
					city_dtl_flow.k2cp_dtl_info["happiness_sprite"].tooltip = {"tooltip.k2cp-pop-rise"}
				elseif (city.state.districts == 0) then
					city_dtl_flow.k2cp_dtl_info["happiness_sprite"].sprite = "sleepy_sprite"
					city_dtl_flow.k2cp_dtl_info["happiness_sprite"].tooltip = {"tooltip.k2cp-pop-neutral"}
				else
					city_dtl_flow.k2cp_dtl_info["happiness_sprite"].sprite = "sad_sprite"
					city_dtl_flow.k2cp_dtl_info["happiness_sprite"].tooltip = {"tooltip.k2cp-pop-fall"}
				end
				city_dtl_flow.k2cp_dtl_info.k2cp_city_table.districts.caption = city.state.districts

				local inventory = city.state.entity.get_inventory(1)
				for _, need in ipairs(self.state.needs) do
					local needs_sprite = need.."_sprite"
					city_dtl_flow.k2cp_needs_flow.k2cp_needs_table[needs_sprite].number = inventory.get_item_count(need)
				end
			else
				-- If the city entity is invalid (probably destroyed) remove the dtl GUI info and array element.
				local city_dtl_flow = self.state.city_frame["k2cp_dtl_flow_" .. city.state.index]
				city_dtl_flow.destroy()
				table.remove(self.state.cities, index)
			end
		end
		self.state.districts = districts

		-- Process resorts
		if (self.state.student_multiplier > 0) then
			for index, resort in ipairs(self.state.resorts) do
				if (resort.state.entity.valid) then
					resort:update()
					self.state.passengers = self.state.passengers + resort.state.passengers
					self.state.credits = self.state.credits + resort.state.credits
				else
					table.remove(self.state.resorts, index)
				end
			end
		end

		-- Process tradehubs and calculate exports
		for index, hub in ipairs(self.state.hubs) do
			if (hub.state.entity.valid) then
				hub:update()
				self.state.exports = self.state.exports + hub.state.exports
			else
				table.remove(self.state.hubs, index)
			end
		end

		-- Calculate overall score and resultant title/renown
		self.state.score = math.floor(self.state.exports / 10) + self.state.districts + self.state.passengers
		for _, tier in ipairs(self.state.tiers) do
			if (self.state.score >= tier.score) then
				if (self.state.tier_id < tier.id) then
					local message = tier.msg
					if (tier.reward_type == "i") then game.players[1].get_main_inventory().insert(tier.reward) end
					if (tier.reward_type == "r") then game.players[1].force.recipes[tier.reward].enabled = true end
					game.players[1].print(message)
					-- in case they skip over any of these tiers in one update cycle - force recipes enabled
					if (game.players[1].force.recipes["k2cp-datacron"].enabled    == false and tier.score >= config.tiers[4].score) then game.players[1].force.recipes["k2cp-datacron"].enabled    = true end
					if (game.players[1].force.recipes["k2cp-promotion-1"].enabled == false and tier.score >= config.tiers[3].score) then game.players[1].force.recipes["k2cp-promotion-1"].enabled = true end
					if (game.players[1].force.recipes["k2cp-promotion-2"].enabled == false and tier.score >= config.tiers[2].score) then game.players[1].force.recipes["k2cp-promotion-2"].enabled = true end
				end
				self.state.tier_id = tier.id
				self.state.status_title = tier.title
				self.state.status_renown = tier.renown
				break
			end
		end

		-- Display next "promotion" score
		for _, next_tier in ipairs(self.state.tiers) do
			if (next_tier.id - 1 == self.state.tier_id) then
				self.state.next_tier = next_tier.score
				break
			end
		end

		-- Update the main gui
		global.day_label.caption        	= self.state.days
		global.households_label.caption 	= self.state.districts * 100  -- Use basis of 1 for the districts, but multiply the display by 100 to make cities look like they have alot of peeps.
		global.exports_label.caption    	= self.state.exports
		global.status_label.caption     	= self.state.status_title
		global.renown_label.caption     	= self.state.status_renown
		global.score_label.caption      	= self.state.score
		global.next_tier_label.caption  	= self.state.next_tier
		global.credits_label.caption    	= self.state.credits
		global.passenger_label.caption  	= self.state.passengers
	end
end

function Civ:entity_built(event)
	-- performance bypass - only execute for k2cp entities
	if string.sub(event.created_entity.name,1,4) ~= "k2cp" then return end  

	-- Clear the udc flow if a CityPeeps entity is placed.
	-- Players can remove entities while the GUI is open leaving it in state flux otherwise
	-- Force a reselection of the available upgrade options
	if (self.state.upgrade_dtl_flow) then 
		self.state.upgrade_dtl_flow.destroy()
	end	

    local entity = event.created_entity
	if entity.name == "k2cp-city" then
		-- Check if another city is too close, else place the city
		local distance = settings.startup["k2cp-city-distance"].value
		if (Civ:tile_limit(entity,distance) > 1) then
			local item = entity.name
			local player = game.players[event.player_index]
			local inventory = player.get_main_inventory()
			inventory.insert({name = item, count = 1})
			inventory.sort_and_merge()
			entity.destroy()
			player.print({"message.k2cp-city-limit", distance})
		else
			self.state.city_count = self.state.city_count + 1
			local new_city = City:new()
			new_city:init(self.state.city_count
						, "k2cp-city"
			            , entity
						, self.state.max_districts
						, self.state.passenger_divisor
						, self.state.passenger_multiplier
						, self.state.student_divisor
						, self.state.student_multiplier)
			table.insert(self.state.cities, new_city)
			Civ:add_city_gui_dtl(self.state.city_frame, self.state.city_count)
			Civ:upgrade_tracking("add", new_city)
		end
	elseif entity.name == "k2cp-resort" then
		local distance = settings.startup["k2cp-resort-distance"].value
		if (Civ:tile_limit(entity,distance) > 0) then
			local item = entity.name
			local player = game.players[event.player_index]
			local inventory = player.get_main_inventory()
			inventory.insert({name = item, count = 1})
			inventory.sort_and_merge()
			entity.destroy()
			player.print({"message.k2cp-resort-limit", distance})
		else
			self.state.resort_count = self.state.resort_count + 1
			local new_resort = Resort:new()
			new_resort:init(self.state.resort_count, "k2cp-resort", entity, self.state.revenue)
			table.insert(self.state.resorts, new_resort)
			Civ:upgrade_tracking("add", new_resort)
		end
	elseif entity.name == "k2cp-tradehub" then
		local new_hub = Hub:new()
		new_hub:init(entity)
		table.insert(self.state.hubs, new_hub)
	elseif entity.name == "k2cp-academy" then
		self.state.academy_count = self.state.academy_count + 1
		local new_a = Academy:new()
		new_a:init(self.state.academy_count, "k2cp-academy", entity)
		table.insert(self.state.academies,  new_a)
		Civ:upgrade_tracking("add", new_a)
	elseif (string.sub(entity.name,1,20) == "k2cp-passenger-wagon") then
		local inventory = entity.get_inventory(defines.inventory.cargo_wagon)
		if (inventory) then
			for i=1, inventory.count_empty_stacks(true), 1 do
				inventory.set_filter(i,"k2cp-passenger")
			end
		end
	elseif (string.sub(entity.name,1,18) == "k2cp-student-wagon") then
		local inventory = entity.get_inventory(defines.inventory.cargo_wagon)
		if (inventory) then
			for i=1, inventory.count_empty_stacks(true), 1 do
				inventory.set_filter(i,"k2cp-student")
			end
		end
	end
end

-- Remove entities from their respective arrays when mined.
function Civ:entity_mined(event)
	-- Performance bypass - only execute for k2cp entities
	if string.sub(event.entity.name,1,4) ~= "k2cp" then return end  

	-- Clear the udc flow if a CityPeeps entity is placed.
	-- Players can remove entities while the GUI is open leaving it in state flux otherwise
	-- Force a reselection of the available upgrade options
	if self.state.upgrade_dtl_flow then 
		self.state.upgrade_dtl_flow.destroy()
	end
	
	-- Bypass the array removal if the entity is mined do to the upgrade 'replace' process
	if self.state.upgrade_flag then self.state.upgrade_flag = false return end  

	-- If an entity is mined by the player or robots, remove it from the array and refresh the gui
	-- If you change the city minable variable to true, then add city check here
	local entity = event.entity
	if (string.sub(entity.name,1,9) == "k2cp-city") then
		for index, city in ipairs(self.state.cities) do
			if (city.state.entity.unit_number == entity.unit_number) then
				Civ:upgrade_tracking("remove", city)
				table.remove(self.state.cities, index)
				local city_dtl_flow = self.state.city_frame["k2cp_dtl_flow_" .. city.state.index]
				city_dtl_flow.destroy()
				if (#self.state.cities == 0) then self.state.city_count = 0 end
				return
			end
		end
	elseif (string.sub(entity.name,1,11) == "k2cp-resort") then
		for index, resort in ipairs(self.state.resorts) do
			if (resort.state.entity.unit_number == entity.unit_number) then
				Civ:upgrade_tracking("remove", resort)
				table.remove(self.state.resorts, index)
				return
			end
		end
	elseif (string.sub(entity.name,1,13) == "k2cp-tradehub") then
		for index, hub in ipairs(self.state.hubs) do
			if (hub.state.entity.unit_number == entity.unit_number) then
				table.remove(self.state.hubs, index)
				return
			end
		end
	elseif (string.sub(entity.name,1,12) == "k2cp-academy") then
		for index, academy in ipairs(self.state.academies) do
			if (academy.state.entity.unit_number == entity.unit_number) then
				Civ:upgrade_tracking("remove", academy)
				table.remove(self.state.academies, index)
				return
			end
		end
	end	
end

function Civ:tile_limit(entity, r)
	return entity.surface.count_entities_filtered({name={"k2cp-city"}, position=entity.position, radius=r})
end

function Civ:transfer_credits(player, action)
	local amount = global.credit_textbox.text
	if (amount~=string.match(global.credit_textbox.text, '%d+')) then
		player.print({"message.k2cp-transfer-numeric"})
		return
	end
	amount = tonumber(amount)

	local inventory = player.get_main_inventory()
	if (action == "d") then
		local coin_count = inventory.get_item_count("k2cp-coin")
		if (coin_count >= amount) then
			inventory.remove{name="k2cp-coin", count=amount}
			self.state.credits = self.state.credits + amount
			player.print({"message.k2cp-transfer-success", amount})
			global.credits_label.caption = self.state.credits
		else
			player.print({"message.k2cp-transfer-insf", amount})
		end
	end
	if (action == "w") then
		if (self.state.credits >= amount) then
			inventory.insert({name = "k2cp-coin", count = amount})
			self.state.credits = self.state.credits - amount
			player.print({"message.k2cp-transfer-success", amount})
			global.credits_label.caption = self.state.credits
		else
			player.print({"message.k2cp-transfer-insf", amount})
		end
	end
end

-- Maintain master list of available upgrades
function Civ:upgrade_tracking(action, obj, track_id)
	-- If no counter exists in the tracker, add it once
	if (self.state.upgrade_tracker.count == nil) then self.state.upgrade_tracker.count = 1 end

	-- Called from on_entity_built, add the upgrade options for each entity added
	if (action == "add") then
		for _, upgrade in ipairs(self.state.upgrades) do
			if (upgrade.name == obj.state.internal_name) then
				local u = {}
				u.object = obj
				u.options = {}
				for index, opt in ipairs(upgrade.options) do
					local option = {
						track_id = self.state.upgrade_tracker.count,
						option = opt,
					}
					table.insert(u.options, option)
					self.state.upgrade_tracker.count = self.state.upgrade_tracker.count + 1
				end
				table.insert(self.state.upgrade_tracker, u)
			end
		end
	end

	-- Action "remove" is sent from the entity_mined and should remove entity level
	if (action == "remove") then
		local temp = {}
		for _, upgrade in ipairs(self.state.upgrade_tracker) do
			if not (upgrade.object.state.internal_name == obj.state.internal_name and upgrade.object.state.index == obj.state.index) then
				table.insert(temp, upgrade)
			end
		end
		self.state.upgrade_tracker = temp
	end
	
	-- Action "remove_opt" is sent after an upgrade is applied an should remove only that option from the entity
	if (action == "remove_opt") then
		local temp = {}
		for _, upgrade in ipairs(self.state.upgrade_tracker) do
			if (upgrade.object.state.internal_name == obj.state.internal_name and upgrade.object.state.index == obj.state.index) then
				local opt_count = 0
				local new_upgrade = upgrade
				local new_options = {}
				for _, option in ipairs(upgrade.options) do
					if not (option.track_id == track_id) then
						opt_count = opt_count + 1
						table.insert(new_options, option)
					end
				end
				if (opt_count > 0) then
					new_upgrade.options = new_options
					table.insert(temp, new_upgrade)
				end
			else
				table.insert(temp, upgrade)
			end
		end
		self.state.upgrade_tracker = temp
	end
end

function Civ:upgrade_object(player, name, i, t)

	local old_object	= ""
	local new_object	= ""
	local option		= ""
	local index			= tonumber(i)
	local track_id		= tonumber(t)

	for _, u in ipairs(self.state.upgrade_tracker) do
		if (u.object.state.internal_name == name and u.object.state.index == index) then
			old_object = u.object
			for _, o in ipairs(u.options) do
				if (o.track_id == track_id) then
					option = o.option
					new_object = o.option.object
					break
				end
			end
			break
		end
	end

	-- Process the option selected
	local upgrade_state = "none"
	if (option) then
		if (option.cost > self.state.credits) then 
			upgrade_state = "cost"
		else
			if (option.type == "a") then
				if (old_object) then
					old_object.state[option.attr] = old_object.state[option.attr] + option.add_value
					self.state.credits = self.state.credits - option.cost
					global.credits_label.caption = self.state.credits
					Civ:upgrade_tracking("remove_opt", old_object, track_id)
					upgrade_state = "success"
				end
			elseif option.type == "e" then
				if (old_object.state.entity.valid) then
					self.state.upgrade_flag = true
					local new_entity = old_object.state.entity.surface.create_entity
						{ name=new_object
						, target=old_object.state.entity
						, position=old_object.state.entity.position
						, direction=old_object.state.entity.direction
						, force=old_object.state.entity.force
						, fast_replace=true
						, player=player
						, raise_built=false
						, create_build_effect_smoke=false
						, spawn_decorations=false
						}
					self.state.upgrade_flag = false
					old_object.state.entity = new_entity
					local inventory = player.get_main_inventory()
					inventory.remove({name = name, count = 1})
					self.state.credits = self.state.credits - option.cost
					global.credits_label.caption = self.state.credits
					Civ:upgrade_tracking("remove_opt", old_object, track_id)
					upgrade_state = "success"
				end
			end
		end
	end

	-- Refresh the upgrade dtl flow for the upgrade message
	if (self.state.upgrade_dtl_flow) then 
		self.state.upgrade_dtl_flow.destroy()
	end	
	
	-- Create the message label
	local k2cp_upgrade_dtl_flow=self.state.upgrade_frame.add{type="flow", name="k2cp_upgrade_dtl_flow", direction="vertical", style="cp_vertical_flow_style" }
		  k2cp_upgrade_dtl_flow.style.bottom_padding = 4
	local k2cp_udc_flow=k2cp_upgrade_dtl_flow.add{type="flow", name="k2cp_udc_flow", style="cp_horizontal_centered_flow_style" }
		  k2cp_udc_flow.style.horizontally_stretchable = true
		  k2cp_udc_flow.add{type="label", name="k2cp_udc_msg_label", caption="test", style="cp_label_left_style" }
	self.state.upgrade_dtl_flow = k2cp_upgrade_dtl_flow
	local msg = self.state.upgrade_dtl_flow.k2cp_udc_flow.k2cp_udc_msg_label

	-- Present the message
	if (upgrade_state == "none") then
		msg.caption = {"message.k2cp-upg-none"}
	elseif (upgrade_state == "cost") then
		msg.caption = {"message.k2cp-transfer-insf", option.cost}
	elseif (upgrade_state == "success") then
		msg.caption = {"message.k2cp-upg-success", option.cost}
	end
end

function Civ:debug(s)
	--log(serpent.block(table))
	if (config.debug_msg) then game.players[1].print(s)	end
end

------------------------------------------------------------------------
-- Player GUI
------------------------------------------------------------------------
function Civ:init_gui(event)
	local player=game.players[event.player_index]
	if not (player and player.valid) then return end

	-- Master Button and Day Counter
	local k2cp_main_table=player.gui.top.add{type="table", name="k2cp_main_table", style="cp_title_table", column_count=3}
	      k2cp_main_table.add{type="sprite-button", name="k2cp_dtl_toggle", sprite="item/k2cp-resort", tooltip={"tooltip.k2cp-main-title"}}
	      k2cp_main_table.add{type="label", caption={"caption.k2cp-day"}, style="frame_title"}
	      k2cp_main_table.add{type="label", name="k2cp_day", caption="0", style="frame_title"}

	-- dtl Frame
	local k2cp_dtl_frame=player.gui.screen.add{type="frame", name="k2cp_dtl_frame", visible=false, direction="vertical", style="frame_with_even_paddings"}
		  k2cp_dtl_frame.force_auto_center()
	local k2cp_title_flow=k2cp_dtl_frame.add{type="flow", name="k2cp_title_flow", }
	local k2cp_title_label=k2cp_title_flow.add{type="label", caption={"caption.k2cp-title"}, style="frame_title"}
	      k2cp_title_label.drag_target=k2cp_dtl_frame
	local k2cp_widget=k2cp_title_flow.add{type="empty-widget", name="k2cp_widget", style="draggable_space_header"}
	      k2cp_widget.style.vertically_stretchable=true
		  k2cp_widget.style.horizontally_stretchable=true
		  k2cp_widget.drag_target=k2cp_dtl_frame
	      k2cp_title_flow.add{type="sprite-button", style="frame_action_button", sprite="utility/close_white", name="k2cp_dtl_close"}

	-- Civilization Frame
	local k2cp_civ_frame=k2cp_dtl_frame.add{type="frame", name="k2cp_civ_frame", direction="vertical", style="inside_deep_frame_for_tabs"}
 		  k2cp_civ_frame.style.width = 540
	local k2cp_civ_topflow=k2cp_civ_frame.add{type="flow", name="k2cp_civ_topflow", style="cp_horizontal_flow_style"}
	      k2cp_civ_topflow.add{type="sprite", sprite="globe_sprite"}
	local k2cp_civ_table=k2cp_civ_topflow.add{type="table", name="k2cp_civ_table", style="cp_table_style", column_count=4}
	      k2cp_civ_table.add{type="label",                    caption={"caption.k2cp-status"},     style="cp_label_right_style",  tooltip={"tooltip.k2cp-status-desc"}}
	      k2cp_civ_table.add{type="label", name="status",     caption="",                          style="cp_label_left_style",   tooltip={"tooltip.k2cp-status-desc"}}
	      k2cp_civ_table.add{type="label",                    caption={"caption.k2cp-renown"},     style="cp_label_right_style",  tooltip={"tooltip.k2cp-status-desc"}}
	      k2cp_civ_table.add{type="label", name="renown",     caption="",                          style="cp_label_left_style",   tooltip={"tooltip.k2cp-status-desc"}}
	      k2cp_civ_table.add{type="label",                    caption={"caption.k2cp-score"},      style="cp_label_right_style",  tooltip={"tooltip.k2cp-score-desc"}}
	      k2cp_civ_table.add{type="label", name="score",      caption="0",                         style="cp_label_left_style",   tooltip={"tooltip.k2cp-score-desc"}}
	      k2cp_civ_table.add{type="label",                    caption={"caption.k2cp-next-tier"},  style="cp_label_right_style",  tooltip={"tooltip.k2cp-next-tier-desc"}}
	      k2cp_civ_table.add{type="label", name="next_tier",  caption="",                          style="cp_label_left_style",   tooltip={"tooltip.k2cp-next-tier-desc"}}
	      k2cp_civ_table.add{type="label",                    caption={"caption.k2cp-exports"},    style="cp_label_right_style",  tooltip={"tooltip.k2cp-exports-desc"}}
	      k2cp_civ_table.add{type="label", name="exports",    caption="0",                         style="cp_label_left_style",   tooltip={"tooltip.k2cp-exports-desc"}}
	      k2cp_civ_table.add{type="label",                    caption={"caption.k2cp-households"}, style="cp_label_right_style",  tooltip={"tooltip.k2cp-total-housholds-desc"}}
	      k2cp_civ_table.add{type="label", name="households", caption="0",                         style="cp_label_left_style",   tooltip={"tooltip.k2cp-total-housholds-desc"}}
	      k2cp_civ_table.add{type="label",                    caption={"caption.k2cp-credits"},    style="cp_label_right_style",  tooltip={"tooltip.k2cp-credits-desc"}}
	      k2cp_civ_table.add{type="label", name="credits",    caption="0",                         style="cp_label_left_style",   tooltip={"tooltip.k2cp-credits-desc"}}
	      k2cp_civ_table.add{type="label",                    caption={"caption.k2cp-passengers"}, style="cp_label_right_style",  tooltip={"tooltip.k2cp-passengers-transported-desc"}}
	      k2cp_civ_table.add{type="label", name="passengers", caption="0",                         style="cp_label_left_style",   tooltip={"tooltip.k2cp-passengers-transported-desc"}}	
	local k2cp_civ_bottom_flow=k2cp_civ_frame.add{type="flow", name="k2cp_civ_bottom_flow", style="cp_horizontal_centered_flow_style"}
	  	  k2cp_civ_bottom_flow.style.horizontally_stretchable=true
		  k2cp_civ_bottom_flow.style.bottom_padding = 4
	local k2cp_credit_button=k2cp_civ_bottom_flow.add{type="button", name="k2cp_credit_button", caption={"caption.k2cp-credit-button"}, tooltip={"tooltip.k2cp-credit-button-desc"}}
	local k2cp_upgrade_button=k2cp_civ_bottom_flow.add{type="button", name="k2cp_upgrade_button", caption={"caption.k2cp-upgrade-button"}, tooltip={"tooltip.k2cp-upgrade-button-desc"}}
	local k2cp_city_topflow=k2cp_civ_frame.add{type="flow", name="k2cp_city_topflow", direction="vertical", style="cp_vertical_flow_style"}

	-- Credit Transfer Frame
	local k2cp_credit_frame=k2cp_dtl_frame.add{type="frame", name="k2cp_credit_frame", direction="vertical", visible=false, style="inside_deep_frame_for_tabs"}
 		  k2cp_credit_frame.style.width = 540
	local k2cp_credit_content_flow=k2cp_credit_frame.add{type="flow", name="k2cp_credit_content_flow", style="cp_horizontal_flow_style" }
		  k2cp_credit_content_flow.style.bottom_padding = 8
		  k2cp_credit_content_flow.add{type="label", caption={"caption.k2cp-credit-amount"}, style="cp_label_right_style"}
	local k2cp_credit_textbox=k2cp_credit_content_flow.add{type="text-box", name="k2cp_credit_amount", style="cp_text_box_style", tooltip={"tooltip.k2cp-deposit-tb-desc"}}
		  k2cp_credit_content_flow.add{type="button", name="k2cp_deposit_button", caption="+", style="frame_action_button", tooltip={"tooltip.k2cp-deposit-desc"}}
		  k2cp_credit_content_flow.add{type="button", name="k2cp_withdraw_button", caption="-", style="frame_action_button", tooltip={"tooltip.k2cp-withdraw-desc"} }
	local k2cp_spacer_1=k2cp_credit_content_flow.add{type="flow", name="k2cp_spacer_1", style="cp_horizontal_flow_style" }
		  k2cp_spacer_1.style.horizontally_stretchable=true
	local k2cp_credit_back_button=k2cp_credit_content_flow.add{type="button", name="k2cp_credit_back_button", caption={"caption.k2cp-back"}, style="confirm_button"}
		  k2cp_credit_back_button.style.horizontal_align = "right"
		  k2cp_credit_back_button.style.width = 70
		  
	-- Easter egg:  Update interval setter
	local k2cp_interval_flow=k2cp_credit_frame.add{type="flow", name="k2cp_interval_flow", style="cp_horizontal_flow_style" }
		  k2cp_interval_flow.style.bottom_padding = 8
		  k2cp_interval_flow.add{type="label", caption={"caption.k2cp-interval"}, style="cp_label_right_style", tooltip={"tooltip.k2cp-interval-desc"} }
	local k2cp_interval_textbox=k2cp_interval_flow.add{type="text-box", name="k2cp_interval", text=self.state.update_interval, style="cp_text_box_style", tooltip={"tooltip.k2cp-interval-desc"} }
		  k2cp_interval_flow.add{type="button", name="k2cp_interval_button", caption="*", style="frame_action_button", tooltip={"tooltip.k2cp-interval-desc"} } 

	-- Upgrade Frame
	local k2cp_upgrade_frame=k2cp_dtl_frame.add{type="frame", name="k2cp_upgrade_frame", direction="vertical", visible=false, style="inside_deep_frame_for_tabs"}
 		  k2cp_upgrade_frame.style.width = 540
		  k2cp_upgrade_frame.style.bottom_padding = 4
	local k2cp_upgrade_warn_flow=k2cp_upgrade_frame.add{type="flow", name="k2cp_upgrade_warn_flow", style="cp_horizontal_centered_flow_style" }
		  k2cp_upgrade_warn_flow.style.bottom_padding = 4
	local k2cp_upgrade_warn_label=k2cp_upgrade_warn_flow.add{type="label", caption={"caption.k2cp-upgrade-warn-label"}, style="cp_label_left_style" }
		  k2cp_upgrade_warn_label.style.single_line = false
	local k2cp_upgrade_filter_flow=k2cp_upgrade_frame.add{type="flow", name="k2cp_upgrade_filter_flow", style="cp_horizontal_flow_style" }
		  k2cp_upgrade_filter_flow.style.bottom_padding = 4
		  k2cp_upgrade_filter_flow.add{type="label", caption={"caption.k2cp-upgrade-filter-label"}, style="cp_label_right_style" }
			for _, u in ipairs(self.state.upgrades) do
				k2cp_upgrade_filter_flow.add{type="sprite-button", name="k2cp_us_"..u.name, sprite=u.sprite, tooltip={u.tooltip} }
			end
	local k2cp_spacer_1=k2cp_upgrade_filter_flow.add{type="flow", name="k2cp_spacer_1", style="cp_horizontal_flow_style" }
		  k2cp_spacer_1.style.horizontally_stretchable=true
	local k2cp_upgrade_back_button = k2cp_upgrade_filter_flow.add{type="button", name="k2cp_upgrade_back_button", caption={"caption.k2cp-back"}, style="confirm_button"}
		  k2cp_upgrade_back_button.style.horizontal_align = "right"
		  k2cp_upgrade_back_button.style.width = 70
		  
	-- Set global GUI references
	global.day_label        		= k2cp_main_table.k2cp_day
	global.households_label 		= k2cp_civ_table.households
	global.exports_label    		= k2cp_civ_table.exports
	global.status_label     		= k2cp_civ_table.status
	global.renown_label     		= k2cp_civ_table.renown
	global.score_label      		= k2cp_civ_table.score
	global.next_tier_label  		= k2cp_civ_table.next_tier
	global.credits_label    		= k2cp_civ_table.credits
	global.passenger_label  		= k2cp_civ_table.passengers
	global.credit_textbox   		= k2cp_credit_textbox
	global.interval_textbox   		= k2cp_interval_textbox

	self.state.main_frame   		= k2cp_main_table
	self.state.dtl_frame 			= k2cp_dtl_frame
	self.state.civ_frame    		= k2cp_civ_frame
	self.state.city_frame   		= k2cp_city_topflow
	self.state.credit_frame 		= k2cp_credit_frame
	self.state.upgrade_frame		= k2cp_upgrade_frame
 end

-- Informational frame per city
function Civ:add_city_gui_dtl(frame, cityID)
	local k2cp_dtl_flow=frame.add{type="flow", name="k2cp_dtl_flow_" .. cityID, direction="vertical", style="cp_vertical_flow_style"}
	local k2cp_line_flow=k2cp_dtl_flow.add{type="flow", name="k2cp_line_flow", style="cp_horizontal_flow_style" }
		  k2cp_line_flow.add{type="line", direction="horizontal", style="cp_line_style"}
	local k2cp_dtl_info=k2cp_dtl_flow.add{type="flow", name="k2cp_dtl_info", style="cp_horizontal_flow_style"}
  		  k2cp_dtl_info.style.horizontally_stretchable=true
	      k2cp_dtl_info.add{type="sprite", name="happiness_sprite", sprite="sleepy_sprite", tooltip={"tooltip.k2cp-happy-sprite-desc"}}
	local k2cp_city_table=k2cp_dtl_info.add{type="table", name="k2cp_city_table", style="cp_table_style", column_count=4}
		  k2cp_city_table.add{type="label",                    caption={"caption.k2cp-city"},       style="cp_label_narrow_right_style"}
		  k2cp_city_table.add{type="label", name="cityID",     caption=cityID,                      style="cp_label_narrow_left_style"}
		  k2cp_city_table.add{type="label",                    caption={"caption.k2cp-districts"},  style="cp_label_narrow_right_style", tooltip={"tooltip.k2cp-districts-desc"}}
		  k2cp_city_table.add{type="label", name="districts",  caption="0",                         style="cp_label_narrow_left_style", tooltip={"tooltip.k2cp-districts-desc"}}
	local k2cp_spacer_1=k2cp_dtl_info.add{type="flow", name="k2cp_spacer_1", style="cp_horizontal_flow_style" }
		  k2cp_spacer_1.style.horizontally_stretchable=true
	local k2cp_city_find_button=k2cp_dtl_info.add{type="sprite-button", name="k2cp_goto_city_" .. cityID, sprite="item/k2cp-city", tooltip={"tooltip.k2cp-find-city-desc"}}
		  k2cp_city_find_button.style.horizontal_align = "right"
	local k2cp_needs_flow=k2cp_dtl_flow.add{type="flow", name="k2cp_needs_flow", style="cp_horizontal_flow_style"}
  		  k2cp_needs_flow.style.horizontally_stretchable=true
		  k2cp_needs_flow.style.bottom_padding = 4
	local k2cp_needs_table=k2cp_needs_flow.add{type="table", name="k2cp_needs_table", style="cp_table_needs_style", column_count=self.state.needs_count + 1}
		  k2cp_needs_table.add{type="label", caption={"caption.k2cp-needs"}, style="cp_label_narrow_right_style", tooltip={"tooltip.k2cp-needs-desc"}}
		  for _, need in ipairs(self.state.needs) do
		  	local tt="item-name."..need
		  	k2cp_needs_table.add{type="sprite-button", name=need.."_sprite", sprite="item/"..need, tooltip={tt}}
		  end
end

-- Generate 'available entities to upgrade' buttons based on filter button selected
function Civ:add_upgrade_gui_dtl(frame, name, sprite, tt)
	-- Refresh the dtl frame each time a filter is clicked
	if (frame.k2cp_upgrade_dtl_flow) then frame.k2cp_upgrade_dtl_flow.destroy() end	
	
	local k2cp_upgrade_dtl_flow=frame.add{type="flow", name="k2cp_upgrade_dtl_flow", direction="vertical", style="cp_vertical_flow_style" }
		  k2cp_upgrade_dtl_flow.style.bottom_padding = 4
	local k2cp_udc_flow=k2cp_upgrade_dtl_flow.add{type="flow", name="k2cp_udc_flow", style="cp_horizontal_flow_style" }
		  k2cp_udc_flow.style.vertical_align = "top"
	local k2cp_udc_scroll=k2cp_udc_flow.add{type="scroll-pane", name="k2cp_udc_scroll", direction="vertical" }
		  k2cp_udc_scroll.style.maximal_height = 500
	local entity_count = 0
	for _, u in ipairs(self.state.upgrade_tracker) do
		if (u.object.state.internal_name == name) then
			k2cp_udc_scroll.add{type="sprite-button", name="k2cp_udc_"..name.."*"..u.object.state.index, sprite=sprite, number=u.object.state.index, tooltip=tt}
			entity_count = entity_count + 1
		end
	end			
	if (entity_count == 0) then	k2cp_udc_flow.add{type="label", caption={"caption.k2cp-none"}, style="cp_label_left_style"}	end
	self.state.upgrade_dtl_flow = k2cp_upgrade_dtl_flow
end

-- Generate entity's upgrade options
function Civ:add_upgrade_gui_options(frame, name, id)
	-- Refresh the options frame each time an entity is clicked
	if (frame.k2cp_udc_flow.k2cp_option_flow) then frame.k2cp_udc_flow.k2cp_option_flow.destroy() end	
	local k2cp_option_flow=frame.k2cp_udc_flow.add{type="flow", name="k2cp_option_flow", direction="vertical", style="cp_vertical_flow_style" }
		  k2cp_option_flow.style.vertical_align = "top"
	for _, u in ipairs(self.state.upgrade_tracker) do
		if (u.object.state.internal_name == name and u.object.state.index == id) then
			for _, o in ipairs(u.options) do
				local flow_name = "k2cp_opt_flow_"..o.track_id
				local bttn_name = "k2cp_opt_"..name.."*"..id.."#"..o.track_id
				local bttn_name=k2cp_option_flow.add{type="button", name=bttn_name}
					  bttn_name.style.horizontally_stretchable=true
					  bttn_name.style.minimal_height = 56
					  bttn_name.style.vertical_align = "center"
					  bttn_name.style.bottom_margin = 2
				local flow_name=bttn_name.add{type="flow", name=flow_name, style="cp_horizontal_flow_style" }
					  flow_name.add{type="label", caption=id}
				local flow_table=flow_name.add{type="table", style="cp_table_style", column_count=4 }
					  flow_table.style.left_margin = 12
					  flow_table.add{type="label", caption="Attribute:" 		, style="cp_label_narrow_right_style"}
					  flow_table.add{type="label", caption=o.option.attr		, style="cp_label_left_style"}
					  flow_table.add{type="label", caption="Add Value:"			, style="cp_label_narrow_right_style"}
					  flow_table.add{type="label", caption=o.option.add_value	, style="cp_label_left_style"}
					  flow_table.add{type="label", caption="Credits:"			, style="cp_label_narrow_right_style"}
					  flow_table.add{type="label", caption=o.option.cost		, style="cp_label_left_style"}
			end
		end
	end
end

function Civ:on_gui_click(event)
	if (string.sub(event.element.name, 1, 4) ~= "k2cp") then return end

	local player = game.players[event.player_index]
	if not (player and player.valid)    	then return end
	if (self.state.dtl_frame  == nil)   	then return end
	if (self.state.credit_frame  == nil)	then return end
	if (self.state.upgrade_frame == nil)	then return end

	if (event.element.name == "k2cp_dtl_toggle")            then Civ:toggle_visibility(self.state.dtl_frame) 		return end		-- Main button toggle
	if (event.element.name == "k2cp_dtl_close")         	then self.state.dtl_frame.visible = false	    		return end		-- dtl frame close button
	if (event.element.name == "k2cp_credit_button")        	then Civ:toggle_visibility(self.state.civ_frame)
																 Civ:toggle_visibility(self.state.credit_frame) 	return end		-- Credit transfer button
	if (event.element.name == "k2cp_credit_back_button")	then self.state.credit_frame.visible = false
																 Civ:toggle_visibility(self.state.civ_frame)		return end		-- Credit transfer close button
	if (event.element.name == "k2cp_deposit_button")       	then Civ:transfer_credits(player, "d")           		return end		-- Credit deposit button
	if (event.element.name == "k2cp_withdraw_button")      	then Civ:transfer_credits(player, "w")					return end		-- Credit withdraw button
	if (event.element.name == "k2cp_upgrade_button")		then Civ:toggle_visibility(self.state.civ_frame)
																 Civ:toggle_visibility(self.state.upgrade_frame)	return end		-- Upgrade button

	-- Upgrade back button
	if (event.element.name == "k2cp_upgrade_back_button") then 
		self.state.upgrade_frame.visible = false
		Civ:toggle_visibility(self.state.civ_frame)
		if (self.state.upgrade_frame.k2cp_upgrade_dtl_flow) then 
			self.state.upgrade_frame.k2cp_upgrade_dtl_flow.destroy() 
		end	
		return
	end		
	
	-- Generate available upgradeable entity buttons
	if (string.sub(event.element.name, 1, 8) == "k2cp_us_") then
		Civ:add_upgrade_gui_dtl(self.state.upgrade_frame, string.sub(event.element.name, 9, -1), event.element.sprite, event.element.tooltip)
		return
	end

	-- Generate entity's upgrade option buttons
	if (string.sub(event.element.name, 1, 9) == "k2cp_udc_") then
		local position = string.find(event.element.name, "*")
		local name = string.sub(event.element.name, 10, position - 1)
		Civ:add_upgrade_gui_options(self.state.upgrade_dtl_flow, name, event.element.number)
		return
	end

	-- Execute the upgrade
	if (string.sub(event.element.name, 1, 9) == "k2cp_opt_") then
		local pos1 = string.find(event.element.name, "*")
		local pos2 = string.find(event.element.name, "#")
		local name = string.sub(event.element.name, 10, pos1 - 1)
		local id   = string.sub(event.element.name, pos1 + 1, pos2 - 1)
		local tid  = string.sub(event.element.name, pos2 + 1)
		Civ:upgrade_object(player, name, id, tid)
		return
	end

	-- Set the update interval
	if (event.element.name == "k2cp_interval_button") then
		local amount = global.interval_textbox.text
		if (amount~=string.match(global.interval_textbox.text, '%d+')) then
			player.print({"message.k2cp-interval-numeric"})
			return
		else
			amount = tonumber(amount)
			if (amount < 250) then amount = 250 end
			self.state.update_interval = amount
		end
		return
	end

	-- Setup the find city button gps link
	if (string.sub(event.element.name, 1, 15) == "k2cp_goto_city_") then
		local id = tonumber(string.sub(event.element.name, 16, -1))
		for _, city in ipairs(self.state.cities) do
			if (city.state.entity.valid) then
				if (city.state.index == id) then
					player.print("City "..id..": "..Civ:gps_link(city.state.entity))
					break
				end
			end
		end
	end
end

function Civ:toggle_visibility(frame)
	if (frame.visible) then	frame.visible = false else frame.visible = true	end
end

function Civ:gps_link(entity)
	return "[gps=" .. entity.position.x .. "," .. entity.position.y .. "," .. entity.surface.name .. "]"
end
