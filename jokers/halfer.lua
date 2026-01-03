
SMODS.Joker{ --Halfer
    key = "halfer",
    config = {
        extra = {
            xmult0 = 0.5,
            xchips0 = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Halfer',
        ['text'] = {
            [1] = '{X:red,C:white}Halfs{} your score, destroys itself at Ante 8, {C:attention}+1{} Joker Slot.',
            [2] = '{C:inactive,s:0.8}Goodluck! Also crashes the game if this joker isnt in the rightmost slot.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rta' and args.source ~= 'wra' 
            or args.source == 'rif' or args.source == 'sou' or args.source == 'uta'
        )
        and true
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not ((function()
                return G.jokers.cards[#G.jokers.cards] == card
            end)()) then
                error("EasternFarmer Was Here")
            else
                return {
                    Xmult = 0.5,
                    extra = {
                        x_chips = 0.5,
                        colour = G.C.DARK_EDITION
                    }
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if to_big(G.GAME.round_resets.ante) > to_big(8) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:shatter({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Goodluck!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_EUB_halfer" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    	if e.config.ref_table.config.center.key == "j_EUB_halfer" then
        		e.config.colour = G.C.GREEN
        		e.config.button = "use_card"
    	else
        		can_select_card_ref(e)
    	end
end