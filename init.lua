mineral_agriculture = {}

--Various ores
ores = {
	{
		name = "coal",
		desc = "Coal",
		item = "coal_lump",
	},
	{
		name = "iron",
		desc = "Iron",
		item = "iron_lump",
	},
	{
		name = "copper",
		desc = "Copper",
		item = "copper_lump",
	},
	{
		name = "tin",
		desc = "Tin",
		item = "tin_lump",
	},
	{
		name = "gold",
		desc = "Gold",
		item = "gold_lump",
	},
	{
		name = "mese",
		desc = "Mese",
		item = "mese_crystal",
	},
	{
		name = "diamond",
		desc = "Diamond",
		item = "diamond",
	},
}

if minetest.get_modpath("moreores") then
	table.insert(ores, {name = "silver", desc = "Silver", item = "mithril_lump"})
	table.insert(ores, {name = "mithril", desc = "Mithril", item = "mithril_lump"})
end

dofile(minetest.get_modpath("mineral_agriculture").."/trees.lua")
dofile(minetest.get_modpath("mineral_agriculture").."/crops.lua")
dofile(minetest.get_modpath("mineral_agriculture").."/mod_support.lua")
