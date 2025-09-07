------------MOD CODE -------------------------

local mod = SMODS.current_mod

local function add_deck_skins()
	local atlas_hig = SMODS.Atlas { key = "fr_8BitDeckhigh", path = "8BitDeck_opt2.png", px = 71, py = 95}
	local atlas_low = SMODS.Atlas { key = "fr_8BitDecklow", path = "8BitDeck.png", px = 71, py = 95}

	local suits = {'Clubs', 'Diamonds', 'Hearts', 'Spades'}
	local rankstable = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace"}
	for _, value in ipairs(suits) do
		SMODS.DeckSkin{
			key = "fr_8BD_"..value,
			suit = value,
			loc_txt = {
				['en'] = "French Face Cards",
				['fr'] = "Cartes françaises"
			},
			palettes = {
				{
					key = "lc", display_ranks = {"Jack", "Queen", "King"}, atlas = atlas_low.key,
					pos_style = 'deck', ranks = rankstable,
				},
				{
					key = "hc", display_ranks = {"Jack", "Queen", "King"}, atlas = atlas_hig.key,
					pos_style = 'deck', ranks = rankstable,
				},
			}
		}
	end
end

local function apply_sprites()
	SMODS.Atlas { key = "Booster", language = 'fr', path = 'boosters.png', px = 71, py = 95, raw_key = true }
	SMODS.Atlas { key = "Tarot", language = 'fr', path = 'Tarots.png', px = 71, py = 95, raw_key = true }
	SMODS.Atlas { key = "Voucher", language = 'fr', path = 'Vouchers.png', px = 71, py = 95, raw_key = true }
	SMODS.Atlas { key = "icons", language = 'fr', path = 'icons.png', px = 66, py = 66, raw_key = true }
	SMODS.Atlas { key = "Joker", language = 'fr', path = 'Jokers.png', px = 71, py = 95, raw_key = true }
	SMODS.Atlas { key = "blind_chips", language = 'fr', path = 'BlindChips.png', px = 34, py = 34, atlas_table = 'animation_atli', frames = 21, raw_key = true }
	SMODS.Atlas { key = "shop_sign", language = 'fr', path = 'ShopSignAnimation.png', px = 113, py = 57, atlas_table = 'animation_atli', frames = 4, raw_key = true }
end

local function apply_font()
	-- This broke because the game does not see the new font, for some reason.
	for _, v in ipairs(G.FONTS) do
		-- If the file exists with the same path in our mod pack, use it instead
		if love.filesystem.getInfo(mod.path .. v.file) then
			v.FONT = love.graphics.newFont(mod.path .. v.file, v.render_scale)
		end
	end
end

local function apply_patch()
	init_localization()
	apply_sprites()
	apply_font()
	add_deck_skins()
end

apply_patch()

------------MOD CODE END----------------------
