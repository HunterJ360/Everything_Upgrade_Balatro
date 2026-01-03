
SMODS.Joker{ --Nightstar Grimoire
    key = "nightstargrimoire",
    config = {
        extra = {
            Random1t6 = 0,
            mult0 = 20,
            chips0 = 150
        }
    },
    loc_txt = {
        ['name'] = 'Nightstar Grimoire',
        ['text'] = {
            [1] = 'Gives {C:red}+20{} Mult, {C:blue}+150{} Chips in the leftmost slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Otherworldly Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Random1t6}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not ((function()
                return G.jokers.cards[1] == card
            end)()) then
                return {
                    mult = 20
                }
            elseif (function()
                return G.jokers.cards[1] == card
            end)() then
                return {
                    chips = 150
                }
            end
        end
    end
}