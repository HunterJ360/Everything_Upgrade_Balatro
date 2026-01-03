
SMODS.Joker{ --Target Extraction
    key = "targetextraction",
    config = {
        extra = {
            xmult0 = 1.5,
            xchips0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Target Extraction',
        ['text'] = {
            [1] = '{C:inactive}Stone{} Cards  give {X:red,C:white}X1.5{} Mult and {X:blue,C:white}X1.5{} Chips when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Otherworldly Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_stone"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_stone\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                return {
                    Xmult = 1.5,
                    extra = {
                        x_chips = 1.5,
                        colour = G.C.DARK_EDITION
                    }
                }
            end
        end
    end
}