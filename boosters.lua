
SMODS.Booster {
    key = 'StaticPack',
    loc_txt = {
        name = "Static Pack",
        text = {
            [1] = 'Choose from {C:money}1{} of {C:money}2{} Static Jokers'
        },
        group_name = "StaticPack"
    },
    config = { extra = 2, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    group_key = "StaticPack",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = {card.ability.choose, card.ability.extra}
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "EUB_Static Pack",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "EUB_StaticPack"
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour({ new_colour = HEX('ffffff') })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'developer_pack',
        loc_txt = {
            name = "Developer Pack",
            text = {
                [1] = 'Its just {C:red}Developer ASAP{}...'
            },
            group_name = "EUB_boosters"
        },
        config = { extra = 1, choose = 1 },
        atlas = "CustomBoosters",
        pos = { x = 3, y = 0 },
        group_key = "EUB_boosters",
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = {card.ability.choose, card.ability.extra}
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "EUB_Developer Pack",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "EUB_developer_pack"
            }
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        
        
        SMODS.Booster {
            key = 'the_seven_sins_pack',
            loc_txt = {
                name = "The Seven Sins Pack",
                text = {
                    [1] = 'Choose from {C:money}1{} of {C:money}2{} Seven Sins Jokers'
                },
                group_name = "EUB_boosters"
            },
            config = { extra = 2, choose = 1 },
            atlas = "CustomBoosters",
            pos = { x = 1, y = 1 },
            group_key = "EUB_boosters",
            discovered = true,
            loc_vars = function(self, info_queue, card)
                local cfg = {card.ability.choose, card.ability.extra}
                return {
                    vars = { cfg.choose, cfg.extra }
                }
            end,
            create_card = function(self, card, i)
                return {
                    set = "EUB_The Seven Sins Pack",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "EUB_the_seven_sins_pack"
                }
            end,
            particles = function(self)
                -- No particles for joker packs
                end,
            }
            
            
            SMODS.Booster {
                key = 'creative_pack',
                loc_txt = {
                    name = "Creative Pack",
                    text = {
                        [1] = 'Choose from {C:money}1{} of {C:money}2{} Creative Jokers'
                    },
                    group_name = "EUB_boosters"
                },
                config = { extra = 2, choose = 1 },
                atlas = "CustomBoosters",
                pos = { x = 2, y = 1 },
                group_key = "EUB_boosters",
                discovered = true,
                loc_vars = function(self, info_queue, card)
                    local cfg = {card.ability.choose, card.ability.extra}
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    return {
                        set = "EUB_Creative Pack",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "EUB_creative_pack"
                    }
                end,
                particles = function(self)
                    -- No particles for joker packs
                    end,
                }
                
                
                SMODS.Booster {
                    key = 'otherworldly_pack',
                    loc_txt = {
                        name = "Otherworldly Pack",
                        text = {
                            [1] = 'Choose from {C:money}1{} of {C:money}2{} Otherworldly Jokers'
                        },
                        group_name = "EUB_boosters"
                    },
                    config = { extra = 2, choose = 1 },
                    atlas = "CustomBoosters",
                    pos = { x = 0, y = 1 },
                    group_key = "EUB_boosters",
                    discovered = true,
                    loc_vars = function(self, info_queue, card)
                        local cfg = {card.ability.choose, card.ability.extra}
                        return {
                            vars = { cfg.choose, cfg.extra }
                        }
                    end,
                    create_card = function(self, card, i)
                        return {
                            set = "EUB_Otherworldly Pack",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "EUB_otherworldly_pack"
                        }
                    end,
                    particles = function(self)
                        -- No particles for joker packs
                        end,
                    }
                    
                    
                    SMODS.Booster {
                        key = 'foodaholic_pack',
                        loc_txt = {
                            name = "Foodaholic Pack",
                            text = {
                                [1] = 'Choose from {C:money}1{} of {C:money}2{} Foodaholic Jokers'
                            },
                            group_name = "EUB_boosters"
                        },
                        config = { extra = 2, choose = 1 },
                        atlas = "CustomBoosters",
                        pos = { x = 0, y = 0 },
                        group_key = "EUB_boosters",
                        discovered = true,
                        loc_vars = function(self, info_queue, card)
                            local cfg = {card.ability.choose, card.ability.extra}
                            return {
                                vars = { cfg.choose, cfg.extra }
                            }
                        end,
                        create_card = function(self, card, i)
                            return {
                                set = "EUB_Foodaholic Pack",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "EUB_foodaholic_pack"
                            }
                        end,
                        particles = function(self)
                            -- No particles for joker packs
                            end,
                        }
                        
                        
                        SMODS.Booster {
                            key = 'foodaholic_bonus_pack',
                            loc_txt = {
                                name = "Foodaholic Bonus Pack",
                                text = {
                                    [1] = 'Choose from {C:money}1{} of {C:money}2{} Foodaholic Bonus Jokers'
                                },
                                group_name = "EUB_boosters"
                            },
                            config = { extra = 2, choose = 1 },
                            atlas = "CustomBoosters",
                            pos = { x = 1, y = 0 },
                            group_key = "EUB_boosters",
                            discovered = true,
                            loc_vars = function(self, info_queue, card)
                                local cfg = {card.ability.choose, card.ability.extra}
                                return {
                                    vars = { cfg.choose, cfg.extra }
                                }
                            end,
                            create_card = function(self, card, i)
                                return {
                                    set = "EUB_Foodaholic Bonus Pack",
                                    area = G.pack_cards,
                                    skip_materialize = true,
                                    soulable = true,
                                    key_append = "EUB_foodaholic_bonus_pack"
                                }
                            end,
                            particles = function(self)
                                -- No particles for joker packs
                                end,
                            }
                            
                            
                            SMODS.Booster {
                                key = 'currency_pack',
                                loc_txt = {
                                    name = "Currency Pack",
                                    text = {
                                        [1] = 'Choose {C:attention}1{} of {C:attention}3{} {C:green}Currency Cards{}'
                                    },
                                    group_name = "EUB_boosters"
                                },
                                config = { extra = 3, choose = 1 },
                                atlas = "CustomBoosters",
                                pos = { x = 3, y = 1 },
                                group_key = "EUB_boosters",
                                select_card = "consumeables",
                                discovered = true,
                                loc_vars = function(self, info_queue, card)
                                    local cfg = {card.ability.choose, card.ability.extra}
                                    return {
                                        vars = { cfg.choose, cfg.extra }
                                    }
                                end,
                                create_card = function(self, card, i)
                                    return {
                                        set = "currency",
                                        area = G.pack_cards,
                                        skip_materialize = true,
                                        soulable = true,
                                        key_append = "EUB_currency_pack"
                                    }
                                end,
                                particles = function(self)
                                    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                                        timer = 0.015,
                                        scale = 0.2,
                                        initialize = true,
                                        lifespan = 1,
                                        speed = 1.1,
                                        padding = -1,
                                        attach = G.ROOM_ATTACH,
                                        colours = { G.C.WHITE, lighten(G.C.WHITE, 0.8), lighten(G.C.BLACK, 0.2), lighten(G.C.GOLD, 0) },
                                        fill = true
                                    })
                                    G.booster_pack_sparkles.fade_alpha = 1
                                    G.booster_pack_sparkles:fade(1, 0)
                                end,
                            }

                                SMODS.Booster {
                                key = 'mega_currency_pack',
                                loc_txt = {
                                    name = "Mega Currency Pack",
                                    text = {
                                        [1] = 'Choose {C:attention}2{} of {C:attention}5{} {C:green}Currency Cards{}'
                                    },
                                    group_name = "EUB_boosters"
                                },
                                config = { extra = 5, choose = 2 },
                                atlas = "CustomBoosters",
                                pos = { x = 1, y = 2 },
                                group_key = "EUB_boosters",
                                select_card = "consumeables",
                                discovered = true,
                                loc_vars = function(self, info_queue, card)
                                    local cfg = {card.ability.choose, card.ability.extra}
                                    return {
                                        vars = { cfg.choose, cfg.extra }
                                    }
                                end,
                                create_card = function(self, card, i)
                                    return {
                                        set = "currency",
                                        area = G.pack_cards,
                                        skip_materialize = true,
                                        soulable = true,
                                        key_append = "EUB_mega_currency_pack"
                                    }
                                end,
                                particles = function(self)
                                    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                                        timer = 0.015,
                                        scale = 0.2,
                                        initialize = true,
                                        lifespan = 1,
                                        speed = 1.1,
                                        padding = -1,
                                        attach = G.ROOM_ATTACH,
                                        colours = { G.C.WHITE, lighten(G.C.BLACK, 1), lighten(G.C.PURPLE, 0), lighten(G.C.GOLD, 0) },
                                        fill = true
                                    })
                                    G.booster_pack_sparkles.fade_alpha = 1
                                    G.booster_pack_sparkles:fade(1, 0)
                                end,
                            }

                                SMODS.Booster {
                                key = 'jumbo_currency_pack',
                                loc_txt = {
                                    name = "Jumbo Currency Pack",
                                    text = {
                                        [1] = 'Choose {C:attention}1{} of {C:attention}5{} {C:green}Currency Cards{}'
                                    },
                                    group_name = "EUB_boosters"
                                },
                                config = { extra = 5, choose = 1 },
                                atlas = "CustomBoosters",
                                pos = { x = 0, y = 2 },
                                group_key = "EUB_boosters",
                                select_card = "consumeables",
                                discovered = true,
                                loc_vars = function(self, info_queue, card)
                                    local cfg = {card.ability.choose, card.ability.extra}
                                    return {
                                        vars = { cfg.choose, cfg.extra }
                                    }
                                end,
                                create_card = function(self, card, i)
                                    return {
                                        set = "currency",
                                        area = G.pack_cards,
                                        skip_materialize = true,
                                        soulable = true,
                                        key_append = "EUB_jumbo_currency_pack"
                                    }
                                end,
                                particles = function(self)
                                    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                                        timer = 0.015,
                                        scale = 0.2,
                                        initialize = true,
                                        lifespan = 1,
                                        speed = 1.1,
                                        padding = -1,
                                        attach = G.ROOM_ATTACH,
                                        colours = { G.C.WHITE, lighten(G.C.PURPLE, 0), lighten(G.C.BLUE, 0.7), lighten(G.C.WHITE, 0.3) },
                                        fill = true
                                    })
                                    G.booster_pack_sparkles.fade_alpha = 1
                                    G.booster_pack_sparkles:fade(1, 0)
                                end,
                            }