
SMODS.Joker{ --Eulers Formula
    key = "eulersformula",
    config = {
        extra = {
            square = 0
        }
    },
    loc_txt = {
        ['name'] = 'Eulers Formula',
        ['text'] = {
            [1] = 'Gains {C:red}+4{} Mult per {C:attention}4{} card poker hand played with {C:attention}4{} scoring cards (Currently {C:red}+#1#{})',
            [2] = '{s:0.8}ex: Two Pair, Four of a Kind{}',
            [3] = '{s:0.7}(square joker synergy??){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Creative Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.square}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (context.scoring_name == "Four of a Kind" or context.scoring_name == "Two Pair" and to_big(#context.full_hand) == to_big(4)) then
                card.ability.extra.square = (card.ability.extra.square) + 4
                return {
                    message = "Geometrical!",
                    extra = {
                        mult = card.ability.extra.square
                    }
                }
            else
                return {
                    mult = card.ability.extra.square
                }
            end
        end
    end
}