SMODS.Consumable {
    key = 'gamma',
    set = 'currency',
    pos = { x = 3, y = 2 },
    loc_txt = {
        name = 'Gamma',
        text = {
            [1] = 'Levels a random poker hand twice when used'
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

        local function has_hubble_flag()
            if G and G.GAME and G.GAME.pool_flags and (G.GAME.pool_flags.EUB_hubble or false) then return true end
            if G and G.RECEIVED_FLAGS and G.RECEIVED_FLAGS['hubble'] then return true end
            if used_card and (used_card.hubble or (used_card.flags and used_card.flags.hubble)) then return true end
            return false
        end

        local function do_pulse_and_level(level_count, hand_key)
            update_hand_text(
                { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = '???', chips = '???', mult = '???', level = '' }
            )
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(level_count) })
            delay(1.3)

            level_up_hand(card, hand_key, true, level_count)

            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize(hand_key, 'poker_hands'), 
                    chips = G.GAME.hands[hand_key].chips, 
                    mult = G.GAME.hands[hand_key].mult, 
                level=G.GAME.hands[hand_key].level})    
            delay(1.3)
        end

        local hubble = has_hubble_flag()

        if not hubble then
            -- level a random hand twice
            local hand_pool = {}
            for hand_key, _ in pairs(G.GAME.hands) do
                table.insert(hand_pool, hand_key)
            end
            local random_hand = pseudorandom_element(hand_pool, 'random_hand_levelup')
            do_pulse_and_level(2, random_hand)
            return
        end

        -- hubble == true -> level most-played hand twice
        local temp_played = 0
        local temp_order = math.huge
        local target_hand = 'High Card'
        for hand, value in pairs(G.GAME.hands) do 
            if value.visible then
                if value.played > temp_played then
                    temp_played = value.played
                    temp_order = value.order
                    target_hand = hand
                elseif value.played == temp_played then
                    if value.order and value.order < temp_order then
                        temp_order = value.order
                        target_hand = hand
                    end
                end
            end
        end

        do_pulse_and_level(2, target_hand)
    end,
    can_use = function(self, card)
        return true
    end
}