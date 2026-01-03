
SMODS.Joker{ --Periodic Law
    key = "periodiclaw",
    config = {
        extra = {
            mult0 = 13,
            xmult0 = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'Periodic Law',
        ['text'] = {
            [1] = 'Gives {C:red}+13{} Mult and {X:red,C:white}X1.3{} Mult for every scored card if played poker hand contains a Straight'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Creative Pack"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if next(context.poker_hands["Straight"]) then
                return {
                    mult = 13,
                    extra = {
                        Xmult = 1.3
                    }
                }
            end
        end
    end
}