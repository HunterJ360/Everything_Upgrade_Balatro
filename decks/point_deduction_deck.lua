
SMODS.Back {
    key = 'point_deduction_deck',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 0.25
        },
    },
    loc_txt = {
        name = 'Point Deduction Deck',
        text = {
            [1] = 'Start with Halfer Joker,',
            [2] = '{C:attention}Quarters{} scoring requirement'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_EUB_halfer' })
                if new_joker then
                    new_joker:set_edition("e_negative", true)
                    new_joker:add_sticker('eternal', true)
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 0.25
                return true
            end
        }))
    end
}