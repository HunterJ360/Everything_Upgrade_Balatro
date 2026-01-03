
SMODS.Joker{ --IM SO HUNGRY I COULD...
    key = "imsohungryicould",
    config = {
        extra = {
            deadhorsexmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'IM SO HUNGRY I COULD...',
        ['text'] = {
            [1] = 'When blind is selected, destroys a Forse and gains {X:red,C:white}X5{} Mult (Currently {X:red,C:white}X#1#{})',
            [2] = '{s:0.8}man im hungry... only works once per round tho :C{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Bonus Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_EUB_forse"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_EUB_forse\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.deadhorsexmult}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_EUB_forse" then 
                        return true
                    end
                end
            end)() then
                return {
                    func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_EUB_forse" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "mmm yum", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.deadhorsexmult = (card.ability.extra.deadhorsexmult) + 5
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.deadhorsexmult
            }
        end
    end
}