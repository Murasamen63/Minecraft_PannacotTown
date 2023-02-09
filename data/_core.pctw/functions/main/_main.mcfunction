#> _core.pctw:main/_main
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

# 常時実行
    ## リログ検知
        execute unless entity @a run function _core.pctw:main/_reload
    ## アイテム
        ### pctw_master_stick
            #### 内容
                execute as @a at @s if predicate _core.pctw:selected_item/pctw_master_gui/selected_item run function _core.pctw:pctw_master_gui/main
            #### 未所持で削除
                execute as @a[tag=PCTW.Player.Use.MasterGUI] at @s unless predicate _core.pctw:selected_item/pctw_master_gui/selected_item if score @s PCTW.Core.Player_ID = @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.Summoned_Place,distance=..0.3,sort=nearest,limit=1] PCTW.Core.Player_ID run function _core.pctw:pctw_master_gui/delete
    ## scoreboard
        ### talk_to_villager
            execute if data storage pctw:core {GameMode:null} as @a at @s if score @s PCTW.Core.Talk_Villager matches 1.. run scoreboard players reset @s PCTW.Core.Talk_Villager

#endregion