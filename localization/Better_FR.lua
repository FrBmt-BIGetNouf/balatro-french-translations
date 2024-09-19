--- STEAMODDED HEADER
--- MOD_NAME: Better French
--- MOD_ID: Better_FR
--- MOD_AUTHOR: [The Balatro FR Loc Mod Community]
--- MOD_DESCRIPTION: A humble community-made version of the French localization of Balatro
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]

----------------------------------------------
------------MOD CODE -------------------------

G.F_NO_ACHIEVEMENTS = false

local mod = SMODS.current_mod

local function apply_sprites()
	sendDebugMessage("Application des sprites...")

	local sprite_bstr = SMODS.Atlas { key = "Booster", px = 71, py = 95, path = "boosters.png", prefix_config = { key = false } }
	local sprite_trts = SMODS.Atlas { key = "Tarot", px = 71, py = 95, path = "Tarots.png", prefix_config = { key = false } }
	local sprite_vchr = SMODS.Atlas { key = "Voucher", px = 71, py = 95, path = "Vouchers.png", prefix_config = { key = false } }
	local sprite_icon = SMODS.Atlas { key = "icons", px = 66, py = 66, path = "icons.png", prefix_config = { key = false } }
	local sprite_blch = SMODS.Atlas { key = "blind_chips", px = 34, py = 34, path = "BlindChips.png", atlas_table = "ANIMATION_ATLAS", frames = 21, prefix_config = { key = false } }
	local sprite_jokr = SMODS.Atlas { key = "Joker", px = 71, py = 95, path = "Jokers.png", prefix_config = { key = false } }
	local sprite_shop = SMODS.Atlas { key = "shop_sign", px = 71, py = 95, path = "ShopSignAnimation.png", atlas_table = "ANIMATION_ATLAS", frames = 4, prefix_config = { key = false } }
end

local function apply_font()
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
end

if G.LANG.key == "fr" then
	apply_patch()
end

G.set_language_ref = G.set_language
function G:set_language()
	self:set_language_ref()

	if self.LANG.key == "fr" then
		apply_patch()
	end
end

------------MOD CODE END----------------------
----------------------------------------------

