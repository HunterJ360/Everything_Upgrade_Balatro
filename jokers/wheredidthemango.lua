
SMODS.Joker{ --Where did the man go?
    key = "wheredidthemango",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Where did the man go?',
        ['text'] = {
            [1] = 'Creates a Negative {C:gold}Mango{} when blind is selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_EUB_mango"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_EUB_mango\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    for i = 1, 1 do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                end
                                
                                play_sound('timpani')
                                SMODS.add_card({ set = 'currency', edition = 'e_negative', key = 'c_EUB_mango'})                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "There it is!", colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}