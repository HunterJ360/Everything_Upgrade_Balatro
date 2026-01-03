
SMODS.Joker{ --Golden Ratio
    key = "goldenratio",
    config = {
        extra = {
            TotalChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Golden Ratio',
        ['text'] = {
            [1] = 'Gains {C:chips}+10{} Chips for every played poker hand that has {C:green}5{} cards  (Currently {C:chips}+#1#{} Chips)',
            [2] = '{s:0.8}(ex: Flush, Straight, Full House){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Creative Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.TotalChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (next(context.poker_hands["Straight"]) or next(context.poker_hands["Flush"]) or next(context.poker_hands["Full House"]) or next(context.poker_hands["Five of a Kind"])) then
                card.ability.extra.TotalChips = (card.ability.extra.TotalChips) + 10
                return {
                    chips = card.ability.extra.TotalChips
                }
            else
                return {
                    chips = card.ability.extra.TotalChips
                }
            end
        end
    end
}