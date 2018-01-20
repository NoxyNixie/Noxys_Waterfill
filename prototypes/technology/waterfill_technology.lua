data:extend{{
	type = "technology",
	name = "waterfill",
	icon = "__Noxys_Waterfill__/graphics/icons/xhr_waterfill.png",
	icon_size = 128,
	effects =
	{
		{type = "unlock-recipe", recipe = "waterfill"},
	},
	prerequisites = {"landfill"},
	unit =
	{
		count = 100,
		ingredients =
		{
			{"science-pack-1", 1},
			{"science-pack-2", 1},
		},
		time = 30
	},
	order = "a"
}}
