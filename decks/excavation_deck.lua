
SMODS.Back {
    key = 'excavation_deck',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 2,
            add_starting_cards_count0 = 13
        },
    },
    loc_txt = {
        name = 'Excavation Deck',
        text = {
            [1] = 'Start run with a row {C:inactive}(13){}',
            [2] = 'of {C:attention}Stone{} cards and a',
            [3] = '{C:attention}Target Extraction{}',
            [4] = 'Winning Ante is {C:attention}Ante 10{},',
            [5] = 'Blind Requirements scale {C:attention}X2{} as fast'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        local ante = G.GAME.win_ante + 2
        local int_part, frac_part = math.modf(ante)
        local rounded = int_part + (frac_part >= 0.5 and 1 or 0)
        G.GAME.win_ante = rounded
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_EUB_targetextraction' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local cards = {}
                for i = 1, 13 do
                    local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                    local _suit = nil
                    local enhancement = G.P_CENTERS['m_stone']
                    local new_card_params = { set = "Base", area = G.deck }
                if _rank then new_card_params.rank = _rank end
                if _suit then new_card_params.suit = _suit end
                if enhancement then new_card_params.enhancement = enhancement.key end
                    cards[i] = SMODS.add_card(new_card_params)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}