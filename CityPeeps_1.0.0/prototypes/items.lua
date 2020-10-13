data:extend({
  -- Custom GUI Sprites
  {
	type = "sprite",
	name = "citypeep_sprite",
	filename = "__CityPeeps__/graphics/icons/citypeep.png",
	priority = "extra-high",
	width = 48,
	height = 48,
	scale = 1
  },
  {
	type = "sprite",
	name = "globe_sprite",
	filename = "__CityPeeps__/graphics/icons/globe.png",
	priority = "extra-high",
	width = 64,
	height = 64,
	scale = 1
  },
  {
	type = "sprite",
	name = "sleepy_sprite",
	filename = "__CityPeeps__/graphics/icons/arrow-side.png",
	priority = "extra-high",
	width = 64,
	height = 64,
	scale = 0.5
  },
  {
	type = "sprite",
	name = "happy_sprite",
	filename = "__CityPeeps__/graphics/icons/arrow-up.png",
	priority = "extra-high",
	width = 64,
	height = 64,
	scale = 0.5
  },
  {
	type = "sprite",
	name = "sad_sprite",
	filename = "__CityPeeps__/graphics/icons/arrow-down.png",
	priority = "extra-high",
	width = 64,
	height = 64,
	scale = 0.5
  },
  
  -- Groups/Order
  {
    type = "item-group",
    name = "k2cp-citypeeps",
    order = "z",
    icon = "__CityPeeps__/graphics/icons/resort.png",
    icon_size = 64
  },

  -- Buildings (Assembler)
  {
    type = "item-subgroup",
    name = "k2cp-buildings",
    group = "k2cp-citypeeps",
    order = "a"
  },
  {
    type = "item",
    name = "k2cp-field",
    icon = "__CityPeeps__/graphics/icons/seed.png",
    icon_size = 32,
    subgroup = "k2cp-buildings",
    order = "a",
    place_result = "k2cp-field",
    stack_size = 10
  },
  {
    type = "item",
    name = "k2cp-biofarm",
    icon = "__CityPeeps__/graphics/icons/farm.png",
    icon_size = 32,
    subgroup = "k2cp-buildings",
    order = "b",
    place_result = "k2cp-biofarm",
    stack_size = 10
  },
  {
    type = "item",
    name = "k2cp-city",
	localised_description = {"item-description.k2cp-city", settings.startup["k2cp-city-distance"].value},
    icon = "__CityPeeps__/graphics/icons/city.png",
    icon_size = 64,
    subgroup = "k2cp-buildings",
    order = "c",
    place_result = "k2cp-city",
    stack_size = 10
  },
  {
    type = "item",
    name = "k2cp-city-mk2",
	localised_description = {"item-description.k2cp-city", settings.startup["k2cp-city-distance"].value},
    icon = "__CityPeeps__/graphics/icons/city.png",
    icon_size = 64,
    subgroup = "k2cp-buildings",
    order = "c",
    place_result = "k2cp-city-mk2",
    stack_size = 10
  },
  {
    type = "item",
    name = "k2cp-tradehub",
    icon = "__CityPeeps__/graphics/icons/tradehub.png",
    icon_size = 32,
    subgroup = "k2cp-buildings",
    order = "d",
    place_result = "k2cp-tradehub",
    stack_size = 10
  },
  {
    type = "item",
    name = "k2cp-datacenter",
    icon = "__CityPeeps__/graphics/icons/datacenter.png",
    icon_size = 32,
    subgroup = "k2cp-buildings",
    order = "e",
    place_result = "k2cp-datacenter",
    stack_size = 10
  },
  {
    type = "item",
    name = "k2cp-academy",
    icon = "__CityPeeps__/graphics/icons/academy.png",
    icon_size = 64,
    subgroup = "k2cp-buildings",
    order = "f",
    place_result = "k2cp-academy",
    stack_size = 10
  },
  {
    type = "item",
    name = "k2cp-academy-mk2",
    icon = "__CityPeeps__/graphics/icons/academy.png",
    icon_size = 64,
    subgroup = "k2cp-buildings",
    order = "f",
    place_result = "k2cp-academy-mk2",
    stack_size = 10
  },
  {
    type = "item",
    name = "k2cp-resort",
	localised_description = {"item-description.k2cp-resort", settings.startup["k2cp-resort-distance"].value},
    icon = "__CityPeeps__/graphics/icons/resort.png",
    icon_size = 64,
    subgroup = "k2cp-buildings",
    order = "g",
    place_result = "k2cp-resort",
    stack_size = 10
  },
  {
    type = "item",
    name = "k2cp-resort-mk2",
    icon = "__CityPeeps__/graphics/icons/resort.png",
    icon_size = 64,
    subgroup = "k2cp-buildings",
    order = "g",
    place_result = "k2cp-resort-mk2",
    stack_size = 10
  },

  -- Products1 (Assembler)
  {
    type = "item-subgroup",
    name = "k2cp-products1",
    group = "k2cp-citypeeps",
    order = "b"
  },
  {
    type = "item",
    name = "k2cp-carbon",
    icon = "__CityPeeps__/graphics/icons/carbon.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "a",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-furniture",
    icon = "__CityPeeps__/graphics/icons/furn.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "b",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-tools",
    icon = "__CityPeeps__/graphics/icons/tools.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "c",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-sand",
    icon = "__CityPeeps__/graphics/icons/sand.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "c",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-clothes",
    icon = "__CityPeeps__/graphics/icons/clothes.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "e",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-phones",
    icon = "__CityPeeps__/graphics/icons/phone.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "f",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-shoes1",
    icon = "__CityPeeps__/graphics/icons/shoes1.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "g",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-shoes2",
    icon = "__CityPeeps__/graphics/icons/shoes2.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "g",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-backpack",
    icon = "__CityPeeps__/graphics/icons/backpack.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "h",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-vids",
    icon = "__CityPeeps__/graphics/icons/vids.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "i",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-firstaid",
    icon = "__CityPeeps__/graphics/icons/firstaid.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "i",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-medicine",
    icon = "__CityPeeps__/graphics/icons/medicine.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "i",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-equip",
    icon = "__CityPeeps__/graphics/icons/equip.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "i",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-ebook",
    icon = "__CityPeeps__/graphics/icons/ebook.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "i",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-games",
    icon = "__CityPeeps__/graphics/icons/games.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "i",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-school",
    icon = "__CityPeeps__/graphics/icons/school.png",
    icon_size = 32,
    subgroup = "k2cp-products1",
    order = "i",
    stack_size = 200
  },
  
  -- Products2 (Chemical Plant)
  {
    type = "item-subgroup",
    name = "k2cp-products2",
    group = "k2cp-citypeeps",
    order = "c"
  },
  {
    type = "item",
    name = "k2cp-fertilizer",
    icon = "__CityPeeps__/graphics/icons/fert.png",
    icon_size = 32,
    subgroup = "k2cp-products2",
    order = "a",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-beer",
    icon = "__CityPeeps__/graphics/icons/beer.png",
    icon_size = 32,
    subgroup = "k2cp-products2",
    order = "b",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-wine",
    icon = "__CityPeeps__/graphics/icons/wine.png",
    icon_size = 32,
    subgroup = "k2cp-products2",
    order = "c",
    stack_size = 200
  },
  {
    type = "item-with-entity-data",
    name = "k2cp-passenger-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
	tint = {r = 0.43, g = 0.23, b = 0.5, a = 0.5},
    subgroup = "k2cp-crates",
    order = "1",
    place_result = "k2cp-passenger-wagon",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "k2cp-student-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
	tint = {r = 0.95, g = 0.1, b = 0.1, a = 0.5},
    subgroup = "k2cp-crates",
    order = "2",
    place_result = "k2cp-student-wagon",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "k2cp-passenger-wagon-mk2",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
	tint = {r = 0.43, g = 0.23, b = 0.5, a = 0.5},
    subgroup = "k2cp-crates",
    order = "3",
    place_result = "k2cp-passenger-wagon-mk2",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "k2cp-student-wagon-mk2",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
	tint = {r = 0.95, g = 0.1, b = 0.1, a = 0.5},
    subgroup = "k2cp-crates",
    order = "4",
    place_result = "k2cp-student-wagon-mk2",
    stack_size = 5
  },

  -- Products3 (Furnace)
  {
    type = "item-subgroup",
    name = "k2cp-products3",
    group = "k2cp-citypeeps",
    order = "d"
  },
  {
    type = "item",
    name = "k2cp-bread",
    icon = "__CityPeeps__/graphics/icons/bread.png",
    icon_size = 32,
    subgroup = "k2cp-products3",
    order = "a",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-glass",
    icon = "__CityPeeps__/graphics/icons/glass.png",
    icon_size = 32,
    subgroup = "k2cp-products3",
    order = "b",
    stack_size = 200
  },

  -- Crops (Farms)
  {
    type = "item-subgroup",
    name = "k2cp-crops",
    group = "k2cp-citypeeps",
    order = "e"
  },
  {
    type = "item",
    name = "k2cp-wheat",
    icon = "__CityPeeps__/graphics/icons/wheat.png",
    icon_size = 32,
    subgroup = "k2cp-crops",
    order = "a",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-hops",
    icon = "__CityPeeps__/graphics/icons/hops.png",
    icon_size = 32,
    subgroup = "k2cp-crops",
    order = "b",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-veg",
    icon = "__CityPeeps__/graphics/icons/veg.png",
    icon_size = 32,
    subgroup = "k2cp-crops",
    order = "c",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-grapes",
    icon = "__CityPeeps__/graphics/icons/grapes.png",
    icon_size = 32,
    subgroup = "k2cp-crops",
    order = "d",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-meat",
    icon = "__CityPeeps__/graphics/icons/meat.png",
    icon_size = 32,
    subgroup = "k2cp-crops",
    order = "e",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-leather",
    icon = "__CityPeeps__/graphics/icons/leather.png",
    icon_size = 32,
    subgroup = "k2cp-crops",
    order = "f",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-cotton",
    icon = "__CityPeeps__/graphics/icons/cotton.png",
    icon_size = 32,
    subgroup = "k2cp-crops",
    order = "g",
    stack_size = 200
  },

  -- Crates (Assembler)
  {
    type = "item-subgroup",
    name = "k2cp-crates",
    group = "k2cp-citypeeps",
    order = "f"
  },
  {
    type = "item",
    name = "k2cp-crate-meals",
    icon = "__CityPeeps__/graphics/icons/meals.png",
    icon_size = 32,
    subgroup = "k2cp-crates",
    order = "a",
    stack_size = 2000
  },
  {
    type = "item",
    name = "k2cp-crate-house",
    icon = "__CityPeeps__/graphics/icons/crate_house.png",
    icon_size = 32,
    subgroup = "k2cp-crates",
    order = "b",
    stack_size = 2000
  },
  {
    type = "item",
    name = "k2cp-crate-energy",
    icon = "__CityPeeps__/graphics/icons/crate_energy.png",
    icon_size = 32,
    subgroup = "k2cp-crates",
    order = "c",
    stack_size = 2000
  },
  {
    type = "item",
    name = "k2cp-crate-medical",
    icon = "__CityPeeps__/graphics/icons/crate_medical.png",
    icon_size = 32,
    subgroup = "k2cp-crates",
    order = "d",
    stack_size = 2000
  },
  {
    type = "item",
    name = "k2cp-crate-military",
    icon = "__CityPeeps__/graphics/icons/crate_military.png",
    icon_size = 32,
    subgroup = "k2cp-crates",
    order = "e",
    stack_size = 2000
  },
  {
    type = "item",
    name = "k2cp-crate-pleasure",
    icon = "__CityPeeps__/graphics/icons/crate_pleasure.png",
    icon_size = 32,
    subgroup = "k2cp-crates",
    order = "f",
    stack_size = 2000
  },
  {
    type = "item",
    name = "k2cp-crate-school",
    icon = "__CityPeeps__/graphics/icons/crate_school.png",
    icon_size = 32,
    subgroup = "k2cp-crates",
    order = "g",
    stack_size = 2000
  },
  {
    type = "item",
    name = "k2cp-crate-const",
    icon = "__CityPeeps__/graphics/icons/crate_const.png",
    icon_size = 32,
    subgroup = "k2cp-crates",
    order = "h",
    stack_size = 200
  },
  {
    type = "item",
    name = "k2cp-crate-export",
    icon = "__CityPeeps__/graphics/icons/crate_export.png",
    icon_size = 32,
    subgroup = "k2cp-crates",
    order = "i",
    stack_size = 200
  },
  
  -- Exports (DataCenter)
  {
    type = "item-subgroup",
    name = "k2cp-exports",
    group = "k2cp-citypeeps",
    order = "g"
  },
  {
    type = "item",
    name = "k2cp-datacron",
    icon = "__CityPeeps__/graphics/icons/datacron.png",
    icon_size = 32,
    subgroup = "k2cp-exports",
    order = "a",
    stack_size = 5000
  },

  -- Citizen (Produced in a City)
  {
    type = "item-subgroup",
    name = "k2cp-citizens",
    group = "k2cp-citypeeps",
    order = "z"
  },
  {
    type = "item",
    name = "k2cp-passenger",
    icon = "__CityPeeps__/graphics/icons/citypeep.png",
    icon_size = 48, 
    category = "k2cp-city-products",
    subgroup = "k2cp-citizens",
    order = "a",
	stackable = false,
    stack_size = 1
  },
  {
    type = "item",
    name = "k2cp-student",
    icon = "__CityPeeps__/graphics/icons/student.png",
    icon_size = 48, 
    category = "k2cp-city-products",
    subgroup = "k2cp-citizens",
    order = "b",
	stackable = false,
    stack_size = 1
  },
  
  -- Officers (Produced in an Academy)
  {
    type = "item-subgroup",
    name = "k2cp-officers",
    group = "k2cp-citypeeps",
    order = "z"
  },
  {
    type = "module",
    name = "k2cp-officer-1",
    icon = "__CityPeeps__/graphics/icons/officer1.png",
    icon_size = 40, 
    category = "productivity",
    subgroup = "k2cp-officers",
    tier = 1,
    order = "c",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.05},
      consumption = {bonus = 0.1},
      pollution = {bonus = 0.1}
    }
  },
  {
    type = "module",
    name = "k2cp-officer-2",
    icon = "__CityPeeps__/graphics/icons/officer2.png",
    icon_size = 40, 
    category = "productivity",
    subgroup = "k2cp-officers",
    tier = 2,
    order = "d",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.1},
      consumption = {bonus = 0.2},
      pollution = {bonus = 0.2}
    }
  },
  {
    type = "module",
    name = "k2cp-officer-3",
    icon = "__CityPeeps__/graphics/icons/officer3.png",
    icon_size = 40, 
    category = "productivity",
    subgroup = "k2cp-officers",
    tier = 3,
    order = "e",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.2},
      consumption = {bonus = 0.2},
      pollution = {bonus = 0.2}
    }
  },
  {
    type = "item",
    name = "k2cp-coin",
    icon = "__base__/graphics/icons/coin.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "k2cp-officers",
    order = "f",
    stack_size = 2000
  },
})
