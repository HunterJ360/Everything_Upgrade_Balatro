
SMODS.Consumable {
    key = 'prestige',
    set = 'currency',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'Prestige',
        text = {
            [1] = 'Destroy 1 random card in hand and gain {C:money}$5{}'
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
        if G.hand and #G.hand.cards > 0 then
            local destroyed_cards = {}
            local temp_hand = {}
            
        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )
            
            pseudoshuffle(temp_hand, 12345)
            
        for i = 1, 1 do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            SMODS.destroy_cards(destroyed_cards)
            
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return (G.hand and #G.hand.cards > 0)
    end
}