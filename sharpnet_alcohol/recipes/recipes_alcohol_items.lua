-- Recipes Alcohols
--[[

type = "shapeless",

type = "cooking",
cooktime = 4

]]

-- Alcohol items

minetest.register_craft( {
 	output = "sharpnet_alcohol:test_tube_alc_0 1",
 	recipe = {
 		{ "sharpnet_base:test_tube_empty", "farming:wheat" }
 	}
})

-- Alcohol nodes

minetest.register_craft( {
 	output = "sharpnet_alcohol:barell 2",
 	recipe = {
 		{ "default:wood", "stairs:slab_wood", "default:wood" },
 		{ "default:wood", "", "default:wood" },
		{ "default:wood", "stairs:slab_wood", "default:wood" }
 	}
})

-- Ethereal Alcohol
if (minetest.get_modpath("ethereal") ~= nil) then

minetest.register_craft( {
 	output = "sharpnet_alcohol:barell_wine_white 1",
 	recipe = {
 		{ "ethereal:vine", "ethereal:vine", "ethereal:vine" },
 		{ "ethereal:vine", "sharpnet_alcohol:barell", "ethereal:vine" },
		{ "ethereal:vine", "ethereal:vine", "ethereal:vine" }
 	}
})

minetest.register_craft( {
 	output = "sharpnet_alcohol:barell_wine_red 1",
 	recipe = {
 		{ "ethereal:vine", "dye:red", "ethereal:vine" },
 		{ "ethereal:vine", "sharpnet_alcohol:barell", "ethereal:vine" },
		{ "ethereal:vine", "ethereal:vine", "ethereal:vine" }
 	}
})

end

-- Alcohols

minetest.register_craft( {
 	output = "sharpnet_alcohol:wine_red 8",
 	recipe = {
 		{ "sharpnet_base:bottle_empty", "sharpnet_base:bottle_empty", "sharpnet_base:bottle_empty" },
 		{ "sharpnet_base:bottle_empty", "sharpnet_alcohol:barell_wine_red", "sharpnet_base:bottle_empty" },
		{ "sharpnet_base:bottle_empty", "sharpnet_base:bottle_empty", "sharpnet_base:bottle_empty" }
 	}
})

minetest.register_craft( {
 	output = "sharpnet_alcohol:wine_white 8",
 	recipe = {
 		{ "sharpnet_base:bottle_empty", "sharpnet_base:bottle_empty", "sharpnet_base:bottle_empty" },
 		{ "sharpnet_base:bottle_empty", "sharpnet_alcohol:barell_wine_white", "sharpnet_base:bottle_empty" },
		{ "sharpnet_base:bottle_empty", "sharpnet_base:bottle_empty", "sharpnet_base:bottle_empty" }
 	}
})

minetest.register_craft( {
 	output = "sharpnet_alcohol:wine_red_glass 3",
 	recipe = {
 		{ "sharpnet_alcohol:wine_red" }
 	}
})

minetest.register_craft( {
 	output = "sharpnet_alcohol:wine_white_glass 3",
 	recipe = {
 		{ "sharpnet_alcohol:wine_white" }
 	}
})

minetest.register_craft( {
 	output = "sharpnet_alcohol:beer 1",
 	recipe = {
		{ "sharpnet_base:bottle_empty", "" },
 		{ "sharpnet_alcohol:test_tube_alc_05", "farming:wheat" }
 	}
})

minetest.register_craft( {
 	output = "sharpnet_alcohol:whiskey 1",
 	recipe = {
		{ "sharpnet_base:bottle_empty", "" },
 		{ "sharpnet_alcohol:test_tube_alc_40", "farming:wheat" }
 	}
})

minetest.register_craft( {
 	output = "sharpnet_alcohol:vodka 1",
 	recipe = {
		{ "sharpnet_base:bottle_empty", "" },
 		{ "sharpnet_alcohol:test_tube_alc_40", "" }
 	}
})

minetest.register_craft( {
	output = "sharpnet_alcohol:rum 1",
	recipe = {
		{ "sharpnet_base:bottle_empty", "" },
		{ "sharpnet_alcohol:test_tube_alc_40", "default:papyrus" }
	}
})

minetest.register_craft( {
	output = "sharpnet_alcohol:tequilla_s 1",
	recipe = {
		{ "sharpnet_base:bottle_empty", "" },
		{ "sharpnet_alcohol:test_tube_alc_40", "default:cactus" }
	}
})

minetest.register_craft( {
	output = "sharpnet_alcohol:tequilla_g 1",
	recipe = {
		{ "sharpnet_base:bottle_empty"," default:cactus"},
		{ "sharpnet_alcohol:test_tube_alc_40", "default:cactus" }
	}
})

-- Alcohol with farming Redo
if farming and farming.mod == "redo" then

	

end

-- Alcohol brewing

minetest.register_craft({
	output = "sharpnet_alcohol:test_tube_alc_05",
	type = "cooking",
	recipe = "sharpnet_alcohol:test_tube_alc_00",
	cooktime = 4
})
minetest.register_craft({
	output = "sharpnet_alcohol:test_tube_alc_10",
	type = "cooking",
	recipe = "sharpnet_alcohol:test_tube_alc_05",
	cooktime = 4
})
minetest.register_craft({
	output = "sharpnet_alcohol:test_tube_alc_20",
	type = "cooking",
	recipe = "sharpnet_alcohol:test_tube_alc_10",
	cooktime = 8
})
minetest.register_craft({
	output = "sharpnet_alcohol:test_tube_alc_30",
	type = "cooking",
	recipe = "sharpnet_alcohol:test_tube_alc_20",
	cooktime = 8
})
minetest.register_craft({
	output = "sharpnet_alcohol:test_tube_alc_40",
	type = "cooking",
	recipe = "sharpnet_alcohol:test_tube_alc_30",
	cooktime = 8
})
minetest.register_craft({
	output = "sharpnet_alcohol:test_tube_alc_50",
	type = "cooking",
	recipe = "sharpnet_alcohol:test_tube_alc_40",
	cooktime = 8
})
