
SMODS.Back {
    key = 'currency_deck',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            item_rate0 = 10
        },
    },
    loc_txt = {
        name = 'Currency Deck',
        text = {
            [1] = 'Generate a random',
            [2] = '{C:attention}Currency{} when blind is selected,',
            [3] = 'Currency can appear in shop'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        play_sound('timpani')
                        SMODS.add_card({ set = 'currency', 
                        })
                        return true
                    end
                }))
            end
        end
    end,
    apply = function(self, back)
        G.GAME.currency_rate = G.GAME.currency_rate + 10
    end
}