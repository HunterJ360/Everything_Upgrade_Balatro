
SMODS.Seal {
    key = 'selfinsertseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            odds = 100
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Self Insert Seal',
        label = 'Self Insert Seal',
        text = {
            [1] = '{C:green}1 in 100{} chance to create a random {X:edition,C:white}Exotica{} Joker when scored'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_77f410c2', 1, card.ability.seal.extra.odds, 'j_EUB_selfinsertseal', false) then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'EUB_exotica' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Luckiest!", colour = G.C.BLUE})
            end
        end
    end
}