SMODS.Joker{ --HunterJ360
    key = "hunterj360",
    config = {
        extra = {
            active = "False",
            exponentia = 1
        }
    },
    loc_txt = {
        ['name'] = 'HunterJ360',
        ['text'] = {
            [1] = 'When a card is scored increases this Jokers {X:red,C:white}^Mult{} by {X:red,C:white}^0.2{} when Active',
            [2] = '(Active: {C:attention}#1#{}, Currently {X:red,C:white}^#2#{})',
            [3] = '*its like im {C:red}Upgrading Everything{} in some kind of {C:red}Tree{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 360,
    rarity = "EUB_exotica",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_HunterJ360"] = true },
    soul_pos = {
        x = 8,
        y = 4
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.active, card.ability.extra.exponentia}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.calculate_effect({message = "*heh"}, card)
                    return true
                end,
            }))
            return {
                saved = true,
                message = "*...?",
                extra = {
                    func = function()
                        card.ability.extra.active = "True"
                        return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
        if context.individual and context.cardarea == G.play  then
            if card.ability.extra.active == "True" and not context.blueprint then
                card.ability.extra.exponentia = (card.ability.extra.exponentia) + 0.2
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = card.ability.extra.exponentia
            }
        end
    end
}