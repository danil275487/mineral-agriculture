mineral_agriculture = {}

--Various ores
ores = {
	{
		name = "coal",
		desc = "Coal",
		item = "coal_lump",
		time_min = 600,
		time_max = 1200
	},
	{
		name = "iron",
		desc = "Iron",
		item = "iron_lump",
		time_min = 700,
		time_max = 1400
	},
	{
		name = "copper",
		desc = "Copper",
		item = "copper_lump",
		time_min = 800,
		time_max = 1600
	},
	{
		name = "tin",
		desc = "Tin",
		item = "tin_lump",
		time_min = 900,
		time_max = 1900
	},
	{
		name = "gold",
		desc = "Gold",
		item = "gold_lump",
		time_min = 1000,
		time_max = 2000
	},
	{
		name = "mese",
		desc = "Mese",
		item = "mese_crystal",
		time_min = 1100,
		time_max = 2200
	},
	{
		name = "diamond",
		desc = "Diamond",
		item = "diamond",
		time_min = 1200,
		time_max = 2400
	},
}

dofile(minetest.get_modpath("mineral_agriculture").."/trees.lua")
dofile(minetest.get_modpath("mineral_agriculture").."/crops.lua")
dofile(minetest.get_modpath("mineral_agriculture").."/mod_support.lua")
