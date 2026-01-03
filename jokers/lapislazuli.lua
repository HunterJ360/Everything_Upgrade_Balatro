
SMODS.Joker{ --Lapis Lazuli
    key = "lapislazuli",
    config = {
        extra = {
            money÷10 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Lapis Lazuli',
        ['text'] = {
            [1] = '{C:attention}+1{} free reroll for every {C:money}$10{}  (Currently {C:attention}+#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Otherworldly Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(math.floor(lenient_bignum(G.GAME.dollars / 10)) or 0)}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(math.floor(lenient_bignum(G.GAME.dollars / 10)))
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-(math.floor(lenient_bignum(G.GAME.dollars / 10))))
    end
}