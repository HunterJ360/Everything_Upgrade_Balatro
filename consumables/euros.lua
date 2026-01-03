
SMODS.Consumable {
    key = 'euros',
    set = 'currency',
    pos = { x = 3, y = 1 },
    config = { 
        extra = {
            currentante = 0   
        } 
    },
    loc_txt = {
        name = 'Euros',
        text = {
            [1] = 'Gain {C:money}$5{} based on Current Ante (Currently: {C:money}$#1#{})',
            [2] = '{C:inactive}(Max is Ante Cap){}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'Currencies',
    loc_vars = function(self, info_queue, card)
        return {vars = {((G.GAME.round_resets.ante or 0)) * 5}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if not (G.GAME.selected_back.name == "b_EUB_excavation_deck") then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + (G.GAME.round_resets.ante) * 5
                    local dollar_value = target_dollars - current_dollars
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring((G.GAME.round_resets.ante) * 5).." $", colour = G.C.RED})
                    ease_dollars(math.min(dollar_value, 40), true)
                    return true
                end
            }))
            delay(0.6)
        end
        if G.GAME.selected_back.name == "b_EUB_excavation_deck" then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + (G.GAME.round_resets.ante) * 5
                    local dollar_value = target_dollars - current_dollars
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring((G.GAME.round_resets.ante) * 5).." $", colour = G.C.RED})
                    ease_dollars(math.min(dollar_value, 50), true)
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (not (G.GAME.selected_back.name == "b_EUB_excavation_deck")) or (G.GAME.selected_back.name == "b_EUB_excavation_deck")
    end
}