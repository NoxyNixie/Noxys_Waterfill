local choices = require("choices")

for _,r in pairs{"waterfill", "deepwaterfill", "waterfill-green", "deepwaterfill-green"} do
	if data.raw.recipe[r] then
		if settings.startup["Noxys_Waterfill-recipe-difficulty"].value == choices.recipe_difficulty.normal then
			data.raw.recipe[r].ingredients = {
				{type = "fluid", name = "water", amount = 1000}
			}
		elseif settings.startup["Noxys_Waterfill-recipe-difficulty"].value == choices.recipe_difficulty.hard then
			data.raw.recipe[r].ingredients = {
				{type = "fluid", name = "water", amount = 1000}, 
				{type = "item", name = "explosives", amount = 1}
			}
		elseif settings.startup["Noxys_Waterfill-recipe-difficulty"].value == choices.recipe_difficulty.extrahard then
			data.raw.recipe[r].ingredients = {
				{type = "fluid", name = "water", amount = 1000}, 
				{type = "item", name = "explosives", amount = 10},
				{type = "item", name = "processing-unit", amount = 1}
			}
		end
		data.raw.recipe[r].result_count = settings.startup["Noxys_Waterfill-items-per-craft"].value
		data.raw.recipe[r].energy_required = settings.startup["Noxys_Waterfill-time-per-craft"].value
	end
end

if settings.startup["Noxys_Waterfill-green-water-requires-uranium"].value then
	for _,r in pairs{"waterfill-green", "deepwaterfill-green"} do
		if data.raw.recipe[r] then
			table.insert(data.raw.recipe[r].ingredients, {type = "item", name = "uranium-238", amount = 1})
		end
	end
end
