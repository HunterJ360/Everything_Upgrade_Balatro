
SMODS.Voucher {
    key = 'duplication',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'Duplication',
        text = {
            [1] = 'Booster Packs create a random Tag when opened'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    calculate = function(self, card, context)
        if context.open_booster then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                            local tag = Tag(selected_tag)
                            if tag.name == "Orbital Tag" then
                                local _poker_hands = {}
                                for k, v in pairs(G.GAME.hands) do
                                    if v.visible then
                                        _poker_hands[#_poker_hands + 1] = k
                                    end
                                end
                                tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                            end
                            tag:set_ability()
                            add_tag(tag)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end
                    }))
                    return true
                end,
                message = "Created Tag!"
            }
        end
    end
}