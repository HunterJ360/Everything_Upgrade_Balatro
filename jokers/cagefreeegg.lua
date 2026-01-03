
SMODS.Joker{ --Cage Free Egg
    key = "cagefreeegg",
    config = {
        extra = {
            sell_value0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Cage Free Egg',
        ['text'] = {
            [1] = 'Gains {C:money}$5{} sell value at the end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Pack"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_card = G.jokers.cards[my_pos]
                    target_card.ability.extra_value = (card.ability.extra_value or 0) + 5
                    target_card:set_cost()
                    return true
                end,
                message = "+"..tostring(5).." Sell Value"
            }
        end
    end
}