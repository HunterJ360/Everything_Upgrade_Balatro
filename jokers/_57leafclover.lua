
SMODS.Joker{ --57 Leaf Clover
    key = "_57leafclover",
    config = {
        extra = {
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = '57 Leaf Clover',
        ['text'] = {
            [1] = 'Retriggers all played {C:green}Lucky{} Cards',
            [2] = '{s:0.8}This will do more in the future{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        
        local info_queue_0 = G.P_CENTERS["m_lucky"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}