SMODS.Sound{
    key="mangoc",
    path="mangoc.ogg",
    pitch=1,
    volume=2,
}

SMODS.Sound{
    key="cotvph1",
    path="cotvph1.ogg",
    pitch=0.7,
    volume=0.6,
}

SMODS.Sound{
    key="cotvph2",
    path="cotvph2.ogg",
    pitch=0.7,
    volume=0.6,
}

SMODS.Sound{
    key="music_cotvph3a",
    path="music_cotvph3a.ogg",
    volume=0.4,
    select_music_track = function()
        if G.jokers ~= nil then
          for _, joker in ipairs(G.jokers.cards) do
              if joker.config.center.key == "j_EUB_hunterj360" then
                  return 1067
              end
          end
        end
        return nil
    end,
}