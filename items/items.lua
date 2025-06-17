-- items

-- Cloth

minetest.register_craftitem("sharpnet_base:cloth_white", {
	description = "Cloth (white)",
	inventory_image = "sharpnet_cloth_white.png",
	groups = { crumbly = 3 },
})

minetest.register_craftitem("sharpnet_base:cloth_black", {
	description = "Cloth (black)",
	inventory_image = "sharpnet_cloth_black.png",
	groups = { crumbly = 3 },
})


 -- Technics mods
 if technic and (minetest.get_modpath("technic") ~= nil) then
	
	minetest.register_tool("sharpnet_base:pick_carbon_steel", {
	description = "Carbon Steel Pickaxe",
	inventory_image = "sharpnet_item_carbonsteel_pickaxe.png",
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
		inventory_image = "sharpnet_item_carbonsteel_shovel.png",
		wield_image = "sharpnet_item_carbonsteel_shovel.png^[transformR90",
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
		inventory_image = "sharpnet_item_carbonsteel_axe.png",
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
		inventory_image = "sharpnet_item_carbonsteel_sword.png",
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
	inventory_image = "sharpnet_item_sickle.png",
	on_use = function(itemstack, user, pointed_thing)
		return sickle_on_use(itemstack, user, pointed_thing, 560)
	end,
})


-- trowel function
local function trowel_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing

	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local pos = {x=pt.under.x, y=pt.under.y, z=pt.under.z}
	local target_node = minetest.get_node_or_nil(pos)

	-- return if node is not registered
	if not minetest.registered_nodes[target_node.name] then
		return
	end

	--debug
	--minetest.chat_send_player(user:get_player_name()," target node: " .. target_node.name .. " pt: " .. pos.x .. " ".. pos.z .. "" .. pos.y )
	
	-- List of trowable nodes
	if target_node.name == "default:brick" then
		minetest.set_node(pos, {name = "sharpnet_base:brick_trowed_brown"})
		minetest.sound_play("default_dig_crumbly", {
			pos,
			gain = 0.5,
		})
		if ((itemstack:get_wear()+uses) >= 65535) then
			itemstack:replace("sharpnet_base:trowel")
		else
			itemstack:add_wear(65535/(uses-1))
		end
		
	end
	
	if (target_node.name == "default:cobble") or (target_node.name == "default:stone") then
		minetest.set_node(pos, {name = "sharpnet_base:cobble_trowed_brown"})
		minetest.sound_play("default_dig_crumbly", {
			pos,
			gain = 0.5,
		})
		if ((itemstack:get_wear()+uses) >= 65535) then
			itemstack:replace("sharpnet_base:trowel")
		else
			itemstack:add_wear(65535/(uses-1))
		end
		
	end
	
	return itemstack
end

-- trowel tool register
minetest.register_tool("sharpnet_base:trowel", {
	description = "Trowel",
	inventory_image = "sharpnet_item_trowel.png"
})
minetest.register_tool("sharpnet_base:trowel_filled", {
	description = "Trowel - filled",
	inventory_image = "sharpnet_item_trowel.png",
	on_use = function(itemstack, user, pointed_thing)
		return trowel_on_use(itemstack, user, pointed_thing, 64)
	end,
})

-- painter functions
local function painter_paint(target_node, to_node, user, itemstack, pos, uses)
--debug
--minetest.chat_send_player(user:get_player_name(),"itemstack:get_wear(): " .. itemstack:get_wear() .. " uses: " .. uses)
		minetest.set_node(pos, {name = to_node})
		minetest.sound_play("default_dig_crumbly", {
			pos,
			gain = 0.5,
		})
		if ((itemstack:get_wear()+uses) >= 65535) then
			itemstack:replace("sharpnet_base:painter")
		else
			itemstack:add_wear(65535/(uses-1))
		end
	return itemstack
end

local function painter_on_use(itemstack, color, user, pointed_thing, uses)
	local pt = pointed_thing

	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local pos = {x=pt.under.x, y=pt.under.y, z=pt.under.z}
	local target_node = minetest.get_node_or_nil(pos)

	-- return if node is not registered
	if not minetest.registered_nodes[target_node.name] then
		return
	end

	--debug
	--minetest.chat_send_player(user:get_player_name()," target node: " .. target_node.name .. " pt: " .. pos.x .. " ".. pos.z .. "" .. pos.y )
	
	if string.find(target_node.name, "sharpnet_base:brick_trowed_") then
		painter_paint(target_node, "sharpnet_base:brick_trowed_" .. color, user, itemstack, pos, uses)
	elseif string.find(target_node.name, "sharpnet_base:cobble_trowed_") then
		painter_paint(target_node, "sharpnet_base:cobble_trowed_" .. color, user, itemstack, pos, uses)
	-- Streets mod support
	elseif (minetest.get_modpath("streets") ~= nil) then
		if string.find(target_node.name, "streets:asphalt") then
			if (color == "white") then
				painter_paint(target_node, "streets:sidewalk", user, itemstack, pos, uses)
			elseif (color == "blue") then
				painter_paint(target_node, "streets:asphalt_blue", user, itemstack, pos, uses)
			elseif (color == "red") then
				painter_paint(target_node, "streets:asphalt_red", user, itemstack, pos, uses)
			end
		elseif string.find(target_node.name, "streets:asphalt_blue") then
			if (color == "black") then
				painter_paint(target_node, "streets:asphalt", user, itemstack, pos, uses)
			elseif (color == "red") then
				painter_paint(target_node, "streets:asphalt_red", user, itemstack, pos, uses)
			end
		elseif string.find(target_node.name, "streets:asphalt_red") then
			if (color == "black") then
				painter_paint(target_node, "streets:asphalt", user, itemstack, pos, uses)
			elseif (color == "blue") then
				painter_paint(target_node, "streets:asphalt_blue", user, itemstack, pos, uses)
			end
		end
	end
	
	return itemstack
end

-- painter tool register
minetest.register_tool("sharpnet_base:painter", {
	description = "Painter",
	inventory_image = "sharpnet_item_painter.png",
})
for _, row in ipairs(dye_colors_16) do
	local dye_name = row[1]
	local dye_desc = row[2]
	minetest.register_tool("sharpnet_base:painter_"..dye_name, {
		description = "Painter - "..dye_desc,
		inventory_image = "sharpnet_item_painter_"..dye_name..".png",
		on_use = function(itemstack, user, pointed_thing)
			return painter_on_use(itemstack, dye_name, user, pointed_thing, 64)
		end,
	})
end

