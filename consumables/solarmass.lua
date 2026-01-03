
SMODS.Consumable {
    key = 'solarmass',
    set = 'currency',
    pos = { x = 1, y = 2 },
    loc_txt = {
        name = 'Solar Mass',
        text = {
            [1] = 'Disables the current boss blind when used',
            [2] = '{C:inactive}say \"Thank you Solar Mass!\"{}'
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
        if G.GAME.blind.boss then
            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        return true
                    end
                }))
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
            end
        end
    end,
    can_use = function(self, card)
        return (G.GAME.blind.boss)
    end
}