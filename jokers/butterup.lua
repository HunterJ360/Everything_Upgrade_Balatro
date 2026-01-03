
SMODS.Joker{ --Butter Up!
    key = "butterup",
    config = {
        extra = {
            sell_value0 = 2,
            sell_value = 2
        }
    },
    loc_txt = {
        ['name'] = 'Butter Up!',
        ['text'] = {
            [1] = 'Gains {C:money}2${} Sell Value per shop reroll',
            [2] = '{s:0.8}(Resets when blind is selected){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        if context.reroll_shop  and not context.blueprint then
            return {
                func = function()local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_card = G.jokers.cards[my_pos]
                    target_card.ability.extra_value = (card.ability.extra_value or 0) + 2
                    target_card:set_cost()
                    return true
                end,
                message = "Sell Value Up!"
            }
        end
        if context.setting_blind  and not context.blueprint then
            return {
                func = function()local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_card = G.jokers.cards[my_pos]
                    target_card.ability.extra_value = 2
                    target_card:set_cost()
                    return true
                end,
                message = "Reset!"
            }
        end
    end
}