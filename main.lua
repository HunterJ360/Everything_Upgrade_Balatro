SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "HunterJ360", 
    path = "hunterj360.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "NonCurrencyConsumables", 
    path = "NonCurrencyConsumables.png", 
    px = 72,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "Currencies", 
    path = "Currencies.png", 
    px = 72,
    py = 94, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {35,36,37,46,39,6,38,13,49,11,15,12,41,40,10,9,8,5,14,19,32,23,22,16,34,48,47,28,26,42,4,3,30,20,44,43,29,27,1,45,33,7,25,18,31,17,2,24,21}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {7,2,8,6,4,9,11,13,14,5,10,3,1,12,15}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local enhancementIndexList = {2,1}

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #enhancementIndexList do
        local file_name = files[enhancementIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end


local sealIndexList = {3,2,1}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end


local editionIndexList = {2,1}

local function load_editions_folder()
    local mod_path = SMODS.current_mod.path
    local editions_path = mod_path .. "/editions"
    local files = NFS.getDirectoryItemsInfo(editions_path)
    for i = 1, #editionIndexList do
        local file_name = files[editionIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("editions/" .. file_name))()
        end
    end
end


local voucherIndexList = {2,3,1}

local function load_vouchers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/vouchers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #voucherIndexList do
        local file_name = files[voucherIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. file_name))()
        end
    end
end


local deckIndexList = {2,1,3}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_seals_folder()
load_editions_folder()
load_vouchers_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "EUB_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_EUB_jokers",
    cards = {
        ["j_EUB__57leafclover"] = true,
        ["j_EUB_a5wagyusteak"] = true,
        ["j_EUB_acedia"] = true,
        ["j_EUB_avaritia"] = true,
        ["j_EUB_badapple"] = true,
        ["j_EUB_boundaryofdestruction"] = true,
        ["j_EUB_butterup"] = true,
        ["j_EUB_cagefreeegg"] = true,
        ["j_EUB_coffeearrhythmia"] = true,
        ["j_EUB_condensation"] = true,
        ["j_EUB_couchpotato"] = true,
        ["j_EUB_developerasap"] = true,
        ["j_EUB_egg"] = true,
        ["j_EUB_eulersformula"] = true,
        ["j_EUB_forse"] = true,
        ["j_EUB_fruuuuuuuuuuuuuuuuuuits"] = true,
        ["j_EUB_goldenratio"] = true,
        ["j_EUB_gula"] = true,
        ["j_EUB_halfer"] = true,
        ["j_EUB_hawkingradiation"] = true,
        ["j_EUB_hubbleslaw"] = true,
        ["j_EUB_hunterj360"] = true,
        ["j_EUB_imsohungryicould"] = true,
        ["j_EUB_inferno"] = true,
        ["j_EUB_insurancecoverage"] = true,
        ["j_EUB_invidia"] = true,
        ["j_EUB_lapislazuli"] = true,
        ["j_EUB_luxuria"] = true,
        ["j_EUB_mangoenthusiast"] = true,
        ["j_EUB_maximumvalues"] = true,
        ["j_EUB_nightstargrimoire"] = true,
        ["j_EUB_periodiclaw"] = true,
        ["j_EUB_rottentomatoes"] = true,
        ["j_EUB_stackedpancakes"] = true,
        ["j_EUB_superbia"] = true,
        ["j_EUB_targetextraction"] = true,
        ["j_EUB_theskygarden"] = true,
        ["j_EUB_thesun"] = true,
        ["j_EUB_tristitia"] = true,
        ["j_EUB_turingmachine"] = true,
        ["j_EUB_wheredidthemango"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Otherworldly Pack",
    cards = {
        ["j_EUB__57leafclover"] = true,
        ["j_EUB_boundaryofdestruction"] = true,
        ["j_EUB_insurancecoverage"] = true,
        ["j_EUB_lapislazuli"] = true,
        ["j_EUB_nightstargrimoire"] = true,
        ["j_EUB_targetextraction"] = true,
        ["j_EUB_theskygarden"] = true,
        ["j_EUB_thesun"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Foodaholic Bonus Pack",
    cards = {
        ["j_EUB_a5wagyusteak"] = true,
        ["j_EUB_forse"] = true,
        ["j_EUB_imsohungryicould"] = true,
        ["j_EUB_mangoenthusiast"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_The Seven Sins Pack",
    cards = {
        ["j_EUB_acedia"] = true,
        ["j_EUB_avaritia"] = true,
        ["j_EUB_gula"] = true,
        ["j_EUB_inferno"] = true,
        ["j_EUB_invidia"] = true,
        ["j_EUB_luxuria"] = true,
        ["j_EUB_superbia"] = true,
        ["j_EUB_tristitia"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Foodaholic Pack",
    cards = {
        ["j_EUB_badapple"] = true,
        ["j_EUB_butterup"] = true,
        ["j_EUB_cagefreeegg"] = true,
        ["j_EUB_coffeearrhythmia"] = true,
        ["j_EUB_couchpotato"] = true,
        ["j_EUB_egg"] = true,
        ["j_EUB_rottentomatoes"] = true,
        ["j_EUB_stackedpancakes"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_EUB Jokers",
    cards = {
        ["j_EUB_Bits"] = true,
        ["j_EUB_Points"] = true,
        ["j_EUB_PointX"] = true,
        ["j_EUB_Prestige"] = true,
        ["j_EUB_Qubits"] = true,
        ["j_EUB_Research"] = true,
        ["j_EUB_Transcend"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Static Pack",
    cards = {
        ["j_EUB_Bits"] = true,
        ["j_EUB_Points"] = true,
        ["j_EUB_PointX"] = true,
        ["j_EUB_Prestige"] = true,
        ["j_EUB_Research"] = true,
        ["j_EUB_Transcend"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Outsourced",
    cards = {
        ["j_EUB_delulu"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Everything Upgrade Balatro Jokers",
    cards = {
        ["j_EUB_delulu"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Developer Pack",
    cards = {
        ["j_EUB_developerasap"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Creative Pack",
    cards = {
        ["j_EUB_eulersformula"] = true,
        ["j_EUB_goldenratio"] = true,
        ["j_EUB_hawkingradiation"] = true,
        ["j_EUB_hubbleslaw"] = true,
        ["j_EUB_maximumvalues"] = true,
        ["j_EUB_periodiclaw"] = true,
        ["j_EUB_turingmachine"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Foodaholic Bonus Pack Legendary",
    cards = {
        ["j_EUB_fruuuuuuuuuuuuuuuuuuits"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_HunterJ360",
    cards = {
        ["j_EUB_hunterj360"] = true
    },
})

SMODS.ObjectType({
    key = "EUB_Static Pack Legendary",
    cards = {
        ["j_EUB_Qubits"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end