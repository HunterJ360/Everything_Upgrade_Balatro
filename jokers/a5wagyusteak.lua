
SMODS.Joker{ --A5 Wagyu Steak
    key = "a5wagyusteak",
    config = {
        extra = {
            repetitions0 = 1,
            dollars0 = 3,
            repetitions = 1,
            repetitions2 = 1
        }
    },
    loc_txt = {
        ['name'] = 'A5 Wagyu Steak',
        ['text'] = {
            [1] = 'Makes all seals {X:edition,C:white}X2{} better',
            [2] = '{C:tarot}Purple Seal{}: Gives 2 Tarots when Discarded',
            [3] = '{C:red}Red Seal{}: Retriggers twice',
            [4] = '{C:gold}Gold Seal{}: Gives $6 when scored',
            [5] = '{C:spectral}Blue Seal{}: Gives 2 Planets when held in hand at the end of round',
            [6] = '{s:0.8}(Always Spawns Polychrome){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 4
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Bonus Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_SEALS["Red"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"Red\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_SEALS["Purple"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"Purple\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_SEALS["Gold"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"Gold\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_3 = G.P_SEALS["Blue"]
        if info_queue_3 then
            info_queue[#info_queue + 1] = info_queue_3
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"Blue\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand and context.end_of_round and (next(context.card_effects[1]) or #context.card_effects > 1)  then
            if context.other_card.seal == "Blue" then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.discard  and not context.blueprint then
            if context.other_card.seal == "Purple" then
                return {
                    func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "A5!", colour = G.C.PURPLE})
                        end
                        return true
                    end
                }
            end
        end
        if context.repetition and context.cardarea == G.play  then
            if context.other_card.seal == "Gold" then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 3
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "A5!", colour = G.C.MONEY})
                        return true
                    end
                }
            elseif context.other_card.seal == "Red" then
                return {
                    repetitions = 1,
                    message = "A5!"
                }
            end
        end
        if context.repetition and not context.cardarea == G.hand and context.end_of_round and (next(context.card_effects[1]) or #context.card_effects > 1)  then
            if context.other_card.seal == "Red" then
                return {
                    repetitions = 1,
                    message = "A5!"
                }
            end
        end
    end
}