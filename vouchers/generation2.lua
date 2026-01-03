
SMODS.Voucher {
    key = 'generation2',
    pos = { x = 1, y = 0 },
    config = { 
        extra = {
            item_rate0 = 2
        } 
    },
    loc_txt = {
        name = 'Generation^2',
        text = {
            [1] = 'Makes {C:green}Currency{} Cards X2 more likely.'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_EUB_generation'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.currency_rate = G.GAME.currency_rate * 2               
                    return true
                end
            }))
        }
    end
}