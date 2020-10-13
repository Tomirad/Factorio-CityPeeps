return {
    civ = {
		-- Turn on debug display or not
		debug_msg = true,
		
		-- Passenger divisor - districs divided by this determine how many passengers will be generated per cycle.
		-- Note that the passenger_multiplier in the city class is an upgrade which will increase passengers per cycle.
		passenger_divisor = 10,
		passenger_multiplier = 1,
		
		-- Student divisor - districs divided by this determine how many students will be generated per cycle.
		-- Note that a student_multiplier in the city class is an upgrade which will increase students per cycle.
		student_divisor = 10,
		student_multiplier = 1,
		
		-- Starting revenue for a passenger delivered to a resort.
		-- Given that there are upgrades to increase revenue, this should stay fairly low to begin with.
		starting_revenue = 4,
		
		-- City needs:  Add a city need here to make mandatory.  It's always one consumed per district per cycle.  
		-- The other six crates are optionally added through settings.
		needs =
		{
            "k2cp-crate-meals"
		},

		-- Renown tiers with rewards - recognized reward types:  (i) item, (r) recipe
		-- If you modify tiers, also update the messages accordingly in locale.cfg
		-- If you add tiers, please update civ_logic tick() recipie-check tier indexes - to make sure recipes are enabled if they advance more than one tier in a single update.
		tiers = 
		{
			{id=9, score = 100000,  title = {"caption.k2cp-title-5"}, renown = {"caption.k2cp-renown-8"}, msg = {"message.k2cp-rwd-msg-9"}, reward_type="i", reward = {name="k2cp-officer-3", count=3} },
			{id=8, score =  50000,  title = {"caption.k2cp-title-4"}, renown = {"caption.k2cp-renown-7"}, msg = {"message.k2cp-rwd-msg-8"}, reward_type="i", reward = {name="k2cp-coin", count=1000}   },
			{id=7, score =  20000,  title = {"caption.k2cp-title-4"}, renown = {"caption.k2cp-renown-7"}, msg = {"message.k2cp-rwd-msg-7"}, reward_type="r", reward = "k2cp-promotion-2"               },
			{id=6, score =   6000,  title = {"caption.k2cp-title-4"}, renown = {"caption.k2cp-renown-6"}, msg = {"message.k2cp-rwd-msg-6"}, reward_type="r", reward = "k2cp-promotion-1"               },
			{id=5, score =   4000,  title = {"caption.k2cp-title-3"}, renown = {"caption.k2cp-renown-5"}, msg = {"message.k2cp-rwd-msg-5"}, reward_type="r", reward = "k2cp-datacron"                  },
			{id=4, score =   2000,  title = {"caption.k2cp-title-3"}, renown = {"caption.k2cp-renown-4"}, msg = {"message.k2cp-rwd-msg-4"}, reward_type="i", reward = {name="nuclear-fuel", count=20}  },
			{id=3, score =   1000,  title = {"caption.k2cp-title-2"}, renown = {"caption.k2cp-renown-3"}, msg = {"message.k2cp-rwd-msg-3"}, reward_type="i", reward = {name="k2cp-coin", count=400}    },
			{id=2, score =    200,  title = {"caption.k2cp-title-2"}, renown = {"caption.k2cp-renown-2"}, msg = {"message.k2cp-rwd-msg-2"}, reward_type="i", reward = {name="k2cp-student", count=6}   },
			{id=1, score =     10,  title = {"caption.k2cp-title-1"}, renown = {"caption.k2cp-renown-1"}, msg = {"message.k2cp-rwd-msg-1"}, reward_type="i", reward = {name="k2cp-officer-3", count=1} },
			{id=0, score =      0,  title = {"caption.k2cp-title-1"}, renown = {"caption.k2cp-renown-1"}, msg = nil                       , reward_type="x", reward = nil                              },
		},
		
		-- Purchasable upgrades - use credits to enhance CityPeeps things.
		-- Corresponding logic in civ_logic.  GUI displays in the order listed here.
		-- Currently only takes an existing value and adds the new value in add_value to the old.  No other operations are supported.
		-- Recognized types:  (a) attribute of my custom classes stored in the respective object arrays
		--					  (e) entity - utilizes a replacable entity to work
		upgrades = 
		{
			{
				name    = "k2cp-city",
				sprite  = "item/k2cp-city",
				tooltip	= "item-name.k2cp-city",
				options = 
				{
					{type = "e", attr = "inventory_size" 		, add_value = 60  	, cost = 1000,	object="k2cp-city-mk2"	, msg={"message.k2cp-upgd-c1", attr, add_value, cost} 	},
					{type = "a", attr = "passenger_multiplier"	, add_value = 1 	, cost = 5000,	object=nil				, msg={"message.k2cp-upgd-c1", attr, add_value, cost} 	},
					{type = "a", attr = "student_multiplier"	, add_value = 1 	, cost = 5000,	object=nil				, msg={"message.k2cp-upgd-c1", attr, add_value, cost} 	},
					{type = "a", attr = "passenger_multiplier"	, add_value = 1 	, cost = 15000,	object=nil				, msg={"message.k2cp-upgd-c1", attr, add_value, cost} 	},
					{type = "a", attr = "student_multiplier"	, add_value = 1 	, cost = 15000,	object=nil				, msg={"message.k2cp-upgd-c1", attr, add_value, cost} 	},
					{type = "a", attr = "max_districts"	     	, add_value = 100 	, cost = 20000,	object=nil				, msg={"message.k2cp-upgd-c1", attr, add_value, cost} 	},
					{type = "a", attr = "max_districts"	     	, add_value = 200 	, cost = 50000,	object=nil				, msg={"message.k2cp-upgd-c1", attr, add_value, cost} 	},
					{type = "a", attr = "passenger_multiplier"	, add_value = -3 	, cost = 1000,	object=nil				, msg={"message.k2cp-upgd-c2", attr, cost} 				},
					{type = "a", attr = "student_multiplier"	, add_value = -3 	, cost = 1000,	object=nil				, msg={"message.k2cp-upgd-c2", attr, cost} 				},
				}		
			},		
			{		
				name    = "k2cp-resort", 		
				sprite  = "item/k2cp-resort",		
				tooltip	= "item-name.k2cp-resort",		
				options = 		
				{		
					{type = "a", attr = "revenue"			  	, add_value = 2   	, cost = 1000,	object=nil					, msg={"message.k2cp-upgrade-r1"} 	},
					{type = "a", attr = "revenue"				, add_value = 2   	, cost = 2000,	object=nil					, msg={"message.k2cp-upgrade-r1"} 	},
					{type = "e", attr = "inventory_size"		, add_value = 24  	, cost = 1000,	object="k2cp-resort-mk2"	, msg={"message.k2cp-upgrade-r1"} 	},
				}	
			},	
			{	
				name    = "k2cp-academy",	
				sprite  = "item/k2cp-academy",	
				tooltip	= "item-name.k2cp-academy",	
				options = 	
				{	
					{type = "e", attr = "crafting_speed"        , add_value = 1 	, cost = 2000,	object="k2cp-academy-mk2"	, msg={"message.k2cp-upgrade-a1"} 	},
				}	
			},	
		}
    }
}

