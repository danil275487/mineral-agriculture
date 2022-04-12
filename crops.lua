--i hate farming mod

for _,ore in pairs(ores) do
	farming.register_plant("ore_crops:"..ore.name.."_crop", {
		description = ore.desc.." Seed",
		harvest_description = ore.desc,
		paramtype2 = "meshoptions",
		inventory_image = "ore_crops_"..ore.name.."_leaves_overlay.png",
		steps = 8,
		minlight = 13,
		maxlight = default.LIGHT_MAX,
		fertility = {"grassland"},
		groups = {food_wheat = 1, flammable = 4},
		place_param2 = 3,
	})

	--This might be a bit hacky, but what else can I do?
	minetest.unregister_item("ore_crops:"..ore.name.."_crop")

	--Override plant nodes to not use the harvested item (removed earlier)
	for i = 1, 8 do
		local base_rarity = 1
		if 8 ~= 1 then
			base_rarity =  8 - (i - 1) * 7 / (8 - 1)
		end

		minetest.override_item("ore_crops:"..ore.name.."_crop_"..i, {
			drop = {
				items = {
					{items = {"default:"..ore.item}, rarity = base_rarity},
					{items = {"default:"..ore.item}, rarity = base_rarity * 2},
					{items = {"ore_crops:seed_"..ore.name.."_crop"}, rarity = base_rarity},
					{items = {"ore_crops:seed_"..ore.name.."_crop"}, rarity = base_rarity * 2},
				}
			}
		})
	end

	--Ore seed craft recipe
	minetest.register_craft({
		output = "ore_crops:seed_"..ore.name.."_crop 4",
		recipe = {
			{"default:"..ore.item},
		}
	})

	minetest.register_craft({
		output = "default:"..ore.item,
		recipe = {
			{"ore_crops:seed_"..ore.name.."_crop ","ore_crops:seed_"..ore.name.."_crop "},
			{"ore_crops:seed_"..ore.name.."_crop ","ore_crops:seed_"..ore.name.."_crop "}
		}
	})
end
