
SMODS.Joker{ --Invidia
    key = "invidia",
    config = {
        extra = {
            ScoredCardsXMult = 1,
            basediscardsperround = 1
        }
    },
    loc_txt = {
        ['name'] = 'Invidia',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X0.5{} Mult per discard (Currently {X:red,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_The Seven Sins Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ScoredCardsXMult, card.ability.extra.basediscardsperround + ((G.GAME.round_resets.discards or 0)) * 0.5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.basediscardsperround + (G.GAME.round_resets.discards) * 0.5
            }
        end
    end
}