
SMODS.Joker{ --delulu
    key = "delulu",
    config = {
        extra = {
            xchips0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'delulu',
        ['text'] = {
            [1] = 'All played cards give {X:blue,C:white}X3{} Chips if there are 5 Jokers that are  {C:rare}Rare{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
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
    pools = { ["EUB_Outsourced"] = true, ["EUB_Everything Upgrade Balatro Jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local count = 0
                for _, joker_owned in pairs(G.jokers.cards or {}) do
                    if joker_owned.config.center.rarity == 3 then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(5)
            end)() then
                return {
                    x_chips = 3,
                    message = "delulu"
                }
            end
        end
    end
}