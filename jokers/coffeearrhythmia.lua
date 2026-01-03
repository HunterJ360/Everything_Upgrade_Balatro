
SMODS.Joker{ --Coffee Arrhythmia
    key = "coffeearrhythmia",
    config = {
        extra = {
            voucher_slots_increase = '1',
            booster_slots_increase = '1'
        }
    },
    loc_txt = {
        ['name'] = 'Coffee Arrhythmia',
        ['text'] = {
            [1] = 'Adds {C:money}1 Voucher Slot{}, and {C:money}1 Booster Pack Slot{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
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
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Pack"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(1)
        SMODS.change_booster_limit(1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-1)
        SMODS.change_booster_limit(-1)
    end
}