
SMODS.Joker{ --Insurance Coverage
    key = "insurancecoverage",
    config = {
        extra = {
            blind_size0 = 2,
            blind_size02 = 2,
            blind_size03 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Insurance Coverage',
        ['text'] = {
            [1] = 'When a blind is selected, this Joker {C:red}destroys itself{} and reduces the {C:money}blind requirements{} by a fixed {C:uncommon}50%{}',
            [2] = 'Also {C:rare}disables{} boss blinds if blind is a boss blind.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Otherworldly Pack"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if G.GAME.blind:get_type() == 'Small' then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            if G.GAME.blind.in_blind then
                                
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "/"..tostring(2).." Blind Size", colour = G.C.GREEN})
                                G.GAME.blind.chips = G.GAME.blind.chips / 2
                                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                G.HUD_blind:recalculate()
                                return true
                            end
                        end,
                        colour = G.C.GREEN
                    }
                }
            elseif G.GAME.blind:get_type() == 'Big' then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            if G.GAME.blind.in_blind then
                                
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "/"..tostring(2).." Blind Size", colour = G.C.GREEN})
                                G.GAME.blind.chips = G.GAME.blind.chips / 2
                                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                G.HUD_blind:recalculate()
                                return true
                            end
                        end,
                        colour = G.C.GREEN
                    }
                }
            elseif G.GAME.blind.boss then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            if G.GAME.blind.in_blind then
                                
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "/"..tostring(2).." Blind Size", colour = G.C.GREEN})
                                G.GAME.blind.chips = G.GAME.blind.chips / 2
                                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                G.HUD_blind:recalculate()
                                return true
                            end
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            G.GAME.blind:disable()
                                            play_sound('timpani')
                                            return true
                                        end
                                    }))
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                                end
                                return true
                            end,
                            colour = G.C.GREEN
                        }
                    }
                }
            end
        end
    end
}