
if minetest.get_modpath("3d_armor") then

--    minetest.register_craft({
--        output = "sharpnet_base:helmet",
--        recipe = {
--            {"sharpnet_base:ingot", "sharpnet_base:ingot", "sharpnet_base:ingot"},
--            {"sharpnet_base:ingot", "", "sharpnet_base:ingot"},
--            {"", "", ""},
--        }
--    })

    minetest.register_craft({
        output = "sharpnet_base:chestplate_tshirt_black",
        recipe = {
            {"", "sharpnet_base:cloth_black", ""},
            {"sharpnet_base:cloth_black", "sharpnet_base:cloth_white", "sharpnet_base:cloth_black"},
            {"", "sharpnet_base:cloth_black", ""},
        }
    })

--    minetest.register_craft({
--        output = "sharpnet_base:leggings",
--        recipe = {
--            {"sharpnet_base:ingot", "sharpnet_base:ingot", "sharpnet_base:ingot"},
--            {"sharpnet_base:ingot", "", "sharpnet_base:ingot"},
--            {"sharpnet_base:ingot", "", "sharpnet_base:ingot"},
--        }
--    })

--    minetest.register_craft({
--        output = "sharpnet_base:boots",
--        recipe = {
--            {"sharpnet_base:ingot", "", "sharpnet_base:ingot"},
--            {"sharpnet_base:ingot", "", "sharpnet_base:ingot"},
--        }
--    })

--    minetest.register_craft({
--        output = "sharpnet_base:shield",
--        recipe = {
--            {"sharpnet_base:ingot", "sharpnet_base:ingot", "sharpnet_base:ingot"},
--            {"sharpnet_base:ingot", "sharpnet_base:ingot", "sharpnet_base:ingot"},
--            {"", "sharpnet_base:ingot", ""},
--        }
--    })
end
