
SMODS.Joker{ --Acedia
    key = "acedia",
    config = {
        extra = {
            currentante = 1
        }
    },
    loc_txt = {
        ['name'] = 'Acedia',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X1{} Mult per ante (Currently {X:red,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_The Seven Sins Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.currentante + ((G.GAME.round_resets.ante or 0))}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.currentante + (G.GAME.round_resets.ante)
            }
        end
    end
}