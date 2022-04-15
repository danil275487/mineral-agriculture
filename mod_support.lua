
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
