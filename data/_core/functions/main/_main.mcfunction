#> _core:main/_main
#
# core：常時読み込むfunction
#
# @within tag/function minecraft:tick



#region 内容


# Gamemode変更
    ## 釣り大会
        execute if data storage pctw:core {GameMode:FishingBattle} run function fishing_battle:main/_main


#endregion