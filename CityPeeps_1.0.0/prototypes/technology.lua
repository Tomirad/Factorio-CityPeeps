------------------------------------------------------------------------
-- !!!! No tech is implmented yet                              
------------------------------------------------------------------------
data:extend(
{
  {
    type = "technology",
    name = "k2cp-biology",
    localised_name = {"technology-name.k2cp-biology"},
    localised_description = {"technology-description.k2cp-biology"},
    icon_size = 32,
    icon = "__CityPeeps__/graphics/icons/seed.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-field"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-fertilizer"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-wood"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-fish"
      },
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 10
    },
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-crops",
    localised_name = {"technology-name.k2cp-crops"},
    localised_description = {"technology-description.k2cp-crops"},
    icon_size = 32,
    icon = "__CityPeeps__/graphics/icons/seed.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-wheat"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-hops"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-veg"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-meat"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-grapes"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-leather"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-cotton"
      },
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-biology"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-brewing",
    localised_name = {"technology-name.k2cp-brewing"},
    localised_description = {"technology-description.k2cp-brewing"},
    icon_size = 32,
    icon = "__CityPeeps__/graphics/icons/beer.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-bread"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-beer"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-wine"
      },
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-crops"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-biology-2",
    localised_name = {"technology-name.k2cp-biology-2"},
    localised_description = {"technology-description.k2cp-biology-2"},
    icon_size = 320,
    icon = "__CityPeeps__/graphics/entities/biofarm_i.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-biofarm"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-biology"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-tools",
    localised_name = {"technology-name.k2cp-tools"},
    localised_description = {"technology-description.k2cp-tools"},
    icon_size = 32,
    icon = "__CityPeeps__/graphics/icons/tools.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-tools"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-carbon-c"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-carbon-w"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-crops"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-household",
    localised_name = {"technology-name.k2cp-household"},
    localised_description = {"technology-description.k2cp-household"},
    icon_size = 32,
    icon = "__CityPeeps__/graphics/icons/crate_house.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-furniture"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-clothes"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-shoes2"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-tools"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-medical",
    localised_name = {"technology-name.k2cp-medical"},
    localised_description = {"technology-description.k2cp-medical"},
    icon_size = 32,
    icon = "__CityPeeps__/graphics/icons/crate_medical.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-firstaid"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-equip"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-medicine"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-tools"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-school",
    localised_name = {"technology-name.k2cp-school"},
    localised_description = {"technology-description.k2cp-school"},
    icon_size = 32,
    icon = "__CityPeeps__/graphics/icons/crate_school.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-school"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-ebook"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-backpack"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-shoes1"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-tools"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-pleasure",
    localised_name = {"technology-name.k2cp-pleasure"},
    localised_description = {"technology-description.k2cp-pleasure"},
    icon_size = 32,
    icon = "__CityPeeps__/graphics/icons/crate_pleasure.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-vids"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-phones"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-games"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-tools"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-packaging",
    localised_name = {"technology-name.k2cp-packaging"},
    localised_description = {"technology-description.k2cp-packaging"},
    icon_size = 32,
    icon = "__CityPeeps__/graphics/icons/crate_const.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-crate-meals"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-crate-house"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-crate-energy"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-crate-medical"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-crate-military"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-crate-pleasure"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-crate-school"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-crate-const"
      },
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-household", "k2cp-medical", "k2cp-school", "k2cp-pleasure"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-colonization",
    localised_name = {"technology-name.k2cp-colonization"},
    localised_description = {"technology-description.k2cp-colonization"},
    icon_size = 214,
    icon = "__CityPeeps__/graphics/entities/resort.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-city"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-resort"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-packaging"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-transport-1",
    localised_name = {"technology-name.k2cp-transport-1"},
    localised_description = {"technology-description.k2cp-transport-1"},
    icon_size = 64,
    icon = "__base__/graphics/icons/cargo-wagon.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-passenger-wagon"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-student-wagon"
      },
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-colonization", "railway"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-transport-2",
    localised_name = {"technology-name.k2cp-transport-2"},
    localised_description = {"technology-description.k2cp-transport-2"},
    icon_size = 64,
    icon = "__base__/graphics/icons/cargo-wagon.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-passenger-wagon-mk2"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-student-wagon-mk2"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-transport-1"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-education",
    localised_name = {"technology-name.k2cp-education"},
    localised_description = {"technology-description.k2cp-education"},
    icon_size = 204,
    icon = "__CityPeeps__/graphics/entities/academy.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-academy"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-graduates"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-colonization"},
    order = "c-a"
  },
  {
    type = "technology",
    name = "k2cp-exports",
    localised_name = {"technology-name.k2cp-exports"},
    localised_description = {"technology-description.k2cp-exports"},
    icon_size = 208,
    icon = "__CityPeeps__/graphics/entities/tradehub.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "k2cp-tradehub"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-datacenter"
      },
      {
        type = "unlock-recipe",
        recipe = "k2cp-crate-export"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"k2cp-colonization"},
    order = "c-a"
  },
})