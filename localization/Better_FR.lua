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

    local function apply_patch()
        G.localization = assert(loadstring(love.filesystem.read(lang_path)))()
        init_localization()
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
