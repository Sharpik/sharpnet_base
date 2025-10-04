
--throwel
minetest.register_craft({
	output = "sharpnet_throwel:trowel",
	recipe = {
		{"", "group:stick", ""},
		{"default:steel_ingot", "default:steel_ingot", ""}
	}
})
minetest.register_craft({
	output = "sharpnet_throwel:trowel_filled",
	recipe = {
		{"sharpnet_throwel:trowel", "default:clay_lump"}
	}
})
