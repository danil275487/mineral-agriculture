--Tree spawning function
for _,ore in pairs(ores) do
	mineral_agriculture["grow_new_"..ore.name.."_ore_tree"] = function(pos)
		minetest.place_schematic({x = pos.x - 3, y = pos.y - 1, z = pos.z - 3},minetest.get_modpath("mineral_agriculture").."/schems/"..ore.name.."_tree.mts", "random", nil, false)
	end
end

--Grow tree function
local function grow_sapling(pos)
	if not default.can_grow(pos) then
		minetest.get_node_timer(pos):start(300)
		return
	end
	local node = minetest.get_node(pos)
	for _,ore in pairs(ores) do
		if node.name == "mineral_agriculture:"..ore.name.."_sapling" then
			minetest.log("action", "A "..ore.name.." sapling grows into a tree at "..minetest.pos_to_string(pos))
			minetest.remove_node(pos)
			mineral_agriculture["grow_new_"..ore.name.."_ore_tree"](pos)
		end
	end
end

--Register nodes
for _,ore in pairs(ores) do
	--Ore log
	minetest.register_node("mineral_agriculture:"..ore.name.."_tree", {
		description = ore.desc.." Tree",
		tiles = {"default_tree_top.png^default_mineral_"..ore.name..".png", "default_tree_top.png^default_mineral_"..ore.name..".png", "default_tree.png^default_mineral_"..ore.name..".png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, flammable = 2},
		drop = {
			max_items = 2,
			items = {
				{
					items = {"default:"..ore.item},
				},
				{
					items = {"default:tree"},
				}
			}
		},
		sounds = default.node_sound_wood_defaults(),
		on_place = minetest.rotate_node
	})

	--Ore leaves
	minetest.register_node("mineral_agriculture:"..ore.name.."_leaves", {
		description = ore.desc.." Tree Leaves",
		drawtype = "allfaces_optional",
		waving = 1,
		tiles = {"default_leaves.png^mineral_agriculture_"..ore.name.."_leaves_overlay.png"},
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 2,
			items = {
				{
					items = {"mineral_agriculture:"..ore.name.."_sapling"},
					rarity = 20,
				},
				{
					items = {"default:"..ore.item},
					rarity = 2,
				},
				{
					items = {"default:leaves"},
				}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})

	--Ore sapling
	minetest.register_node("mineral_agriculture:"..ore.name.."_sapling", {
		description = ore.desc.." Tree Sapling",
		drawtype = "plantlike",
		tiles = {"mineral_agriculture_"..ore.name.."_sapling.png"},
		inventory_image = "mineral_agriculture_"..ore.name.."_sapling.png",
		wield_image = "mineral_agriculture_"..ore.name.."_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_sapling,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(600, 1200))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"mineral_agriculture:"..ore.name.."_sapling",
				{x = -3, y = 1, z = -3},
				{x = 3, y = 6, z = 3},
				4)

			return itemstack
		end,
	})

	--Ore sapling craft recipe
	minetest.register_craft({
		output = "mineral_agriculture:"..ore.name.."_sapling",
		recipe = {
			{"default:"..ore.item, "default:"..ore.item, "default:"..ore.item},
			{"default:"..ore.item, "default:sapling", "default:"..ore.item},
			{"default:"..ore.item, "default:"..ore.item, "default:"..ore.item},
		}
	})
end
