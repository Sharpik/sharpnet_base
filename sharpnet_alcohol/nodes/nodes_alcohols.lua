-- Nodes alcohols
--register_alcohol_node(name, texture, desc, strenght, flamability)

-- Whiskey
sh_register_alcohol_node("whiskey", "sh_whiskey.png", "Whiskey", 8, 2)
sh_register_alcohol_node("rum", "sh_rum.png", "Rum", 8, 2)
sh_register_alcohol_node("vodka", "sh_vodka.png", "Vodka", 8, 2)
sh_register_alcohol_node("tequilla_s", "sh_tequilla_s.png", "Tequilla Silver", 8, 2)
sh_register_alcohol_node("tequilla_g", "sh_tequilla_g.png", "Tequilla Gold", 8, 2)
sh_register_alcohol_node("beer", "sh_beer.png", "Beer", 2, 0)
sh_register_alcohol_node("wine_red", "sh_wine_red.png", "Wine Red", 5, 0)
sh_register_alcohol_node("wine_white", "sh_wine_white.png", "Wine White", 5, 0)
sh_register_alcohol_node("wine_red_glass", "sh_glass_of_vine_red.png", "Wine Red Glass", 2, 0)
sh_register_alcohol_node("wine_white_glass", "sh_glass_of_vine_white.png", "Wine Red Glass", 2, 0)

-- Barells ----

-- Barell
minetest.register_node("sharpnet_alcohol:barell", {
	description = "Barell",
 	tiles = {
		"sh_barell_bottom.png",
		"sh_barell_bottom.png",
		"sh_barell_side.png",
		"sh_barell_side.png",
		"sh_barell_side.png",
		"sh_barell_side.png"
	}, -- top, bottom, right, left, back, front
	--drop = "sharpnet_alcohol:barell",
 	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults()
 })

-- Barell with red wine
minetest.register_node("sharpnet_alcohol:barell_wine_red", {
	description = "Barell of red wine",
 	tiles = {
		"sh_barell_top_wine.png",
		"sh_barell_bottom.png",
		"sh_barell_side_wine_red.png",
		"sh_barell_side_wine_red.png",
		"sh_barell_side_wine_red.png",
		"sh_barell_side_wine_red.png"
	}, -- top, bottom, right, left, back, front
	--drop = "sharpnet_alcohol:barell_wine_red",
 	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 1},
	sounds = default.node_sound_leaves_defaults()
 })

-- Barell with white wine
minetest.register_node("sharpnet_alcohol:barell_wine_white", {
	description = "Barell of white wine",
 	tiles = {
		"sh_barell_top_wine.png",
		"sh_barell_bottom.png",
		"sh_barell_side_wine_white.png",
		"sh_barell_side_wine_white.png",
		"sh_barell_side_wine_white.png",
		"sh_barell_side_wine_white.png"
	}, -- top, bottom, right, left, back, front
	--drop = "sharpnet_alcohol:barell_wine_white",
 	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 1},
	sounds = default.node_sound_leaves_defaults()
 })

