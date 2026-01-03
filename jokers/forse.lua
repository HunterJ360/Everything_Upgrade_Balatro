
SMODS.Joker{ --Forse
    key = "forse",
    config = {
        extra = {
            pb_p_dollars_63c522bb = 2
        }
    },
    loc_txt = {
        ['name'] = 'Forse',
        ['text'] = {
            [1] = 'Makes played Wild Cards permanently gain {C:money}2${} when scored',
            [2] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        
        local info_queue_0 = G.P_CENTERS["m_wild"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_wild\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars or 0
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars + 2
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MONEY }, card = card
                }
            end
        end
        if context.selling_self  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "whinny", colour = G.C.BLUE})
                    G.GAME.pool_flags.EUB_whinny = true
                    return true
                end
            }))
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "whinny", colour = G.C.BLUE})
                    G.GAME.pool_flags.EUB_whinny = false
                    return true
                end
            }))
        end
    end
}