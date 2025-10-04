 -- Nodes alcohols functions
function sh_register_alcohol_node(name, texture, desc, strenght, flamability)

	minetest.register_node("sharpnet_alcohol:"..name, {
	description = desc,
 	tiles = {texture},
	inventory_image = texture,
	wield_image = texture,
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
 	is_ground_content = false,
	groups = {cracky = 1, dig_immediate = 3, flammable = 3},
	sounds = default.node_sound_glass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16},
	},
	_tnt_loss = flamability,
	on_use = minetest.item_eat(strenght)
 	})
	
end

