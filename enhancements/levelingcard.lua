
SMODS.Enhancement {
    key = 'levelingcard',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            odds = 6,
            levels0 = 1
        }
    },
    loc_txt = {
        name = 'Leveling Card',
        text = {
            [1] = '{C:green}1 in 6{} chance to level played poker hand when scored'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_7679fa5f', 1, card.ability.extra.odds, 'j_EUB_levelingcard', false) then
                local target_hand
                target_hand = context.scoring_name or "High Card"
                SMODS.calculate_effect({level_up = 1,
                level_up_hand = target_hand}, card)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
            end
        end
    end
}