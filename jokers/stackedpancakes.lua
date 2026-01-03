SMODS.Joker{ --Stacked Pancakes
    key = "stackedpancakes",
    config = {
        extra = {
            repetitions0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Stacked Pancakes',
        ['text'] = {
            [1] = 'Retriggers all cards twice if all played cards in hand are {C:money}Kings{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Pack"] = true },
    
   calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card:get_id() == 13 and (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == 13 then
                        count = count + 1
                    end
                end
                return count == #context.full_hand
            end)()) then
                return {
                    repetitions = 2,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}