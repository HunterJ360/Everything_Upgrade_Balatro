
SMODS.Joker{ --Egg
    key = "egg",
    config = {
        extra = {
            sell_value0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Egg',
        ['text'] = {
            [1] = 'Gains {C:money}$3{} sell value at the start of round',
            [2] = '{s:0.8}(isnt this just normal egg?){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Pack"] = true },
    
    calculate = function(self, card, context)
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
                    target_card.ability.extra_value = (card.ability.extra_value or 0) + 3
                    target_card:set_cost()
                    return true
                end,
                message = "+"..tostring(3).." Sell Value"
            }
        end
    end
}