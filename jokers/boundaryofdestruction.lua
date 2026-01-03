
SMODS.Joker{ --Boundary of Destruction
    key = "boundaryofdestruction",
    config = {
        extra = {
            DestroyedCardMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Boundary of Destruction',
        ['text'] = {
            [1] = 'Destroys all scored cards and gains {X:red,C:white}X0.25{} Mult for every destroyed card (Currently {X:red,C:white}X#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Otherworldly Pack"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.DestroyedCardMult}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            context.other_card.should_destroy = true
            card.ability.extra.DestroyedCardMult = (card.ability.extra.DestroyedCardMult) + 0.25
            return {
                message = "Destroyed!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.DestroyedCardMult
            }
        end
    end
}