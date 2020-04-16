local choices = require("choices")

data:extend({
	-- Startup
	{
		type = "bool-setting",
		name = "Noxys_Waterfill-enable-deep-water",
		setting_type = "startup",
		default_value = true,
		order = "a"
	},
	{
		type = "bool-setting",
		name = "Noxys_Waterfill-enable-green-water",
		setting_type = "startup",
		default_value = true,
		order = "b-a"
	},
	{
		type = "bool-setting",
		name = "Noxys_Waterfill-green-water-requires-uranium",
		setting_type = "startup",
		default_value = true,
		order = "b-b"
	},
	{
		type = "bool-setting",
		name = "Noxys_Waterfill-require-research",
		setting_type = "startup",
		default_value = true,
		order = "b-c"
	},
	{
		type = "string-setting",
		name = "Noxys_Waterfill-recipe-difficulty",
		setting_type = "startup",
		default_value = choices.recipe_difficulty.normal,
		allowed_values = choices.recipe_difficulty,
		order = "c",
	},
	{
		type = "int-setting",
		name = "Noxys_Waterfill-items-per-craft",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 1,
		maximum_value = 1000,
		order = "d"
	},
	{
		type = "int-setting",
		name = "Noxys_Waterfill-time-per-craft",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 1,
		maximum_value = 3600,
		order = "e"
	},
	{
		type = "int-setting",
		name = "Noxys_Waterfill-water-per-deepwater",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 0,
		order = "f"
	},
	{
		type = "string-setting",
		name = "Noxys_Waterfill-recipe-override",
		setting_type = "startup",
		allow_blank = true,
		default_value = "",
		order = "g"
	},
	-- Global
	{
		type = "bool-setting",
		name = "Noxys_Waterfill-reach-increase-while-holding-waterfill",
		setting_type = "runtime-global",
		default_value = true,
		order = "a"
	},
	{
		type = "int-setting",
		name = "Noxys_Waterfill-reach-with-waterfill",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 100,
		maximum_value = 10000,
		order = "b"
	},
	-- Per user
})
