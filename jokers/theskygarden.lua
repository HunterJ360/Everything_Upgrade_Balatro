
SMODS.Joker{ --The Sky Garden
    key = "theskygarden",
    config = {
        extra = {
            levels0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'The Sky Garden',
        ['text'] = {
            [1] = 'When this card is {C:money}sold{} levels up most played {C:blue}poker hand{} by {C:green}2{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Otherworldly Pack"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            local temp_played = 0
            local temp_order = math.huge
            local target_hand
            for hand, value in pairs(G.GAME.hands) do 
                if value.played > temp_played and value.visible then
                    temp_played = value.played
                    temp_order = value.order
                    target_hand = hand
                elseif value.played == temp_played and value.visible then
                    if value.order < temp_order then
                        temp_order = value.order
                        target_hand = hand
                    end
                end
            end
            
            level_up_hand(card, target_hand, true, 2)
            return {
                message = localize('k_level_up_ex')
            }
        end
    end
}