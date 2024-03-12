-- items

-- Cloth

minetest.register_craftitem("sharpnet_base:cloth_white", {
	description = "Cloth (white)",
	inventory_image = "sharpnet_item_cloth_white.png",
	groups = { crumbly = 3 },
})

minetest.register_craftitem("sharpnet_base:cloth_black", {
	description = "Cloth (black)",
	inventory_image = "sharpnet_item_cloth_black.png",
	groups = { crumbly = 3 },
})


 -- Technics mods
 if technic and (minetest.get_modpath("technic") ~= nil) then
	
	minetest.register_tool("sharpnet_base:pick_carbon_steel", {
	description = "Carbon Steel Pickaxe",
	inventory_image = "carbonsteel_pickaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=3.60, [2]=1.50, [3]=0.70}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
	})

	minetest.register_tool("sharpnet_base:shovel_carbon_steel", {
		description = "Carbon Steel Shovel",
		inventory_image = "carbonsteel_shovel.png",
		wield_image = "carbonsteel_shovel.png^[transformR90",
		tool_capabilities = {
			full_punch_interval = 1.1,
			max_drop_level=1,
			groupcaps={
				crumbly = {times={[1]=1.30, [2]=0.80, [3]=0.35}, uses=40, maxlevel=3},
			},
			damage_groups = {fleshy=3},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {shovel = 1}
	})

	minetest.register_tool("sharpnet_base:axe_carbon_steel", {
		description = "Carbon Steel Axe",
		inventory_image = "carbonsteel_axe.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.30, [2]=1.20, [3]=0.80}, uses=30, maxlevel=3},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {axe = 1}
	})

	minetest.register_tool("sharpnet_base:sword_carbon_steel", {
		description = "Carbon Steel Sword",
		inventory_image = "carbonsteel_sword.png",
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
				snappy={times={[1]=2.3, [2]=1.0, [3]=0.30}, uses=40, maxlevel=3},
			},
			damage_groups = {fleshy=6},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {sword = 1}
	})

	--Recipes
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
	
--Tame tool
minetest.register_tool("sharpnet_base:mob_tame_tool", {
	description = "Mob tame tool",
	inventory_image = "default_stick.png^[colorize:#ff000050",
	stack_max = 1,
	--groups = {not_in_creative_inventory = 1},
	groups = {tool = 1},

	on_use = function(itemstack, user, pointed_thing)
		local max_uses = 1
		
		if pointed_thing.type ~= "object" then
			return
		end

		local obj = pointed_thing.ref

		local control = user:get_player_control()
		local sneak = control and control.sneak

		if obj and not sneak then

			local self = obj:get_luaentity()
			
			self.owner = user:get_player_name()
			self.tamed = true
		end
		
		itemstack:add_wear(65535 / (max_uses - 1))
		
		-- display form to enter owner name
		if obj and sneak then

			local self = obj:get_luaentity()
			local owner = self.owner

			if type(owner) ~= "string" then
				owner = ""
			end

			local name = user:get_player_name()

			minetest.show_formspec(name, "sh_set_owner", "size[8,4]"
			.. "field[0.5,1;7.5,0;name;"
			.. "Enter owner name:" .. ";" .. owner .. "]"
			.. "button_exit[2.5,3.5;3,1;sh_change_owner;"
			.. "Change" .. "]")
		end
		
	end
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	-- right-clicked with tame tool
	if formname == "sh_set_owner"
	and fields.name
	and fields.name ~= "" then

		-- does mob still exist?
		if not obj
		or not obj:get_luaentity() then
			return
		end

		local item = player:get_wielded_item()

		if item:get_name() ~= "sharpnet_base:mob_tame_tool" then
			return
		end

		-- limit name entered to 64 characters long
		if fields.name:len() > 64 then
			fields.name = fields.name:sub(1, 64)
		end

		local self = obj:get_luaentity()

		self.owner = fields.name
		self.tamed = true
		
		self:update_tag(self.owner)
		self:update_tag(self.tamed)

		-- reset external variable
		obj = nil
	end
end)

-----------------------------------------------------------------------------------------------
-- Area sickle
-----------------------------------------------------------------------------------------------
-- Area sickle function
local function sickle_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	
	local radius = 2
	
	for iz = radius, -radius, -1
	do
		for ix = radius, -radius, -1
		do
			-- check if pointing at a node
			if not pt then
				return
			end
			if pt.type ~= "node" then
				return
			end

			local pos = {x=pt.under.x+ix, y=pt.under.y, z=pt.under.z+iz}
			local target_node = minetest.get_node(pos)

			-- return if any of the nodes is not registered
			if not minetest.registered_nodes[target_node.name] then
				return
			end

			-- check if something that can be cut using fine tools
			--minetest.chat_send_player(user:get_player_name(), user:get_player_name() .. " (x:" .. pos.x .. " y:" .. pos.y .. " z:" .. pos.z .. ") " .. " snappy: " .. minetest.get_item_group(target_node.name, "snappy") .. " node: " .. target_node.name .. " ix:" .. ix .. " iz:" .. iz)
			if minetest.get_item_group(target_node.name, "snappy") > 0 then
				if not minetest.node_dig(pos, target_node, user) then
					return
				end
				minetest.sound_play("default_dig_crumbly", {
					pos,
					gain = 0.5,
				})
				itemstack:add_wear(65535/(uses-1))
				
			end
		end
	end
	return itemstack
end

-- area sickle tool register
minetest.register_tool("sharpnet_base:sickle", {
	description = "Area sickle",
	inventory_image = "dryplants_sickle.png",
	on_use = function(itemstack, user, pointed_thing)
		return sickle_on_use(itemstack, user, pointed_thing, 560)
	end,
})
-- area sickle tool recipe
minetest.register_craft({
	output = "sharpnet_base:sickle",
	recipe = {
		{"default:steel_ingot",""},
		{"", "default:stick"},
		{"default:stick",""}
	}
})
