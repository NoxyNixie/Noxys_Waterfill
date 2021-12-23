local choices = require("choices")

for _,r in pairs{"water", "water-shallow", "water-green", "water-mud", "deepwater", "deepwater-green"} do
	data.raw.tile[r].check_collision_with_entities = true
end

for _,r in pairs{"waterfill", "deepwaterfill", "waterfill-green", "deepwaterfill-green", "shallowwaterfill", "mudwaterfill"} do
	if data.raw.recipe[r] then
		if settings.startup["Noxys_Waterfill-recipe-difficulty"].value == choices.recipe_difficulty.normal then
			table.insert(data.raw.recipe[r].ingredients, {type = "item", name = "explosives", amount = 1})
		elseif settings.startup["Noxys_Waterfill-recipe-difficulty"].value == choices.recipe_difficulty.hard then
			table.insert(data.raw.recipe[r].ingredients, {type = "item", name = "explosives", amount = 10})
			table.insert(data.raw.recipe[r].ingredients, {type = "item", name = "processing-unit", amount = 1})
		end
		data.raw.recipe[r].result_count = settings.startup["Noxys_Waterfill-items-per-craft"].value
		data.raw.recipe[r].energy_required = settings.startup["Noxys_Waterfill-time-per-craft"].value
	end
end

for _,r in pairs{"waterfill", "deepwaterfill", "waterfill-green", "deepwaterfill-green", "shallowwaterfill", "mudwaterfill"} do
	local recipedata = settings.startup["Noxys_Waterfill-" .. r .. "-recipe-override"].value
	if string.len(recipedata) > 5 then
		local recipe = {}
		for typ, name, amount in string.gmatch(recipedata, "([^:]+):([^=]+)=([0-9]+)([;, ]*)") do
			table.insert(recipe, {type = typ, name = name, amount = tonumber(amount)})
		end
		if #recipe > 0 then
			data.raw.recipe[r].ingredients = recipe
		end
	end
end

if settings.startup["Noxys_Waterfill-green-water-requires-uranium"].value then
	for _,r in pairs{"waterfill-green", "deepwaterfill-green"} do
		if data.raw.recipe[r] then
			table.insert(data.raw.recipe[r].ingredients, {type = "item", name = "uranium-238", amount = 1})
		end
	end
end

if settings.startup["Noxys_Waterfill-enable-deep-water"].value and settings.startup["Noxys_Waterfill-water-per-deepwater"].value > 1 then
	data.raw.recipe["deepwaterfill"].ingredients = {{type = "item", name = "waterfill", amount = settings.startup["Noxys_Waterfill-water-per-deepwater"].value}}
	if settings.startup["Noxys_Waterfill-enable-green-water"].value then
		data.raw.recipe["deepwaterfill-green"].ingredients = {{type = "item", name = "waterfill-green", amount = settings.startup["Noxys_Waterfill-water-per-deepwater"].value}}
	end
end

if settings.startup["Noxys_Waterfill-require-research"].value then
	if settings.startup["Noxys_Waterfill-recipe-difficulty"].value == choices.recipe_difficulty.normal then
		if (data.raw.technology["waterfill"].prerequisites) then
			table.insert(data.raw.technology["waterfill"].prerequisites, "explosives")
		else
			data.raw.technology["waterfill"].prerequisites = {"landfill", "explosives"}
		end
		table.insert(data.raw.technology["waterfill"].unit.ingredients, {"military-science-pack", 1})
		data.raw.technology["waterfill"].unit.count = 200
		data.raw.technology["waterfill"].unit.time = 60
	elseif settings.startup["Noxys_Waterfill-recipe-difficulty"].value == choices.recipe_difficulty.hard then
		if (data.raw.technology["waterfill"].prerequisites) then
			table.insert(data.raw.technology["waterfill"].prerequisites, "explosives")
		else
			data.raw.technology["waterfill"].prerequisites = {"landfill", "explosives"}
		end
		table.insert(data.raw.technology["waterfill"].prerequisites, "advanced-electronics-2")
		table.insert(data.raw.technology["waterfill"].unit.ingredients, {"chemical-science-pack", 1})
		table.insert(data.raw.technology["waterfill"].unit.ingredients, {"military-science-pack", 1})
		data.raw.technology["waterfill"].unit.count = 400
		data.raw.technology["waterfill"].unit.time = 120
	end

	if settings.startup["Noxys_Waterfill-enable-deep-water"].value then
		table.insert(data.raw.technology["waterfill"].effects, {type = "unlock-recipe", recipe = "deepwaterfill"})
	end
	if settings.startup["Noxys_Waterfill-enable-green-water"].value then
		table.insert(data.raw.technology["waterfill"].effects, {type = "unlock-recipe", recipe = "waterfill-green"})
		if settings.startup["Noxys_Waterfill-enable-deep-water"].value then
			table.insert(data.raw.technology["waterfill"].effects, {type = "unlock-recipe", recipe = "deepwaterfill-green"})
		end
	end
else
	for _,r in pairs{"waterfill", "deepwaterfill", "waterfill-green", "deepwaterfill-green", "shallowwaterfill", "mudwaterfill"} do
		if data.raw.recipe[r] then
			data.raw.recipe[r].enabled = true
		end
	end
end
