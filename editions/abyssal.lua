
SMODS.Shader({ key = 'fluorescent', path = 'fluorescent.fs' })

SMODS.Edition {
    key = 'abyssal',
    shader = 'fluorescent',
    config = {
        extra = {
            xchips0 = 2.5,
            dollars0 = 3
        }
    },
    in_shop = true,
    weight = 9,
    extra_cost = 4,
    apply_to_float = false,
    badge_colour = HEX('8000ff'),
    sound = { sound = "chips2", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Abyssal',
        label = 'Abyssal',
        text = {
            [1] = 'Gives {X:blue,C:white}X2.5{} and {C:money}$3{}'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_chips = 2.5,
                extra = {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 3
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                        return true
                    end,
                    colour = G.C.MONEY
                }
            }
        end
    end
}