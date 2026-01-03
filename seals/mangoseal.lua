
SMODS.Seal {
    key = 'mangoseal',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            odds = 2
        }
    },
    badge_colour = HEX('FFB347'),
    loc_txt = {
        name = 'Mango Seal',
        label = 'Mango Seal',
        text = {
            [1] = '{C:green}1 in 2{} chance to create a {C:money}Mango{} when scored'
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
            if SMODS.pseudorandom_probability(card, 'group_0_dd0cb020', 1, card.ability.seal.extra.odds, 'j_EUB_mangoseal', false) then
                SMODS.calculate_effect({
                    func = function()
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'currency', key = 'c_EUB_mango'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Mango!", colour = G.C.PURPLE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    }