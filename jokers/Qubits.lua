
SMODS.Joker{ --Qubits
    key = "Qubits",
    config = {
        extra = {
            c = 0,
            xc = 0,
            ec = 0,
            sc = 0,
            m = 0,
            xm = 0,
            em = 0,
            sm = 0,
            mult0 = 15,
            xmult0 = 4,
            emult0 = 1.2,
            chips0 = 50,
            xchips0 = 3,
            echips0 = 1.2,
            mult = 30,
            xmult = 6,
            emult = 1.4,
            chips = 100,
            xchips = 6,
            echips = 1.4,
            odds = 2,
            chips2 = 20,
            mult2 = 3,
            odds2 = 2,
            chips3 = 40,
            mult3 = 6
        }
    },
    loc_txt = {
        ['name'] = 'Qubits',
        ['text'] = {
            [1] = 'Applies the effects of all {C:uncommon}Static Pack Jokers{}',
            [2] = '{C:enhanced}Points{}: {C:red}+#5#{} Mult, {C:green}1 in #12#{} chance for each played card to give {C:red}+#8#{} Mult',
            [3] = '{C:gold}Prestige{}: {C:chips}+#1#{} Chips, {C:green}1 in #12#{} chance for each played card to give {C:chips}+#4#{} Chips',
            [4] = '{C:legendary}Point-X{}: Gives {X:red,C:white}X#6#{} Mult',
            [5] = '{C:planet}Transcend{}: Gives {X:blue,C:white}X#2#{} Chips',
            [6] = '{C:common}Research{}: Gives {X:blue,C:white}^#3#{} Chips',
            [7] = '{C:rare}Bits{}: Gives {X:red,C:white}^#7#{} Mult',
            [8] = '{C:inactive}Generates a Negative Points, Prestige, Point-X, Transcend, Research, Bits, and Qubits when Blind is Selected{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB Jokers"] = true, ["EUB_Static Pack Legendary"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_EUB_Qubits')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_EUB_Qubits')
        return {vars = {card.ability.extra.c, card.ability.extra.xc, card.ability.extra.ec, card.ability.extra.sc, card.ability.extra.m, card.ability.extra.xm, card.ability.extra.em, card.ability.extra.sm, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_turingmachine" then 
                        return true
                    end
                end
            end)()) then
                card.ability.extra.c = 50
                card.ability.extra.xc = 3
                card.ability.extra.ec = 1.2
                card.ability.extra.sc = 20
                card.ability.extra.m = 15
                card.ability.extra.xm = 3
                card.ability.extra.em = 1.2
                card.ability.extra.sm = 3
                return {
                    mult = 15,
                    extra = {
                        Xmult = 4,
                        extra = {
                            e_mult = 1.2,
                            colour = G.C.DARK_EDITION,
                            extra = {
                                chips = 50,
                                colour = G.C.CHIPS,
                                extra = {
                                    x_chips = 3,
                                    colour = G.C.DARK_EDITION,
                                    extra = {
                                        e_chips = 1.2,
                                        colour = G.C.DARK_EDITION
                                    }
                                }
                            }
                        }
                    }
                }
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_turingmachine" then 
                        return true
                    end
                end
            end)() then
                card.ability.extra.c = 100
                card.ability.extra.xc = 6
                card.ability.extra.ec = 1.4
                card.ability.extra.sc = 40
                card.ability.extra.m = 30
                card.ability.extra.xm = 6
                card.ability.extra.em = 1.4
                card.ability.extra.sm = 6
                return {
                    mult = 30,
                    extra = {
                        Xmult = 6,
                        extra = {
                            e_mult = 1.4,
                            colour = G.C.DARK_EDITION,
                            extra = {
                                chips = 100,
                                colour = G.C.CHIPS,
                                extra = {
                                    x_chips = 6,
                                    colour = G.C.DARK_EDITION,
                                    extra = {
                                        e_chips = 1.4,
                                        colour = G.C.DARK_EDITION
                                    }
                                }
                            }
                        }
                    }
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_turingmachine" then 
                        return true
                    end
                end
            end)()) then
                if SMODS.pseudorandom_probability(card, 'group_0_cd76f84d', 1, card.ability.extra.odds, 'j_EUB_Qubits', false) then
                    SMODS.calculate_effect({chips = 20}, card)
                    SMODS.calculate_effect({mult = 3}, card)
                end
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_turingmachine" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_3772574c', 1, card.ability.extra.odds, 'j_EUB_Qubits', false) then
                    SMODS.calculate_effect({chips = 40}, card)
                    SMODS.calculate_effect({mult = 6}, card)
                end
            end
        end
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
                                SMODS.add_card({ set = 'currency', edition = 'e_negative', key = 'c_EUB_points'})                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                extra = {
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
                                    SMODS.add_card({ set = 'currency', edition = 'e_negative', key = 'c_EUB_prestige'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                        end
                        return true
                    end,
                    colour = G.C.PURPLE,
                    extra = {
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
                                        SMODS.add_card({ set = 'currency', edition = 'e_negative', key = 'c_EUB_research'})                            
                                        card:juice_up(0.3, 0.5)
                                        return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                            end
                            return true
                        end,
                        colour = G.C.PURPLE,
                        extra = {
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
                                            SMODS.add_card({ set = 'currency', edition = 'e_negative', key = 'c_EUB_pointx'})                            
                                            card:juice_up(0.3, 0.5)
                                            return true
                                        end
                                    }))
                                end
                                delay(0.6)
                                
                                if created_consumable then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                                end
                                return true
                            end,
                            colour = G.C.PURPLE,
                            extra = {
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
                                                SMODS.add_card({ set = 'currency', edition = 'e_negative', key = 'c_EUB_bits'})                            
                                                card:juice_up(0.3, 0.5)
                                                return true
                                            end
                                        }))
                                    end
                                    delay(0.6)
                                    
                                    if created_consumable then
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                                    end
                                    return true
                                end,
                                colour = G.C.PURPLE,
                                extra = {
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
                                                    SMODS.add_card({ set = 'currency', edition = 'e_negative', key = 'c_EUB_qubits'})                            
                                                    card:juice_up(0.3, 0.5)
                                                    return true
                                                end
                                            }))
                                        end
                                        delay(0.6)
                                        
                                        if created_consumable then
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                                        end
                                        return true
                                    end,
                                    colour = G.C.PURPLE,
                                    extra = {
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
                                                        SMODS.add_card({ set = 'currency', edition = 'e_negative', key = 'c_EUB_transcend'})                            
                                                        card:juice_up(0.3, 0.5)
                                                        return true
                                                    end
                                                }))
                                            end
                                            delay(0.6)
                                            
                                            if created_consumable then
                                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                                            end
                                            return true
                                        end,
                                        colour = G.C.PURPLE
                                    }
                                }
                            }
                        }
                    }
                }
            }
        end
    end
}