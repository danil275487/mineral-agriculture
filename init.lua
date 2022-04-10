ore_crops = {}
ores = {
	{
		name = "coal",
		desc = "Coal",
		item = "coal_lump"
	},
	{
		name = "iron",
		desc = "Iron",
		item = "iron_lump"
	},
	{
		name = "copper",
		desc = "Copper",
		item = "copper_lump"
	},
	{
		name = "tin",
		desc = "Tin",
		item = "tin_lump"
	},
	{
		name = "gold",
		desc = "Gold",
		item = "gold_lump"
	},
	{
		name = "mese",
		desc = "Mese",
		item = "mese_crystal"
	},
	{
		name = "diamond",
		desc = "Diamond",
		item = "diamond"
	},
}


dofile(minetest.get_modpath("ore_crops").."/trees.lua")
dofile(minetest.get_modpath("ore_crops").."/crops.lua")
