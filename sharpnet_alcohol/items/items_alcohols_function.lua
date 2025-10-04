-- Items alcohols functions

function sh_register_alcohol_item(name, texture_inv, desc, groups)

	minetest.register_craftitem("sharpnet_alcohol:"..name, {
		description = desc,
		inventory_image = texture_inv,
		groups = groups
	})
	
end
