--- Trowed nodes

-- Bricks
for _, row in ipairs(dye_colors_16) do
	local dye_name = row[1]
	local dye_desc = row[2]
	minetest.register_node("sharpnet_throwel:brick_trowed_"..dye_name, {
		description = "Brick Block Trowed - "..dye_desc,
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"sh_node_trowel_wall_"..dye_name..".png",},
		drop = "default:brick",
		is_ground_content = false,
		groups = {cracky = 3},
		sounds = default.node_sound_stone_defaults(),
	})
end

-- Coble
for _, row in ipairs(dye_colors_16) do
	local dye_name = row[1]
	local dye_desc = row[2]
	minetest.register_node("sharpnet_throwel:cobble_trowed_"..dye_name, {
		description = "Cobblestone Trowed - "..dye_desc,
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"sh_node_trowel_wall_"..dye_name..".png"},
		drop = "default:cobble",
		is_ground_content = false,
		groups = {cracky = 3, stone = 2},
		sounds = default.node_sound_stone_defaults()
	})
end
