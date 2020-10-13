data:extend({

  -- Buildings
  {
    type = "recipe-category",
    name = "k2cp-buildings"
  },
  {
    type = "recipe",
    name = "k2cp-field",
    category = "k2cp-buildings",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"wood", 120},
      {"stone", 40},
      {"pipe", 40}
    },
    result = "k2cp-field"
  },
  {
    type = "recipe",
    name = "k2cp-biofarm",
    category = "k2cp-buildings",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-glass", 400},
      {"steel-plate", 200},
      {"iron-gear-wheel", 100},
      {"stone", 400},
      {"pipe", 200}
    },
    result = "k2cp-biofarm"
  },
  {
    type = "recipe",
    name = "k2cp-city",
    category = "k2cp-buildings",
    enabled = false,
    energy_required = 120,
    ingredients =
    {
      {"k2cp-crate-const", 2000}
    },
    result = "k2cp-city"
  },
  {
    type = "recipe",
    name = "k2cp-datacenter",
    category = "k2cp-buildings",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {"k2cp-crate-const", 400}
    },
    result = "k2cp-datacenter"
  },
  {
    type = "recipe",
    name = "k2cp-tradehub",
    category = "k2cp-buildings",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {"k2cp-crate-const", 1000}
    },
    result = "k2cp-tradehub"
  },
  {
    type = "recipe",
    name = "k2cp-academy",
    category = "k2cp-buildings",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {"k2cp-crate-const", 1000}
    },
    result = "k2cp-academy"
  },
  {
    type = "recipe",
    name = "k2cp-resort",
    category = "k2cp-buildings",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {"k2cp-crate-const", 1000}
    },
    result = "k2cp-resort"
  },
    
  -- Products1 (Assembler)
  {
    type = "recipe-category",
    name = "k2cp-products1"
  },
  {
    type = "recipe",
    name = "k2cp-sand",
    category = "k2cp-products1",
    enabled = true,
    energy_required = 10,
    ingredients =
    {
      {"stone", 40}
    },
    result_count = 20,
    result = "k2cp-sand"
  },
  {
    type = "recipe",
    name = "k2cp-carbon-c",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"coal", 40}
    },
    result_count = 30,
    result = "k2cp-carbon"
  },
  {
    type = "recipe",
    name = "k2cp-carbon-w",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"wood", 40}
    },
    result_count = 20,
    result = "k2cp-carbon"
  },
  {
    type = "recipe",
    name = "k2cp-furniture",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"steel-plate", 10},
      {"copper-plate", 20},
      {"iron-gear-wheel", 20},
      {"wood", 10}
    },
    result_count = 10,
    result = "k2cp-furniture"
  },
  {
    type = "recipe",
    name = "k2cp-tools",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"wood", 50},
      {"iron-gear-wheel", 120},
      {"steel-plate", 100},
      {"electronic-circuit", 4}
    },
    result_count = 20,
    result = "k2cp-tools"
  },
  {
    type = "recipe",
    name = "k2cp-clothes",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-cotton", 20},
      {"plastic-bar", 4}
    },
    result_count = 20,
    result = "k2cp-clothes"
  },
  {
    type = "recipe",
    name = "k2cp-shoes1",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-cotton", 2},
      {"k2cp-leather", 10},
      {"plastic-bar", 4}
    },
    result_count = 10,
    result = "k2cp-shoes1"
  },
  {
    type = "recipe",
    name = "k2cp-shoes2",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-cotton", 2},
      {"k2cp-leather", 10},
      {"plastic-bar", 4}
    },
    result_count = 10,
    result = "k2cp-shoes2"
  },
  {
    type = "recipe",
    name = "k2cp-phones",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"advanced-circuit", 4},
      {"electronic-circuit", 4},
      {"plastic-bar", 4},
      {"k2cp-carbon", 10}
    },
    result_count = 10,
    result = "k2cp-phones"
  },
  {
    type = "recipe",
    name = "k2cp-backpack",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-cotton", 2},
      {"k2cp-leather", 10},
      {"plastic-bar", 4}
    },
    result_count = 10,
    result = "k2cp-backpack"
  },
  {
    type = "recipe",
    name = "k2cp-vids",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"advanced-circuit", 4},
      {"electronic-circuit", 4},
      {"k2cp-carbon", 10}
    },
    result_count = 10,
    result = "k2cp-vids"
  },
  {
    type = "recipe",
    name = "k2cp-firstaid",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-cotton", 10},
      {"k2cp-carbon", 10}  
    },
    result_count = 10,
    result = "k2cp-firstaid"
  },
  {
    type = "recipe",
    name = "k2cp-equip",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"advanced-circuit", 4},
      {"processing-unit", 4},
      {"k2cp-carbon", 10},
      {"k2cp-glass", 10}
    },
    result_count = 10,
    result = "k2cp-equip"
  },
  {
    type = "recipe",
    name = "k2cp-ebook",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"advanced-circuit", 4},
      {"processing-unit", 4},
      {"k2cp-carbon", 10}
    },
    result_count = 10,
    result = "k2cp-ebook"
  },
  {
    type = "recipe",
    name = "k2cp-games",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"advanced-circuit", 4},
      {"processing-unit", 4},
      {"plastic-bar", 4},
      {"k2cp-carbon", 10}
    },
    result_count = 10,
    result = "k2cp-games"
  },
  {
    type = "recipe",
    name = "k2cp-school",
    category = "k2cp-products1",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"wood", 20},
      {"plastic-bar", 4}
    },
    result_count = 10,
    result = "k2cp-school"
  },
  {
    type = "recipe",
    name = "k2cp-passenger-wagon",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 10},
      {"iron-plate", 20},
      {"steel-plate", 20}
    },
    result = "k2cp-passenger-wagon"
  },
  {
    type = "recipe",
    name = "k2cp-student-wagon",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 10},
      {"iron-plate", 20},
      {"steel-plate", 20}
    },
    result = "k2cp-student-wagon"
  },
  {
    type = "recipe",
    name = "k2cp-passenger-wagon-mk2",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {"k2cp-student-wagon", 1},
      {"k2cp-coin", 2000},
      {"k2cp-leather", 200},
      {"steel-plate", 20}
    },
    result = "k2cp-passenger-wagon-mk2"
  },
  {
    type = "recipe",
    name = "k2cp-student-wagon-mk2",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {"k2cp-student-wagon", 1},
      {"k2cp-coin", 2000},
      {"k2cp-leather", 200},
      {"steel-plate", 20}
    },
    result = "k2cp-student-wagon-mk2"
  },

  -- Products2 (Chemical Plant)
  {
    type = "recipe-category",
    name = "k2cp-products2"
  },
  {
    type = "recipe",
    name = "k2cp-fertilizer",
    category = "k2cp-products2",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"raw-fish", 5},
      {"wood", 5},
	  {type="fluid", name="water", amount=100}
    },
    result_count = 20,
    result = "k2cp-fertilizer"
  },
  {
    type = "recipe",
    name = "k2cp-beer",
    category = "k2cp-products2",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-wheat", 20},
      {"k2cp-hops", 20},
      {"k2cp-glass", 4},
	  {type="fluid", name="water", amount=200}
    },
    result_count = 10,
    result = "k2cp-beer"
  },
  {
    type = "recipe",
    name = "k2cp-wine",
    category = "k2cp-products2",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {"k2cp-grapes", 40},
      {"k2cp-glass", 4},
	  {type="fluid", name="water", amount=200}
    },
    result_count = 30,
    result = "k2cp-wine"
  },
  {
    type = "recipe",
    name = "k2cp-medicine",
    category = "k2cp-products2",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-cotton", 20},
      {"raw-fish", 20},
	  {type="fluid", name="sulfuric-acid", amount=100}
    },
    result_count = 10,
    result = "k2cp-medicine"
  },

  -- Products3 (Furnace)
  {
    type = "recipe-category",
    name = "k2cp-products3"
  },
  {
    type = "recipe",
    name = "k2cp-glass",
    category = "k2cp-products3",
    enabled = true,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-sand", 20}
    },
    result_count = 20,
    result = "k2cp-glass"
  },
  {
    type = "recipe",
    name = "k2cp-bread",
    category = "k2cp-products3",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"k2cp-wheat", 20}
    },
    result_count = 20,
    result = "k2cp-bread"
  },
  
  -- Crops
  {
    type = "recipe-category",
    name = "k2cp-crops"
  },
  {
    type = "recipe",
    name = "k2cp-wheat",
    category = "k2cp-crops",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
        {type="item", name="k2cp-fertilizer", amount=120},
        {type="fluid", name="water", amount=1000}
    },
    result_count = 960,
    result = "k2cp-wheat"
  },
  {
    type = "recipe",
    name = "k2cp-hops",
    category = "k2cp-crops",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
        {type="item", name="k2cp-fertilizer", amount=120},
        {type="fluid", name="water", amount=1000}
    },
    result_count = 480,
    result = "k2cp-hops"
  },
  {
    type = "recipe",
    name = "k2cp-veg",
    category = "k2cp-crops",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
        {type="item", name="k2cp-fertilizer", amount=120},
        {type="fluid", name="water", amount=2000}
    },
    result_count = 480,
    result = "k2cp-veg"
  },
  {
    type = "recipe",
    name = "k2cp-grapes",
    category = "k2cp-crops",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
        {type="item", name="k2cp-fertilizer", amount=120},
        {type="fluid", name="water", amount=2000}
    },
    result_count = 480,
    result = "k2cp-grapes"
  },
  {
    type = "recipe",
    name = "k2cp-meat",
    category = "k2cp-crops",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
        {type="item", name="k2cp-wheat", amount=240},
        {type="fluid", name="water", amount=4000}
    },
    result_count = 120,
    result = "k2cp-meat"
  },
  {
    type = "recipe",
    name = "k2cp-leather",
    category = "k2cp-crops",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
        {type="item", name="k2cp-wheat", amount=240},
        {type="fluid", name="water", amount=200}
    },
    result_count = 240,
    result = "k2cp-leather"
  },
  {
    type = "recipe",
    name = "k2cp-cotton",
    category = "k2cp-crops",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
        {type="item", name="k2cp-fertilizer", amount=120},
        {type="fluid", name="water", amount=200}
    },
    result_count = 480,
    result = "k2cp-cotton"
  },
  {
    type = "recipe",
    name = "k2cp-wood",
    category = "k2cp-crops",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
        {type="item", name="k2cp-fertilizer", amount=40},
        {type="fluid", name="water", amount=2480}
    },
    result_count = 480,
    result = "wood"
  },
  {
    type = "recipe",
    name = "k2cp-fish",
    category = "k2cp-crops",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
        {type="item", name="k2cp-fertilizer", amount=10},
        {type="fluid", name="water", amount=120}
    },
    result_count = 120,
    result = "raw-fish"
  },

  -- Crates (Assembler)  
  {
    type = "recipe-category",
    name = "k2cp-crates"
  },
  {
    type = "recipe",
    name = "k2cp-crate-meals",
    category = "k2cp-crates",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 10},
      {"plastic-bar", 4},
      {"k2cp-bread", 40},
      {"k2cp-beer", 40},
      {"k2cp-veg", 40},
      {"k2cp-meat", 40}
    },
    result_count = 10,
    result = "k2cp-crate-meals"
  },
  {
    type = "recipe",
    name = "k2cp-crate-house",
    category = "k2cp-crates",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 10},
      {"plastic-bar", 4},
      {"k2cp-clothes", 20},
      {"k2cp-shoes2", 20},
      {"k2cp-furniture", 20},
      {"battery", 10}
    },
    result_count = 10,
    result = "k2cp-crate-house"
  },
  {
    type = "recipe",
    name = "k2cp-crate-energy",
    category = "k2cp-crates",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 10},
      {"copper-plate", 20},
      {"plastic-bar", 4},
      {"solar-panel", 10},
      {"solid-fuel", 20},
      {"crude-oil-barrel", 20}
    },
    result_count = 10,
    result = "k2cp-crate-energy"
  },
  {
    type = "recipe",
    name = "k2cp-crate-medical",
    category = "k2cp-crates",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 10},
      {"copper-plate", 20},
      {"k2cp-firstaid", 20},
      {"k2cp-medicine", 20},  
      {"k2cp-equip", 10}
    },
    result_count = 10,
    result = "k2cp-crate-medical"
  },
  {
    type = "recipe",
    name = "k2cp-crate-military",
    category = "k2cp-crates",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 10},
      {"copper-plate", 20},
      {"firearm-magazine", 40},
      {"grenade", 20},
      {"light-armor", 10},
      {"gun-turret", 10}
    },
    result_count = 20,
    result = "k2cp-crate-military"
  },
  {
    type = "recipe",
    name = "k2cp-crate-pleasure",
    category = "k2cp-crates",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 10},
      {"plastic-bar", 4},
      {"k2cp-vids", 20},
      {"k2cp-games", 20},
      {"k2cp-phones", 10},
      {"k2cp-wine", 20}
    },
    result_count = 20,
    result = "k2cp-crate-pleasure"
  },
  {
    type = "recipe",
    name = "k2cp-crate-school",
    category = "k2cp-crates",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 10},
      {"copper-plate", 20},
      {"k2cp-school", 20},
      {"k2cp-ebook", 20},
      {"k2cp-shoes1", 20},
      {"k2cp-backpack", 20}
    },
    result_count = 10,
    result = "k2cp-crate-school"
  },
  {
    type = "recipe",
    name = "k2cp-crate-const",
    category = "k2cp-crates",
    enabled = false,
    energy_required = 40,
    ingredients =
    {
      {"steel-plate", 120},
      {"copper-plate", 120},
      {"stone-brick", 120},
      {"k2cp-tools", 120}
    },
    result_count = 40,
    result = "k2cp-crate-const"
  },
  {
    type = "recipe",
    name = "k2cp-crate-export",
    category = "k2cp-crates",
    enabled = false,
    energy_required = 20,
	ingredients =
	{
		{"k2cp-crate-meals", 20},
		{"k2cp-crate-house", 20},
		{"k2cp-crate-energy", 20},
		{"k2cp-crate-school", 20},
		{"k2cp-crate-military", 20},
		{"k2cp-crate-medical", 20},
		{"k2cp-crate-pleasure", 20}
	},
    result_count = 2,
    result = "k2cp-crate-export"
  },
  
  -- Exports (DataCenter)
  {
    type = "recipe-category",
    name = "k2cp-exports"
  },
  {
    type = "recipe",
    name = "k2cp-datacron",
    category = "k2cp-exports",
    enabled = false,
    energy_required = 10,
	ingredients =
	{
		{"automation-science-pack", 100},
		{"logistic-science-pack", 100},
		{"military-science-pack", 100},
		{"chemical-science-pack", 100},
		{"utility-science-pack", 100},
		{"production-science-pack", 100}
	},
    result_count = 1,
    result = "k2cp-datacron"
  },

  -- Academy Production
  {
    type = "recipe-category",
    name = "k2cp-academy-products"
  },
  {
	type = "recipe",
	name = "k2cp-graduates",
	energy_required = 60,
	enabled = false,
    icon = "__CityPeeps__/graphics/icons/student.png",
    icon_size = 48,
    category = "k2cp-academy-products",
	subgroup = "k2cp-officers",
	ingredients =
	{
		{type="item", name="k2cp-coin", amount=30},
		{type="item", name="k2cp-student", amount=3}
	},
    results =
    {
      {
        name = "k2cp-officer-1",
        probability = 0.1,
        amount = 1
      },
      {
        name = "k2cp-officer-2",
        probability = 0.01,
        amount = 1
      },
      {
        name = "k2cp-officer-3",
        probability = 0.005,
        amount = 1
      }
    }
  },
  {
	type = "recipe",
	name = "k2cp-promotion-1",
	energy_required = 600,
	enabled = false,
    icon = "__CityPeeps__/graphics/icons/officer2.png",
    icon_size = 40,
    category = "k2cp-academy-products",
	subgroup = "k2cp-officers",
	ingredients =
	{
		{type="item", name="k2cp-coin", amount=200},
		{type="item", name="k2cp-officer-1", amount=1}
	},
    results =
    {
		{type="item", name="k2cp-officer-2", amount=1}
    }
  },
  {
	type = "recipe",
	name = "k2cp-promotion-2",
	energy_required = 600,
	enabled = false,
    icon = "__CityPeeps__/graphics/icons/officer3.png",
    icon_size = 40,
    category = "k2cp-academy-products",
	subgroup = "k2cp-officers",
	ingredients =
	{
		{type="item", name="k2cp-coin", amount=400},
		{type="item", name="k2cp-officer-2", amount=1}
	},
    results =
    {
		{type="item", name="k2cp-officer-3", amount=1}
    }
  }
})