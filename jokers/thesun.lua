
SMODS.Joker{ --The Sun
    key = "thesun",
    config = {
        extra = {
            levels0 = 1,
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'The Sun',
        ['text'] = {
            [1] = 'When a {C:planet}Planet{} is used, levels a random hand',
            [2] = '{C:green}#2# in 6{} chance to shatter at start of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Otherworldly Pack"] = true },
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and not G.GAME.pool_flags.EUB_thesunisleaking
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_EUB_thesun') 
        return {vars = {localize((G.GAME.current_round.CurrentPlanetUsed_hand or 'High Card'), 'poker_hands'), new_numerator, new_denominator}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.CurrentPlanetUsed_hand = 'High Card'
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                local available_hands = {}
                for hand, value in pairs(G.GAME.hands) do
                    if value.visible and value.level >= to_big(1) then
                        table.insert(available_hands, hand)
                    end
                end
                local target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
                level_up_hand(card, target_hand, true, 1)
                return {
                    message = localize('k_level_up_ex')
                }
            end
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_b836dedb', 1, card.ability.extra.odds, 'j_EUB_thesun', false) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            card:juice_up(0.3, 0.5)
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "thesunisleaking", colour = G.C.BLUE})
                            G.GAME.pool_flags.EUB_thesunisleaking = true
                            return true
                        end
                    }))
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:shatter({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}