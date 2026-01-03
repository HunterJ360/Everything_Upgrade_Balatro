
SMODS.Joker{ --Developer ASAP
    key = "developerasap",
    config = {
        extra = {
            PassedRounds = 0,
            emult0 = 1.2,
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Developer ASAP',
        ['text'] = {
            [1] = '{s:0.8}Does Nothing...?{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Developer Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.PassedRounds}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.PassedRounds or 0)) < to_big(10) then
                return {
                    func = function()
                        card.ability.extra.PassedRounds = (card.ability.extra.PassedRounds) + 1
                        return true
                    end,
                    message = "?"
                }
            end
        end
        if context.repetition and context.cardarea == G.play  then
            if to_big((card.ability.extra.PassedRounds or 0)) >= to_big(10) then
                return {
                    emult = 1.2,
                    message = "wut da hail",
                    extra = {
                        repetitions = 1,
                        message = localize('k_again_ex'),
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}