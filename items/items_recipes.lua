-- Cloth

if farming and farming.mod == "redo" then
	minetest.register_craft({
		output = "sharpnet_base:cloth_white 3",
		recipe = {
			{"farming:string", "farming:string", ""},
			{"farming:string", "farming:string", ""},
			{"farming:string", "farming:string", ""},
		}
	})
end

minetest.register_craft( {
 	output = "sharpnet_base:cloth_black 8",
 	type = "shapeless",
 	recipe = {
 		"sharpnet_base:cloth_white 8",
		"dye:black 1",
 	},
})
