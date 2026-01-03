
SMODS.Joker{ --Gula
    key = "gula",
    config = {
        extra = {
            cardsremovedfromdeck = 1
        }
    },
    loc_txt = {
        ['name'] = 'Gula',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X0.5{} Mult for every card below {C:green}52{} (Currently {X:red,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        
        return {vars = {card.ability.extra.cardsremovedfromdeck + (((G.GAME.starting_deck_size - #(G.playing_cards or {})) or 0)) * 0.5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.cardsremovedfromdeck + ((G.GAME.starting_deck_size - #(G.playing_cards or {}))) * 0.5
            }
        end
    end
}