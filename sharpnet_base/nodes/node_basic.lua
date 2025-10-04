
-- Money nodes
minetest.register_node("sharpnet_base:money_node_1000E", {
	description = "Money 1000E",
 	tiles = {
		"sh_node_money_1000E_top.png",
		"sh_node_money_pallet_bottom.png",
		"sh_node_money_pallet.png",
		"sh_node_money_pallet.png",
		"sh_node_money_pallet.png",
		"sh_node_money_pallet.png"
	}, -- top, bottom, right, left, back, front
	drop = "sharpnet_base:money_node_1000E",
 	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults()
 })
