
SMODS.Consumable {
    key = 'delusion',
    set = 'Spectral',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'Delusion',
        text = {
            [1] = 'Creates a random card with the {X:edition,C:white}delusional{} Edition when used'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'NonCurrencyConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if G.hand and #G.hand.cards > 0 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 1 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local cen_pool = {}
                        for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                                cen_pool[#cen_pool + 1] = enhancement_center
                            end
                        end
                        local enhancement = pseudorandom_element(cen_pool, 'add_cards_enhancement')
                        local new_card_params = { set = "Base" }
                    if _rank then new_card_params.rank = _rank end
                    if _suit then new_card_params.suit = _suit end
                    if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            local seal_pool = {'Gold','Red','Blue','Purple','EUB_currencyseal','EUB_mangoseal','EUB_selfinsertseal'}
                            local random_seal = pseudorandom_element(seal_pool, 'add_cards_seal')
                            cards[i]:set_seal(random_seal, nil, true)
                        end
                        if cards[i] then
                            cards[i]:set_edition('e_EUB_delusional', true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
        end
    end,
    can_use = function(self, card)
        return (G.hand and #G.hand.cards > 0)
    end
}