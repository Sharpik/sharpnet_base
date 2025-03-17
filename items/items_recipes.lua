
-- area sickle tool recipe
minetest.register_craft({
	output = "sharpnet_base:sickle",
	recipe = {
		{"default:steel_ingot",""},
		{"", "default:stick"},
		{"default:stick",""}
	}
})

--throwel

--painter
minetest.register_craft({
	output = "sharpnet_base:painter_black",
	recipe = {
		{"sharpnet_base:painter","dye:black"}
	}
})
minetest.register_craft({
	output = "sharpnet_base:painter_brown",
	recipe = {
		{"sharpnet_base:painter","dye:brown"}
	}
})

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

-- Technics mods
 if technic and (minetest.get_modpath("technic") ~= nil) then
 
		minetest.register_craft({
		output = "sharpnet_base:pick_carbon_steel",
		recipe = {
			{"technic:carbon_steel_ingot", "technic:carbon_steel_ingot", "technic:carbon_steel_ingot"},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})
	
	minetest.register_craft({
		output = "sharpnet_base:shovel_carbon_steel",
		recipe = {
			{"technic:carbon_steel_ingot"},
			{"group:stick"},
			{"group:stick"}
		}
	})
	
	minetest.register_craft({
		output = "sharpnet_base:axe_carbon_steel",
		recipe = {
			{"technic:carbon_steel_ingot", "technic:carbon_steel_ingot"},
			{"technic:carbon_steel_ingot", "group:stick"},
			{"", "group:stick"}
		}
	})

	minetest.register_craft({
		output = "sharpnet_base:sword_carbon_steel",
		recipe = {
			{"technic:carbon_steel_ingot"},
			{"technic:carbon_steel_ingot"},
			{"group:stick"}
		}
	})

end