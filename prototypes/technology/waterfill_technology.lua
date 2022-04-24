if settings.startup["Noxys_Waterfill-require-research"].value then
	data:extend{{
		type = "technology",
		name = "waterfill",
		icon = "__Noxys_Waterfill__/graphics/icons/hr_waterfill.png",
		icon_size = 128,
		effects = {},
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
end
