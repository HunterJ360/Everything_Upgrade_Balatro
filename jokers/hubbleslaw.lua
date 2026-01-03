
SMODS.Joker{ --Hubbles Law
    key = "hubbleslaw",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Hubbles Law',
        ['text'] = {
            [1] = '{C:purple}Gamma{} levels most played hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "hubble", colour = G.C.BLUE})
                    G.GAME.pool_flags.EUB_hubble = true
                    return true
                end
            }))
        end
        if context.starting_shop  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "hubble", colour = G.C.BLUE})
                    G.GAME.pool_flags.EUB_hubble = true
                    return true
                end
            }))
        end
        if context.ending_shop  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "hubble", colour = G.C.BLUE})
                    G.GAME.pool_flags.EUB_hubble = true
                    return true
                end
            }))
        end
    end
}