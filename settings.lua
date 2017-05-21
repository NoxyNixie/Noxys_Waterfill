local choices = {
	recipe_difficulty = {
			easy = "Easy",
			normal = "Normal",
			hard = "Hard",
			extrahard = "Extra Hard",
		},
	}

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
	-- Global
	-- Per user
})
