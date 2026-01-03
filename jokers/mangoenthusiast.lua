
SMODS.Joker{ --Mango Enthusiast
    key = "mangoenthusiast",
    config = {
        extra = {
            xmultvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'Mango Enthusiast',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X0.5{} Mult per Mango used (Currently {X:red,C:white}X#1#{} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Bonus Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_EUB_mango"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_EUB_mango\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.xmultvar}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            if context.consumeable and (context.consumeable.ability.set == 'currency' or context.consumeable.ability.set == 'currency') and context.consumeable.config.center.key == 'c_EUB_mango' then
                return {
                    func = function()
                        card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + 0.5
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmultvar
            }
        end
    end
}