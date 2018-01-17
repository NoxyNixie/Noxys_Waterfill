local function is_water_str(str)
	for _,r in pairs{"water", "deepwater", "water-green", "deepwater-green"} do
		if str == r then
			return true
		end
	end
	return false
end

local function is_waterfill_str(str)
	for _,r in pairs{"waterfill", "deepwaterfill", "waterfill-green", "deepwaterfill-green"} do
		if str == r then
			return true
		end
	end
	return false
end

local function is_waterfill(item)
	if item and item.valid_for_read then
		return is_waterfill_str(item.name)
	end
	return false
end

local function validate_global()
	if not global.last_cursor_stack_name or type(global.last_cursor_stack_name) ~= "table" then
		global.last_cursor_stack_name = {}
	end
	if not global.last_distance_bonus or type(global.last_distance_bonus) ~= "number" then
		global.last_distance_bonus = settings.global["Noxys_Waterfill-reach-with-waterfill"].value
	end
end

script.on_event({defines.events.on_runtime_mod_setting_changed}, function(event)
	if event.setting == "Noxys_Waterfill-reach-with-waterfill" then
		validate_global()
		for _,player in pairs(game.players) do
			if is_waterfill(player.cursor_stack) then
				if player.character.character_build_distance_bonus + (settings.global["Noxys_Waterfill-reach-with-waterfill"].value - global.last_distance_bonus) >= 0 then
					player.character.character_build_distance_bonus = player.character.character_build_distance_bonus + (settings.global["Noxys_Waterfill-reach-with-waterfill"].value - global.last_distance_bonus)
				else
					player.character.character_build_distance_bonus = player.character.character_build_distance_bonus + settings.global["Noxys_Waterfill-reach-with-waterfill"].value
				end
			end
		end
		global.last_distance_bonus = settings.global["Noxys_Waterfill-reach-with-waterfill"].value
	end
end)

script.on_event({defines.events.on_player_died}, function(event)
	if settings.global["Noxys_Waterfill-reach-increase-while-holding-waterfill"].value then
		validate_global()
		local player = game.players[event.player_index]
		if is_waterfill_str(global.last_cursor_stack_name[event.player_index]) then
			player.character.character_build_distance_bonus = player.character.character_build_distance_bonus - settings.global["Noxys_Waterfill-reach-with-waterfill"].value
		end
		global.last_cursor_stack_name[event.player_index] = nil
	end
end)

script.on_event({defines.events.on_player_cursor_stack_changed}, function(event)
	if settings.global["Noxys_Waterfill-reach-increase-while-holding-waterfill"].value then
		validate_global()
		local player = game.players[event.player_index]
		if not player.character then return end
		local cursor_stack = player.cursor_stack
		if global.last_cursor_stack_name[event.player_index] and cursor_stack and cursor_stack.valid_for_read and global.last_cursor_stack_name[event.player_index] == cursor_stack.name then return end
		if is_waterfill(cursor_stack) then
			if not is_waterfill_str(global.last_cursor_stack_name[event.player_index]) then
				player.character.character_build_distance_bonus = player.character.character_build_distance_bonus + settings.global["Noxys_Waterfill-reach-with-waterfill"].value
			end
		elseif is_waterfill_str(global.last_cursor_stack_name[event.player_index]) then
			player.character.character_build_distance_bonus = player.character.character_build_distance_bonus - settings.global["Noxys_Waterfill-reach-with-waterfill"].value
		end
		if cursor_stack and cursor_stack.valid_for_read then
			global.last_cursor_stack_name[event.player_index] = cursor_stack.name
		else
			global.last_cursor_stack_name[event.player_index] = nil
		end
	end
end)
