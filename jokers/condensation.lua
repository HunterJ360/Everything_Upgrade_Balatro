
SMODS.Joker{ --Condensation
    key = "condensation",
    config = {
        extra = {
            freejokerslots = 1
        }
    },
    loc_txt = {
        ['name'] = 'Condensation',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X1{} Mult and {X:blue,C:white}X1{} Chips for every empty Joker slot',
            [2] = '(Currently {X:red,C:white}X#1#{} and {X:blue,C:white}X#1#{})',
            [3] = '{s:0.8}Does not exclude self{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
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
    pools = { ["EUB_EUB_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.freejokerslots + (((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and (G.jokers and G.jokers.cards or {}) or {})))}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.freejokerslots + (((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {}))),
                extra = {
                    Xmult = card.ability.extra.freejokerslots + (((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {})))
                }
            }
        end
    end
}