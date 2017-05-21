data:extend({
	-- Item
	{
		type = "item",
		name = "waterfill",
		icon = "__Noxys_Waterfill__/graphics/icons/waterfill.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "terrain",
		order = "c[landfill]-z[water]",
		stack_size = 100,
		place_as_tile =
		{
			result = "water",
			condition_size = 1,
			condition = {"water-tile"},
		},
	},
	-- Recipe
	{
		type = "recipe",
		name = "waterfill",
		energy_required = 1,
		enabled = true,
		category = "crafting-with-fluid",
		ingredients =
		{
			{type="fluid", name="water", amount=100,},
		},
		result= "waterfill",
		result_count = 1,
	},
})
