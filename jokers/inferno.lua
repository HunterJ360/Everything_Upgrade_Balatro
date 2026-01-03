
SMODS.Joker{ --Inferno
    key = "inferno",
    config = {
        extra = {
            RoundsPassedXMult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Inferno',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X4{} Mult but loses {X:red,C:white}X0.25{} Mult per round (Currently {X:red,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_The Seven Sins Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.RoundsPassedXMult}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if to_big((card.ability.extra.RoundsPassedXMult or 0)) > to_big(1) then
                return {
                    func = function()
                        card.ability.extra.RoundsPassedXMult = math.max(0, (card.ability.extra.RoundsPassedXMult) - 0.25)
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.RoundsPassedXMult
            }
        end
    end
}