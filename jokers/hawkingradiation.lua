
SMODS.Joker{ --Hawking Radiation
    key = "hawkingradiation",
    config = {
        extra = {
            levels0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Hawking Radiation',
        ['text'] = {
            [1] = 'When a {C:planet}Planet{} is used levels most played hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.EUB_thesunisleaking
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                local temp_played = 0
                local temp_order = math.huge
                local target_hand
                for hand, value in pairs(G.GAME.hands) do 
                    if value.played > temp_played and value.visible then
                        temp_played = value.played
                        temp_order = value.order
                        target_hand = hand
                    elseif value.played == temp_played and value.visible then
                        if value.order < temp_order then
                            temp_order = value.order
                            target_hand = hand
                        end
                    end
                end
                
                level_up_hand(card, target_hand, true, 2)
                return {
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}