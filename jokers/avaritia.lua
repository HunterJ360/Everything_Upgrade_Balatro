
SMODS.Joker{ --Avaritia
    key = "avaritia",
    config = {
        extra = {
            money÷5 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Avaritia',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X0.2{} Mult per {C:money}5${} you have (Currently {X:red,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
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
        
        return {vars = {card.ability.extra.money÷5 + ((math.floor(lenient_bignum(G.GAME.dollars / 5)) or 0)) * 0.2}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.money÷5 + (math.floor(lenient_bignum(G.GAME.dollars / 5))) * 0.2
            }
        end
    end
}