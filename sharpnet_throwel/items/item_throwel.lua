-- trowel items

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
		minetest.set_node(pos, {name = "sharpnet_throwel:brick_trowed_brown"})
		minetest.sound_play("default_dig_crumbly", {
			pos,
			gain = 0.5,
		})
		if ((itemstack:get_wear()+uses) >= 65535) then
			itemstack:replace("sharpnet_throwel:trowel")
		else
			itemstack:add_wear(65535/(uses-1))
		end
		
	end
	
	if (target_node.name == "default:cobble") or (target_node.name == "default:stone") then
		minetest.set_node(pos, {name = "sharpnet_throwel:cobble_trowed_brown"})
		minetest.sound_play("default_dig_crumbly", {
			pos,
			gain = 0.5,
		})
		if ((itemstack:get_wear()+uses) >= 65535) then
			itemstack:replace("sharpnet_throwel:trowel")
		else
			itemstack:add_wear(65535/(uses-1))
		end
		
	end
	
	return itemstack
end

-- trowel tool register
minetest.register_tool("sharpnet_throwel:trowel", {
	description = "Trowel",
	inventory_image = "sh_item_trowel.png"
})
minetest.register_tool("sharpnet_throwel:trowel_filled", {
	description = "Trowel - filled",
	inventory_image = "sh_item_trowel.png",
	on_use = function(itemstack, user, pointed_thing)
		return trowel_on_use(itemstack, user, pointed_thing, 64)
	end,
})
