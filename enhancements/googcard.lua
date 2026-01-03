
SMODS.Enhancement {
    key = 'googcard',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            dollars0 = -6767,
            mult0 = 69,
            dollars = 25
        }
    },
    loc_txt = {
        name = 'Goog Card',
        text = {
            [1] = '{s:1.8}Goog...{}'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 2.5,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and to_big(#G.deck.cards) == to_big(67) then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = -6767
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "67 Deck Size :wilted-flower:", colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.main_scoring and context.cardarea == G.play and to_big(#G.deck.cards) == to_big(69) then
            return {
                mult = 69,
                extra = {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = 25
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Healing :bandaged-heart:", colour = G.C.MONEY})
                        return true
                    end,
                    colour = G.C.MONEY
                }
            }
        end
    end
}