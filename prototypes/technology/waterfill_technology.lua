data:extend{{
	type = "technology",
	name = "waterfill",
	icon = "__Noxys_Waterfill__/graphics/icons/hr_waterfill.png",
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
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
		},
		time = 30
	},
	order = "a"
}}
