
SMODS.Consumable {
    key = 'mango',
    set = 'currency',
    pos = { x = 2, y = 2 },
    config = { 
        extra = {
            odds = 50   
        } 
    },
    loc_txt = {
        name = 'Mango',
        text = {
            [1] = '{s:0.8}does nothing...?{}'
        }
    },
    cost = 1,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'Currencies',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("EUB_mangoc")
                
                return true
            end,
        }))
        if SMODS.pseudorandom_probability(card, 'group_0_b5a58dbf', 1, card.ability.extra.odds, 'j_EUB_mango', false) then
            local valid_indices = {}
            for i, jc in ipairs(G.jokers.cards) do
                if jc == nil then goto continue_end
                end
                local is_negative = false
                if type(jc.has_edition) == 'function' then
                    local ok, res = pcall(function() return jc:has_edition("e_negative") end)
                    if ok and res == true then is_negative = true end
                end
                if not is_negative and jc.edition ~= nil then
                    if jc.edition == "e_negative" then is_negative = true end
                end
                if not is_negative and jc.editions ~= nil and type(jc.editions) == 'table' then
                    if jc.editions["e_negative"] == true then is_negative = true end
                end
                if not is_negative and type(jc.get_editions) == 'function' then
                    local ok, eds = pcall(function() return jc:get_editions() end)
                    if ok and type(eds) == 'table' and eds["e_negative"] == true then is_negative = true end
                end
                if not is_negative and not jc._forced_negative then table.insert(valid_indices, i) end
                ::continue_end::
            end
            if #valid_indices == 0 then
                return
            end
            local index = valid_indices[math.random(1, #valid_indices)]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            local total_jokers = #G.jokers.cards
            local percent = 1.0
            if total_jokers > 1 then
                percent = 1.15 - (index - 0.999) / (total_jokers - 0.998) * 0.3
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    
                    G.jokers.cards[index]:flip()
                    play_sound('card1', percent)
                    G.jokers.cards[index]:juice_up(0.3, 0.3)
                    return true
                end
            }))
            delay(0.2)
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if G.jokers.cards[index] then
                        G.jokers.cards[index]:set_edition("e_negative", true)
                        G.jokers.cards[index]._forced_negative = true
                    end
                    return true
                end
            }))
            
            local total_jokers = #G.jokers.cards
            local percent = 0.9
            if total_jokers > 1 then
                percent = 0.85 + (index - 0.999) / (total_jokers - 0.998) * 0.3
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.jokers.cards[index]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.jokers.cards[index]:juice_up(0.3, 0.3)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.jokers:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
            card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Lucky!", colour = G.C.SECONDARY_SET.Tarot})
        end
    end,
    can_use = function(self, card)
        return true
    end
}