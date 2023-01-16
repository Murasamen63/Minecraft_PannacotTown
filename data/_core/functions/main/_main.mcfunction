#> _core:main/_main
#
# core：常時読み込むfunction
#
# @within tag/function minecraft:tick



#region 内容


# Gamemode変更
    ## 釣り大会
        execute if data storage pctw:core {GameMode:FishingBattle} run function fishing_battle:main/_main

# AEC関連
    ## 永続生存
        execute as @e[type=area_effect_cloud,tag=PCTW.AEC.AlwaysAlive] at @s run data modify entity @s Age set value 0


#endregion