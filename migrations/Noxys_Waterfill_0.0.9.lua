if settings.startup["Noxys_Waterfill-recipe-difficulty"].value == "Extra Hard" then
	settings.startup["Noxys_Waterfill-recipe-difficulty"].value = "Hard"
end

-- for _, force in pairs(game.forces) do
-- 	force.reset_technologies()
-- 	force.reset_recipes()
-- 	local tech = force.technologies['waterfill']
-- 	if tech then
-- 		for _,v in ipairs(tech.effects) do
-- 			if v.type == 'unlock-recipe' then
-- 				force.recipes[v.recipe].enabled = tech.researched
-- 			end
-- 		end
-- 	end
-- end
