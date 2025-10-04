--init
local MP = minetest.get_modpath(minetest.get_current_modname())
dofile(MP .. "/sh_global.lua")
dofile(MP .. "/items/item_throwel.lua")
dofile(MP .. "/nodes/node_throwel.lua")
dofile(MP .. "/recipes/recipe_throwel.lua")

-- Legacy aliases
-- items
minetest.register_alias("sharpnet_base:brick_trowed_brown", "sharpnet_throwel:brick_trowed_brown")
minetest.register_alias("sharpnet_base:trowel", "sharpnet_throwel:trowel")
minetest.register_alias("sharpnet_base:trowel_filled", "sharpnet_throwel:trowel_filled")
-- nodes
for _, row in ipairs(dye_colors_16) do
	local dye_name = row[1]
	minetest.register_alias("sharpnet_base:brick_trowed_" .. dye_name, "sharpnet_throwel:brick_trowed_" .. dye_name)
	minetest.register_alias("sharpnet_base:cobble_trowed_" .. dye_name, "sharpnet_throwel:cobble_trowed_" .. dye_name)
end
-- END
