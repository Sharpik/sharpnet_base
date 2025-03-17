
-- Money nodes
minetest.register_node("sharpnet_base:money_node_1000E", {
	description = "Money 1000E",
 	tiles = {
		"sharpnet_node_money_1000E_top.png",
		"sharpnet_node_money_pallet_bottom.png",
		"sharpnet_node_money_pallet.png",
		"sharpnet_node_money_pallet.png",
		"sharpnet_node_money_pallet.png",
		"sharpnet_node_money_pallet.png"
	}, -- top, bottom, right, left, back, front
	drop = "sharpnet_base:money_node_1000E",
 	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults()
 })

--- Trowed nodes
-- Bricks
for _, row in ipairs(dye_colors_16) do
	local dye_name = row[1]
	local dye_desc = row[2]
	minetest.register_node("sharpnet_base:brick_trowed_"..dye_name, {
		description = "Brick Block Trowed - "..dye_desc,
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"sharpnet_node_trowel_wall_"..dye_name..".png",},
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
	minetest.register_node("sharpnet_base:cobble_trowed_"..dye_name, {
		description = "Cobblestone Trowed - "..dye_desc,
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"sharpnet_node_trowel_wall_"..dye_name..".png"},
		drop = "default_cobble",
		is_ground_content = false,
		groups = {cracky = 3, stone = 2},
		sounds = default.node_sound_stone_defaults()
	})
end

