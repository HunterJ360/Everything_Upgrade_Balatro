
SMODS.Shader({ key = 'greyscale', path = 'greyscale.fs' })

SMODS.Edition {
    key = 'delusional',
    shader = 'greyscale',
    config = {
        extra = {
            emult0 = 1.1,
            echips0 = 1.2
        }
    },
    in_shop = true,
    weight = 3,
    extra_cost = 6,
    apply_to_float = false,
    badge_colour = HEX('ffffff'),
    sound = { sound = "multhit2", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'delusional',
        label = 'delusional',
        text = {
            [1] = 'Gives {X:red,C:white}^1.1{} Mult and {X:blue,C:white}^1.2{} Chips',
            [2] = '{s:0.8}Maybe your a bit {C:dark_edition}delusional{}...'
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
                e_mult = 1.1,
                extra = {
                    e_chips = 1.2,
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}