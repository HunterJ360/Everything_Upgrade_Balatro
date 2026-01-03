
SMODS.Joker{ --Couch Potato
    key = "couchpotato",
    config = {
        extra = {
            currentante = 0
        }
    },
    loc_txt = {
        ['name'] = 'Couch Potato',
        ['text'] = {
            [1] = 'Gives {C:red}+10{} Mult per ante (Currently {C:red}+#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {((G.GAME.round_resets.ante or 0)) * 10}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = (G.GAME.round_resets.ante) * 10
            }
        end
    end
}