
SMODS.Joker{ --Fruuuuuuuuuuuuuuuuuuits
    key = "fruuuuuuuuuuuuuuuuuuits",
    config = {
        extra = {
            repetitions = 1,
            xchips0 = 1.5,
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Fruuuuuuuuuuuuuuuuuuits',
        ['text'] = {
            [1] = 'Every {C:gold}Mango{} in consumable area gives {X:red,C:white}X1.5{} Mult and {X:blue,C:white}X1.5{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["EUB_EUB_jokers"] = true, ["EUB_Foodaholic Bonus Pack Legendary"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_EUB_mango"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_EUB_mango\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local count = 0
            for _, consumable_card in pairs(G.consumeables.cards or {}) do
                if consumable_card.config.center.key == "c_EUB_mango" then
                    count = count + 1
                end
            end

            if to_big(count) >= to_big(1) then
                local reps = card.ability.extra.repetitions or 1
                local total = tonumber(tostring(count)) * reps
                for i = 1, total do
                    SMODS.calculate_effect({x_chips = 1.5}, card)
                    SMODS.calculate_effect({Xmult = 1.5}, card)
                end
            end
        end
    end
}