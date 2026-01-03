
SMODS.Joker{ --Rotten Tomatoes
    key = "rottentomatoes",
    config = {
        extra = {
            sell_value0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Rotten Tomatoes',
        ['text'] = {
            [1] = 'Adds {C:money}$4{} sell value to a random Joker at the end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Pack"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()chosenTarget = pseudorandom(b0a576d5, 1, #G.jokers.cards) or nil
                    target_card = G.jokers.cards[chosenTarget]
                    target_card.ability.extra_value = (card.ability.extra_value or 0) + 4
                    target_card:set_cost()
                    return true
                end,
                message = "+"..tostring(4).." Sell Value"
            }
        end
    end
}