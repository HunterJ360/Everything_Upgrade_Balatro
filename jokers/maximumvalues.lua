
SMODS.Joker{ --Maximum Values
    key = "maximumvalues",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Maximum Values',
        ['text'] = {
            [1] = 'Balances {C:blue}Chips {}and {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Creative Pack"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            return {
                balance = true,
                message = "Balanced!"
            }
        end
    end
}