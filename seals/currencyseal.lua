
SMODS.Seal {
    key = 'currencyseal',
    pos = { x = 1, y = 0 },
    badge_colour = HEX('32CD32'),
    loc_txt = {
        name = 'Currency Seal',
        label = 'Currency Seal',
        text = {
            [1] = 'Creates a random {C:green}Currency{} when {C:attention}scored{} or {C:attention}held in hand{} at end of round'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                
                func = function()
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'currency', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            return {
                
                func = function()
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'currency', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}