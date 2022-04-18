
--Support for bonemeal mod
if minetest.get_modpath("bonemeal") then
	for _,ore in pairs(ores) do
		bonemeal:add_crop({
			{"mineral_agriculture:"..ore.name.."crop_", 8, "mineral_agriculture:seed_"..ore.name.."crop"},
		})

		bonemeal:add_sapling({
			{"mineral_agriculture:"..ore.name.."_sapling", mineral_agriculture["grow_new_"..ore.name.."_ore_tree"], "soil"},
		})
	end
end

if minetest.get_modpath("moreores") then
	--Silver stuff
	minetest.override_item("mineral_agriculture:silver_tree", {
		tiles = {"default_tree_top.png^moreores_mineral_silver.png", "default_tree_top.png^moreores_mineral_silver.png", "default_tree.png^moreores_mineral_silver.png"},
		drop = {
			max_items = 2,
			items = {
				{
					items = {"moreores:silver_lump"},
				},
				{
					items = {"default:tree"},
				}
			}
		},
	})
	minetest.override_item("mineral_agriculture:silver_leaves", {
		drop = {
			max_items = 2,
			items = {
				{
					items = {"mineral_agriculture:silver_sapling"},
					rarity = 20,
				},
				{
					items = {"moreores:silver_lump"},
					rarity = 2,
				},
				{
					items = {"default:leaves"},
				}
			}
		},
	})
	for i = 1, 8 do
		local base_rarity = 1
		if 8 ~= 1 then
			base_rarity =  8 - (i - 1) * 7 / (8 - 1)
		end

		minetest.override_item("mineral_agriculture:silvercrop_"..i, {
			tiles = {"mineral_agriculture_silver_plant_"..i..".png"},
			drop = {
				items = {
					{items = {"moreores:silver_lump"}, rarity = base_rarity},
					{items = {"moreores:silver_lump"}, rarity = base_rarity * 2},
					{items = {"mineral_agriculture:seed_silvercrop"}, rarity = base_rarity},
					{items = {"mineral_agriculture:seed_silvercrop"}, rarity = base_rarity * 2},
				}
			}
		})
	end
	minetest.register_craft({
		output = "mineral_agriculture:seed_silvercrop 4",
		recipe = {
			{"moreores:silver_lump"},
		}
	})
	minetest.register_craft({
		output = "moreores:silver_lump",
		recipe = {
			{"mineral_agriculture:seed_silvercrop ","mineral_agriculture:seed_silvercrop "},
			{"mineral_agriculture:seed_silvercrop ","mineral_agriculture:seed_silvercrop "}
		}
	})
	minetest.register_craft({
		output = "mineral_agriculture:silver_sapling",
		recipe = {
			{"moreores:silver_lump", "moreores:silver_lump", "moreores:silver_lump"},
			{"moreores:silver_lump", "default:sapling", "moreores:silver_lump"},
			{"moreores:silver_lump", "moreores:silver_lump", "moreores:silver_lump"},
		}
	})

	--Mithril stuff
	minetest.override_item("mineral_agriculture:mithril_tree", {
		tiles = {"default_tree_top.png^moreores_mineral_mithril.png", "default_tree_top.png^moreores_mineral_mithril.png", "default_tree.png^moreores_mineral_mithril.png"},
		drop = {
			max_items = 2,
			items = {
				{
					items = {"moreores:mithril_lump"},
				},
				{
					items = {"default:tree"},
				}
			}
		},
	})
	minetest.override_item("mineral_agriculture:mithril_leaves", {
		drop = {
			max_items = 2,
			items = {
				{
					items = {"mineral_agriculture:mithril_sapling"},
					rarity = 20,
				},
				{
					items = {"moreores:mithril_lump"},
					rarity = 2,
				},
				{
					items = {"default:leaves"},
				}
			}
		},
	})
	for i = 1, 8 do
		local base_rarity = 1
		if 8 ~= 1 then
			base_rarity =  8 - (i - 1) * 7 / (8 - 1)
		end

		minetest.override_item("mineral_agriculture:mithrilcrop_"..i, {
			tiles = {"mineral_agriculture_mithril_plant_"..i..".png"},
			drop = {
				items = {
					{items = {"moreores:mithril_lump"}, rarity = base_rarity},
					{items = {"moreores:mithril_lump"}, rarity = base_rarity * 2},
					{items = {"mineral_agriculture:seed_mithrilcrop"}, rarity = base_rarity},
					{items = {"mineral_agriculture:seed_mithrilcrop"}, rarity = base_rarity * 2},
				}
			}
		})
	end
	minetest.register_craft({
		output = "mineral_agriculture:seed_mithrilcrop 4",
		recipe = {
			{"moreores:mithril_lump"},
		}
	})
	minetest.register_craft({
		output = "moreores:mithril_lump",
		recipe = {
			{"mineral_agriculture:seed_mithrilcrop ","mineral_agriculture:seed_mithrilcrop "},
			{"mineral_agriculture:seed_mithrilcrop ","mineral_agriculture:seed_mithrilcrop "}
		}
	})
	minetest.register_craft({
		output = "mineral_agriculture:mithril_sapling",
		recipe = {
			{"moreores:mithril_lump", "moreores:mithril_lump", "moreores:mithril_lump"},
			{"moreores:mithril_lump", "default:sapling", "moreores:mithril_lump"},
			{"moreores:mithril_lump", "moreores:mithril_lump", "moreores:mithril_lump"},
		}
	})
end
