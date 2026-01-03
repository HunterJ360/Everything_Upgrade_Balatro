
SMODS.Joker{ --Research
    key = "Research",
    config = {
        extra = {
            CurrentTuring = 1.2,
            echips0 = 1.4,
            echips = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Research',
        ['text'] = {
            [1] = 'Gives {X:blue,C:white}^#1#{} Chips',
            [2] = 'Generates a Research when Blind is Selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
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
    pools = { ["EUB_EUB Jokers"] = true, ["EUB_Static Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_EUB_research"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_EUB_research\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.CurrentTuring}}
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
                card.ability.extra.CurrentTuring = 1.4
                return {
                    e_chips = 1.4
                }
            elseif not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_turingmachine" then 
                        return true
                    end
                end
            end)()) then
                card.ability.extra.CurrentTuring = 1.2
                return {
                    e_chips = 1.2
                }
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
                                SMODS.add_card({ set = 'currency', key = 'c_EUB_research'})                            
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