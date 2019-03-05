data:extend({
	-- Item
	{
		type = "item",
		name = "waterfill",
		icon = "__Noxys_Waterfill__/graphics/icons/waterfill.png",
		icon_size = 32,
		subgroup = "terrain",
		order = "c[landfill]-z-a[water]",
		stack_size = 100,
		place_as_tile =
		{
			result = "water",
			condition_size = 1,
			condition = {},
		},
	},
	-- Recipe
	{
		type = "recipe",
		name = "waterfill",
		energy_required = 1,
		enabled = false,
		category = "crafting-with-fluid",
		ingredients =
		{
			{type = "fluid", name = "water", amount = 1000},
		},
		result = "waterfill",
		result_count = 1,
	},
})
if settings.startup["Noxys_Waterfill-enable-deep-water"].value then
	data:extend({
		-- Item
		{
			type = "item",
			name = "deepwaterfill",
			icon = "__Noxys_Waterfill__/graphics/icons/deepwaterfill.png",
			icon_size = 32,
			subgroup = "terrain",
			order = "c[landfill]-z-b[deepwater]",
			stack_size = 100,
			place_as_tile =
			{
				result = "deepwater",
				condition_size = 1,
				condition = {}
			},
		},
		-- Recipe
		{
			type = "recipe",
			name = "deepwaterfill",
			energy_required = 1,
			enabled = false,
			category = "crafting-with-fluid",
			ingredients =
			{
				{type = "fluid", name = "water", amount = 1000},
			},
			result = "deepwaterfill",
			result_count = 1,
		},
	})
end
if settings.startup["Noxys_Waterfill-enable-green-water"].value then
	data:extend({
		-- Item
		{
			type = "item",
			name = "waterfill-green",
			icon = "__Noxys_Waterfill__/graphics/icons/waterfill-green.png",
			icon_size = 32,
			subgroup = "terrain",
			order = "c[landfill]-z-c[water-green]",
			stack_size = 100,
			place_as_tile =
			{
				result = "water-green",
				condition_size = 1,
				condition = {},
			},
		},
		-- Recipe
		{
			type = "recipe",
			name = "waterfill-green",
			energy_required = 1,
			enabled = false,
			category = "crafting-with-fluid",
			ingredients =
			{
				{type = "fluid", name = "water", amount = 1000},
			},
			result = "waterfill-green",
			result_count = 1,
		},
	})
	if settings.startup["Noxys_Waterfill-enable-deep-water"].value then
		data:extend({
			-- Item
			{
				type = "item",
				name = "deepwaterfill-green",
				icon = "__Noxys_Waterfill__/graphics/icons/deepwaterfill-green.png",
				icon_size = 32,
				subgroup = "terrain",
				order = "c[landfill]-z-d[deepwater-green]",
				stack_size = 100,
				place_as_tile =
				{
					result = "deepwater-green",
					condition_size = 1,
					condition = {}
				},
			},
			-- Recipe
			{
				type = "recipe",
				name = "deepwaterfill-green",
				energy_required = 1,
				enabled = false,
				category = "crafting-with-fluid",
				ingredients =
				{
					{type = "fluid", name = "water", amount = 1000},
				},
				result = "deepwaterfill-green",
				result_count = 1,
			},
		})
	end
end