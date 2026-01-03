
SMODS.Joker{ --Luxuria
    key = "luxuria",
    config = {
        extra = {
            jokercount = 1
        }
    },
    loc_txt = {
        ['name'] = 'Luxuria',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X0.5{} Mult per Joker (Currently {X:red,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_The Seven Sins Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.jokercount + (#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 0.5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.jokercount + (#(G.jokers and G.jokers.cards or {})) * 0.5
            }
        end
    end
}