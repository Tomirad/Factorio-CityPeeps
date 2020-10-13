data:extend({
    {
		type = "double-setting",
        name = "k2cp-update-interval",
		setting_type = "startup",
		admin = true,
		default_value = 1,
		minimum_value = 0.01,
		maximum_value = 10,
		order = "1"
    },
    {
		type = "int-setting",
        name = "k2cp-max-districts",
		setting_type = "startup",
		admin = true,
		default_value = 210,
		minimum_value = 20,
		order = "1"
    },
    {
		type = "int-setting",
        name = "k2cp-city-distance",
		setting_type = "startup",
		admin = true,
		default_value = 320,
		minimum_value = 32,
		order = "c"
    },
    {
		type = "int-setting",
        name = "k2cp-resort-distance",
		setting_type = "startup",
		admin = true,
		default_value = 320,
		minimum_value = 32,
		order = "c"
    },
    {
        type = "bool-setting",
        name = "k2cp-require-crate-house",
        setting_type = "startup",
		admin = true,
        default_value = true,
		order = "d"
    },
    {
        type = "bool-setting",
        name = "k2cp-require-crate-energy",
        setting_type = "startup",
		admin = true,
        default_value = true,
		order = "e"
    },
    {
        type = "bool-setting",
        name = "k2cp-require-crate-school",
        setting_type = "startup",
		admin = true,
        default_value = true,
		order = "f"
    },
    {
        type = "bool-setting",
        name = "k2cp-require-crate-military",
        setting_type = "startup",
		admin = true,
        default_value = true,
		order = "g"
    },
    {
        type = "bool-setting",
        name = "k2cp-require-crate-medical",
        setting_type = "startup",
		admin = true,
        default_value = true,
		order = "h"
    },
    {
        type = "bool-setting",
        name = "k2cp-require-crate-pleasure",
        setting_type = "startup",
		admin = true,
        default_value = true,
		order = "i"
    },
    {
        type = "bool-setting",
        name = "k2cp-assist-mode",
        setting_type = "startup",
		admin = true,
        default_value = true,
		order = "j"
    },
})
