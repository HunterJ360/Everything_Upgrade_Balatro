
SMODS.Joker{ --Tristitia
    key = "tristitia",
    config = {
        extra = {
            DiscardedCardXMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Tristitia',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X0.2{} per card discarded this round (Currently {X:red,C:white}X#1#{})',
            [2] = '{s:0.8}(Resets at the end of round){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
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
        
        return {vars = {card.ability.extra.DiscardedCardXMult}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.DiscardedCardXMult = (card.ability.extra.DiscardedCardXMult) + 0.2
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.DiscardedCardXMult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.DiscardedCardXMult = 1
                    return true
                end,
                message = "Reset!"
            }
        end
    end
}