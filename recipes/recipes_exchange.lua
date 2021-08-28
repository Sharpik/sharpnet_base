-- Recipes
-- minetest.register_craft( {
-- 	output = "basic_materials:copper_wire 2",
-- 	type = "shapeless",
-- 	recipe = {
-- 		"default:copper_ingot",
-- 		"basic_materials:empty_spool",
-- 		"basic_materials:empty_spool",
-- 	},
-- })

-- minetest.register_craft( {
-- 	output = "basic_materials:steel_strip 12",
-- 	recipe = {
-- 		{ "", "default:steel_ingot", "" },
-- 		{ "default:steel_ingot", "", "" },
-- 	},
-- })

-- aliases
--minetest.register_alias("sharpnet:block1",           "sharpnet:block1.0")

-- Food

-- Grass
minetest.register_craft( {
 	output = "default:dirt_with_grass",
 	type = "shapeless",
 	recipe = {
 		"default:leaves",
		"default:dirt",
 	},
})

minetest.register_craft( {
 	output = "default:dirt_with_dry_grass",
 	type = "shapeless",
 	recipe = {
 		"default:acacia_leaves",
		"default:dirt",
 	},
})

-- Wheet to seeds
if farming then

 minetest.register_craft( {
 	output = "farming:seed_wheat 2",
 	type = "shapeless",
 	recipe = {
 		"farming:wheat",
 	},
 })

end

if farming and farming.mod == "redo" then

 minetest.register_craft( {
 	output = "farming:seed_barley 2",
 	type = "shapeless",
 	recipe = {
 		"farming:barley",
 	},
 })
 minetest.register_craft( {
 	output = "farming:seed_oat 2",
 	type = "shapeless",
 	recipe = {
 		"farming:oat",
 	},
 })

end
 
 -- More trees + Technics mods recipes
 if (minetest.get_modpath("moretrees") ~= nil) and (minetest.get_modpath("technic") ~= nil) then
 
	minetest.register_craft({
		output = "technic:raw_latex 2",
		type = "cooking",
		recipe = "moretrees:rubber_tree_trunk",
		cooktime = 4
	})
    
    technic.register_extractor_recipe({ input = {"moretrees:rubber_tree_trunk"}, output = {"technic:raw_latex 4"}})

 end
 
  -- Ethereal mods recipes
 if (minetest.get_modpath("ethereal") ~= nil) then
 
	minetest.register_craft( {
 	output = "ethereal:charcoal_lump",
 	type = "shapeless",
 	recipe = {
 		"default:coal_lump",
 	},
 	})
	
	minetest.register_craft( {
 	output = "ethereal:grove_dirt",
 	type = "shapeless",
 	recipe = {
 		"ethereal:bananaleaves",
		"default:dirt",
 	},
 	})
	
	minetest.register_craft( {
 	output = "ethereal:prairie_dirt",
 	type = "shapeless",
 	recipe = {
 		"ethereal:orange_leaves",
		"default:dirt",
 	},
 	})
	
	minetest.register_craft( {
 	output = "ethereal:bamboo_dirt",
 	type = "shapeless",
 	recipe = {
 		"ethereal:bamboo_leaves",
		"default:dirt",
 	},
 	})

 end
 
   -- Hardened Clay + Baked Clay mods recipes
 if (minetest.get_modpath("hardenedclay") ~= nil) and (minetest.get_modpath("bakedclay") ~= nil) then
 
 	-- Fix for missing recipe after baked clay furnance recipe substitution
	minetest.register_craft( {
 	output = "hardenedclay:hardened_clay",
 	type = "shapeless",
 	recipe = {
 		"bakedclay:natural"
 	},
 	})
	
 end