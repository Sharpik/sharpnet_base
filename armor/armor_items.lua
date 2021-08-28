
if minetest.get_modpath("3d_armor") then

    -- armor:register_armor("sharpnet_base:helmet", {
    --     description = S("Helmet"),
    --     inventory_image = "sharpnet_base_inv_helmet.png",
    --
    --  groups = {armor_head=1, armor_heal=12, armor_use=100, armor_fire=0},
    --  armor_groups = {fleshy=15},
    --  damage_groups = {cracky=2, snappy=1, level=3},
    --  wear = 0,
    -- })

    armor:register_armor("sharpnet_base:chestplate_tshirt_black", {
        description = S("T-shirt (black)"),
        inventory_image = "sharpnet_base_chestplate_tshirt_black_inv.png",

        groups = {armor_torso=1, armor_heal=2, armor_use=100, armor_fire=0},
        armor_groups = {fleshy=20},
        damage_groups = {cracky=2, snappy=1, level=3},
        wear = 0,
    })

--    armor:register_armor("sharpnet_base:leggings", {
--        description = S("Leggings"),
--        inventory_image = "sharpnet_base_inv_leggings.png",
--
--        groups = {armor_legs=1, armor_heal=12, armor_use=100, armor_fire=0},
--        armor_groups = {fleshy=20},
--        damage_groups = {cracky=2, snappy=1, level=3},
--        wear = 0,
--    })

--    armor:register_armor("sharpnet_base:boots", {
--        description = S("Boots"),
--        inventory_image = "sharpnet_base_inv_boots.png",
--
--        groups = {armor_feet=1, armor_heal=12, armor_use=100, armor_fire=0},
--        armor_groups = {fleshy=15},
--		damage_groups = {cracky=2, snappy=1, level=3},
--        wear = 0,
--    })

--    armor:register_armor("sharpnet_base:shield", {
--        description = S("Shield"),
--        inventory_image = "sharpnet_base_inven_shield.png",
--
--        groups = {armor_shield=1, armor_heal=12, armor_use=100, armor_fire=0},
--        armor_groups = {fleshy=20},
--        damage_groups = {cracky=2, snappy=1, level=3},
--        wear = 0,
--    })
end
