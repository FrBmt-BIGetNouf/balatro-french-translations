--- STEAMODDED HEADER
--- MOD_NAME: Better French
--- MOD_ID: Better_FR
--- MOD_AUTHOR: [The Balatro FR Loc Mod Community]
--- MOD_DESCRIPTION: A humble community-made version of the French localization of Balatro

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.Better_FR()
    G.F_NO_ACHIEVEMENTS = false

    local mod = SMODS.findModByID("Better_FR")
	local lang_path = mod.path.."fr.lua"

    local function apply_sprites()
        local sprite_bstr = SMODS.Sprite:new("Booster", mod.path, "boosters.png", 71, 95, "asset_atli")
        local sprite_trts = SMODS.Sprite:new("Tarot", mod.path, "Tarots.png", 71, 95, "asset_atli")
        local sprite_vchr = SMODS.Sprite:new("Voucher", mod.path, "Vouchers.png", 71, 95, "asset_atli")
        local sprite_icon = SMODS.Sprite:new("icons", mod.path, "icons.png", 66, 66, "asset_atli")
        local sprite_blch = SMODS.Sprite:new("blind_chips", mod.path, "BlindChips.png", 34, 34, "animation_atli", 21)
        local sprite_jokr = SMODS.Sprite:new("Joker", mod.path, "Jokers.png", 71, 95, "asset_atli")
        local sprite_shop = SMODS.Sprite:new("shop_sign", mod.path, "ShopSignAnimation.png", 113, 57, "animation_atli", 4)

        sprite_bstr:register()
        sprite_trts:register()
        sprite_vchr:register()
        sprite_icon:register()
        sprite_blch:register()
        sprite_jokr:register()
        sprite_shop:register()
    end

    local function apply_patch()
        G.localization = assert(loadstring(love.filesystem.read(lang_path)))()
        init_localization()
        apply_sprites()
	end
	
    if love.filesystem.exists(lang_path) and G.LANG.key == "fr" then
        apply_patch()
    end

    G.set_language_ref = G.set_language
    function G:set_language()
        self:set_language_ref()

        if self.LANG.key == "fr" then
            apply_patch()
        end
    end

end

------------MOD CODE END----------------------
----------------------------------------------
