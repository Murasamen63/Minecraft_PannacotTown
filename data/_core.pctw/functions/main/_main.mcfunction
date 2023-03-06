#> _core.pctw:main/_main
#
# core：常時読み込むfunction
#
# @within tag/function minecraft:tick



#region 内容

# Gamemode変更
    ## モードなし
        execute if data storage pctw:core {GameMode:null} run function _core.pctw:main/tick
    ## 釣り大会
        execute if data storage pctw:core {GameMode:FishingBattle} run function fishing_battle:main/_main

# scoreboard関連
    ## GUI_ID
        ### スコアを保持させる
        execute as @a unless score @s PCTW.Core.GUI.ID = @s PCTW.Core.GUI.ID run scoreboard players add @s PCTW.Core.GUI.ID 0

# AEC関連
    ## 永続生存
        execute as @e[type=area_effect_cloud,tag=PCTW.AEC.AlwaysAlive] at @s run data modify entity @s Age set value 0

# アイテム
    ## スタロー
        ### 所持でChestMinecartを召喚
            
    ## fishing_battle
        function fishing_battle:item/tick
    

# リログ検知
    execute unless entity @a run function _core.pctw:main/_reload


#endregion