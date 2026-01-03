
SMODS.Joker{ --Turing Machine
    key = "turingmachine",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Turing Machine',
        ['text'] = {
            [1] = 'Multiplies all {C:green}Static Pack{} Jokers by {X:edition,C:white}X2{}',
            [2] = '{s:0.8}(visually updates when hand is played, only applies once){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Creative Pack"] = true },
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "turing", colour = G.C.BLUE})
                    G.GAME.pool_flags.EUB_turing = true
                    return true
                end
            }))
        end
        if context.selling_self  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "turing", colour = G.C.BLUE})
                    G.GAME.pool_flags.EUB_turing = false
                    return true
                end
            }))
        end
    end
}