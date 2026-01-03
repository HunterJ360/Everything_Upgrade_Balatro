
SMODS.Consumable {
    key = 'transcend',
    set = 'currency',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'Transcend',
        text = {
            [1] = 'Destroys a selected Joker and applies {C:dark_edition}Abyssal{} to a random Joker'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'Currencies',
    use = function(self, card, area, copier)
        local used_card = copier or card

        if to_big(#G.jokers.highlighted) ~= to_big(1) then
            return
        end

        -- determine the selected joker (highlight may store index or object)
        local highlighted_entry = G.jokers.highlighted[1]
        local selected_joker = nil
        if type(highlighted_entry) == 'number' then
            selected_joker = G.jokers.cards[highlighted_entry]
        else
            selected_joker = highlighted_entry
        end

        if not selected_joker then return end

        -- do not allow destroying eternal jokers
        if SMODS.is_eternal(selected_joker, card) then
            return
        end

        -- dissolve the selected joker
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.2,
            func = function()
                selected_joker:start_dissolve(nil, _first_dissolve)
                _first_dissolve = true
                return true
            end
        }))

        -- prepare list of candidate jokers to receive Abyssal (exclude eternal and the destroyed one)
        local candidates = {}
        for _, j in ipairs(G.jokers.cards) do
            if j ~= selected_joker and j.edition ~= 'base' then
                candidates[#candidates + 1] = j
            end
        end

        if #candidates == 0 then
            -- nothing to upgrade; just unhighlight after dissolve
            G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function() G.jokers:unhighlight_all() return true end }))
            return
        end

        local target = pseudorandom_element(candidates, 'transcend_target')

        -- visual/audio sequence and apply Abyssal edition (do NOT bypass eternal)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.6,
            func = function()
                target:flip()
                play_sound('card1')
                target:juice_up(0.3, 0.3)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                -- do not pass `true` as second arg so we don't bypass eternal protections
                target:set_edition('e_EUB_abyssal')
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                target:flip()
                play_sound('tarot2')
                target:juice_up(0.3, 0.3)
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
    end,
    can_use = function(self, card)
        if to_big(#G.jokers.highlighted) ~= to_big(1) then return false end
        local he = G.jokers.highlighted[1]
        local sel = nil
        if type(he) == 'number' then
            sel = G.jokers.cards[he]
        else
            sel = he
        end
        if not sel then return false end
        if SMODS.is_eternal(sel, card) then return false end
        return true
    end
}