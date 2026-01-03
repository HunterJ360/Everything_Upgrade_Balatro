
SMODS.Voucher {
    key = 'generation',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            item_rate0 = 10
        } 
    },
    loc_txt = {
        name = 'Generation',
        text = {
            [1] = '{C:green}Currency{} Cards appear in shop.'
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
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.currency_rate = G.GAME.currency_rate + 10               
                    return true
                end
            }))
        }
    end
}