data:extend({
  -- Farm
  {
    type = "assembling-machine",
    name = "k2cp-biofarm",
    icon = "__CityPeeps__/graphics/icons/farm.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-biofarm"},
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
	fluid_boxes =
    {
		{
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,        
		pipe_connections = {{ type="input", position = {0, 5} }}
		},
        off_when_no_fluid_recipe = true	  
    },

	collision_box = {{-4.2, -4.2}, {4.2, 4.2}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},

	animation =
	{
		filename = "__CityPeeps__/graphics/entities/biofarm_i.png",
		priority = "high",
		width = 320,
		height = 320,
		frame_count = 1,
		shift = {0.75, 0},
	},
	
	working_visualisations =
	{

		animation =
		{
			filename = "__Bio_Industries__/graphics/entities/biofarm_w.png",
			priority = "high",
			width = 320,
			height = 320,
			frame_count = 1,
			shift = {0.75, 0},
		},
	},

    fast_replaceable_group = "k2cp-farm",
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    crafting_categories = {"k2cp-crops"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 2.5
    },
    energy_usage = "600kW",
    ingredient_count = 6
  },

  -- Field
  {
    type = "assembling-machine",
    name = "k2cp-field",
    icon = "__CityPeeps__/graphics/icons/seed.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-field"},
    max_health = 650,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
	fluid_boxes =
    {
		{
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,        
		pipe_connections = {{ type="input", position = {0, 5} }}
		},
        off_when_no_fluid_recipe = true	  
    },

	collision_box = {{-4.2, -4.2}, {4.2, 4.2}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},

	animation =
	{
		filename = "__CityPeeps__/graphics/entities/field.png",
		priority = "high",
		width = 420,
		height = 420,
		frame_count = 1,
		shift = {-0.5, 0},
	},
	fast_replaceable_group = "k2cp-field",
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    crafting_categories = {"k2cp-crops"},
    crafting_speed = 0.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 2.5
    },
    energy_usage = "1kW",
    ingredient_count = 2
  },
  
  -- Data Center
  {
    type = "assembling-machine",
    name = "k2cp-datacenter",
    icon = "__CityPeeps__/graphics/icons/datacenter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-datacenter"},
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },

	collision_box = {{-2.1, -2.1}, {2.1, 2.1}},
	selection_box = {{-2.3, -2.3}, {2.3, 2.3}},

	animation =
	{
		filename = "__CityPeeps__/graphics/entities/datacenter.png",
		priority = "high",
		width = 204,
		height = 204,
		frame_count = 1,
		scale = 1
	},
	
    fast_replaceable_group = "k2cp-datacenter",
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    crafting_categories = {"k2cp-exports"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "160kW",
    ingredient_count = 6
  },

  -- Academy
  {
    type = "assembling-machine",
    name = "k2cp-academy",
    icon = "__CityPeeps__/graphics/icons/academy.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-academy"},
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
	collision_box = {{-2.2, -3.4}, {2.2, 3.4}},
	selection_box = {{-2.3, -3.5}, {2.3, 3.5}},
	animation =
	{
		filename = "__CityPeeps__/graphics/entities/academy.png",
		priority = "high",
		width = 204,
		height = 204,
		frame_count = 1,
		scale = 1.1
	},
	
    fast_replaceable_group = "k2cp-academy",
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    crafting_categories = {"k2cp-academy-products"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "160kW",
    ingredient_count = 2
  }
})

-- Academy Upgrade MK2
local ent
ent = util.table.deepcopy(data.raw["assembling-machine"]["k2cp-academy"])
ent.name = "k2cp-academy-mk2"
ent.max_health = 1200
ent.crafting_speed = 2,
data:extend({ent})

-- City Center
ent = util.table.deepcopy(data.raw["logistic-container"]["logistic-chest-requester"])
ent.name = "k2cp-city"
ent.minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-city"}
ent.max_health = 400
ent.collision_box = {{-2.2, -3.4}, {2.2, 3.4}}
ent.selection_box = {{-2.3, -3.5}, {2.3, 3.5}}
ent.icon = "__CityPeeps__/graphics/icons/city.png"
ent.icon_size = 64
ent.animation =
	{
	  filename = "__CityPeeps__/graphics/entities/city.png",
	  width = 228,
	  height = 228,
	  scale = 1,
	  shift = {0, 0}
	}
ent.inventory_size = 60
ent.order = "c"
ent.next_upgrade = "k2cp-city-mk2"
data:extend({ent})

-- City Center Uprade MK2
ent = util.table.deepcopy(data.raw["logistic-container"]["k2cp-city"])
ent.name = "k2cp-city-mk2"
ent.inventory_size = 120
ent.max_health = 2400
ent.order = "d"
ent.next_upgrade = nil
data:extend({ent})

-- Resort
ent = util.table.deepcopy(data.raw["logistic-container"]["logistic-chest-requester"])
ent.name = "k2cp-resort"
ent.minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-resort"}
ent.max_health = 1200
ent.collision_box = {{-2.4, -3.4}, {2.4, 3.4}}
ent.selection_box = {{-2.5, -3.5}, {2.5, 3.5}}
ent.icon = "__CityPeeps__/graphics/icons/resort.png"
ent.icon_size = 32
ent.animation =
	{
	  filename = "__CityPeeps__/graphics/entities/resort.png",
	  width = 214,
	  height = 214,
	  shift = {0, 0}
	}
ent.inventory_size = 24
ent.order = "g"
ent.next_upgrade = "k2cp-resort-mk2"
data:extend({ent})

-- Resort Upgrade MK2
ent = util.table.deepcopy(data.raw["logistic-container"]["k2cp-resort"])
ent.name = "k2cp-resort-mk2"
ent.inventory_size = 48
ent.max_health = 2400
ent.order = "h"
ent.next_upgrade = nil
data:extend({ent})

-- Trade Hub
ent = util.table.deepcopy(data.raw["logistic-container"]["logistic-chest-requester"])
ent.name = "k2cp-tradehub"
ent.minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-tradehub"}
ent.max_health = 1200
ent.corpse = "big-remnants"
ent.collision_box = {{-3.0, -3.4}, {3.0, 3.4}}
ent.selection_box = {{-3.1, -3.5}, {3.1, 3.5}}
ent.icon = "__CityPeeps__/graphics/icons/tradehub.png"
ent.icon_size = 32
ent.animation = 
	{
	  filename = "__CityPeeps__/graphics/entities/tradehub.png",
	  width = 208,
	  height = 208,
	  scale = 1.2,
	  shift = {0, 0}
	}
ent.inventory_size = 60
ent.order = "e"
data:extend({ent})

-- Passenger Wagon
ent = util.table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
ent.name = "k2cp-passenger-wagon"
ent.minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-passenger-wagon"}
ent.inventory_size = 8
ent.color = {r = 0.43, g = 0.23, b = 0.75, a = 0.5}
data:extend({ent})

ent = util.table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
ent.name = "k2cp-passenger-wagon-mk2"
ent.minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-passenger-wagon-mk2"}
ent.inventory_size = 16
ent.color = {r = 0.43, g = 0.23, b = 0.75, a = 0.5}
data:extend({ent})

-- Student Wagon
ent = util.table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
ent.name = "k2cp-student-wagon"
ent.minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-student-wagon"}
ent.inventory_size = 8
ent.color = {r = 0.95, g = 0.1, b = 0.1, a = 0.5}
data:extend({ent})

ent = util.table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
ent.name = "k2cp-student-wagon-mk2"
ent.minable = {hardness = 0.2, mining_time = 0.5, result = "k2cp-student-wagon-mk2"}
ent.inventory_size = 16
ent.color = {r = 0.95, g = 0.1, b = 0.1, a = 0.5}
data:extend({ent})

ent = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
table.insert(ent.crafting_categories, "k2cp-buildings")
table.insert(ent.crafting_categories, "k2cp-products1")
table.insert(ent.crafting_categories, "k2cp-crates")
data:extend({ent})

ent = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"])
table.insert(ent.crafting_categories, "k2cp-buildings")
table.insert(ent.crafting_categories, "k2cp-products1")
table.insert(ent.crafting_categories, "k2cp-crates")
data:extend({ent})

ent = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
table.insert(ent.crafting_categories, "k2cp-buildings")
table.insert(ent.crafting_categories, "k2cp-products1")
table.insert(ent.crafting_categories, "k2cp-crates")
data:extend({ent})

ent = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
table.insert(ent.crafting_categories, "k2cp-products2")
data:extend({ent})

ent = util.table.deepcopy(data.raw["furnace"]["electric-furnace"])
table.insert(ent.crafting_categories, "k2cp-products3")
data:extend({ent})

