-- Recipes Alcohols
--[[
minetest.register_craft( {
 	output = "basic_materials:copper_wire 2",
 	type = "shapeless",
 	recipe = {
 		"default:copper_ingot",
 		"basic_materials:empty_spool",
 		"basic_materials:empty_spool",
 	},
 })

minetest.register_craft( {
 	output = "basic_materials:steel_strip 12",
 	recipe = {
 		{ "", "default:steel_ingot", "" },
 		{ "default:steel_ingot", "", "" },
 	},
 })

minetest.register_craft({
	output = "technic:raw_latex 2",
	type = "cooking",
	recipe = "moretrees:rubber_tree_trunk",
	cooktime = 4
})

]]


