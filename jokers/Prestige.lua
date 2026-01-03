
SMODS.Joker{ --Prestige
    key = "Prestige",
    config = {
        extra = {
            CurrentTuringone = 50,
            CurrentTuringtwo = 20,
            chips0 = 100,
            chips = 50,
            odds = 2,
            chips2 = 40,
            odds2 = 2,
            chips3 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Prestige',
        ['text'] = {
            [1] = 'Gives {C:blue}+#1#{} Chips, {C:green}1 in 2{} chance for each played card to give {C:blue}+#2#{} Chips',
            [2] = 'Generates a Prestige when Blind is Selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    pools = { ["EUB_EUB Jokers"] = true, ["EUB_Static Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_EUB_prestige"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_EUB_prestige\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_EUB_Prestige')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_EUB_Prestige')
        return {vars = {card.ability.extra.CurrentTuringone, card.ability.extra.CurrentTuringtwo, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_turingmachine" then 
                        return true
                    end
                end
            end)() then
                card.ability.extra.CurrentTuringone = 100
                card.ability.extra.CurrentTuringtwo = 40
                return {
                    chips = 100
                }
            elseif not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_turingmachine" then 
                        return true
                    end
                end
            end)()) then
                card.ability.extra.CurrentTuringone = 50
                card.ability.extra.CurrentTuringtwo = 20
                return {
                    chips = 50
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_turingmachine" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_ecb142a5', 1, card.ability.extra.odds, 'j_EUB_Prestige', false) then
                    SMODS.calculate_effect({chips = 40}, card)
                end
            elseif not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_turingmachine" then 
                        return true
                    end
                end
            end)()) then
                if SMODS.pseudorandom_probability(card, 'group_0_23dc0275', 1, card.ability.extra.odds, 'j_EUB_Prestige', false) then
                    SMODS.calculate_effect({chips = 20}, card)
                end
            end
        end
        if context.setting_blind  then
            return {
                func = function()
                    
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'currency', key = 'c_EUB_prestige'})                            
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
                end
            }
        end
    end
}