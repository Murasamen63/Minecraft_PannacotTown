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

# Entity関連
    ## Minecart
        execute as @e[tag=!PCTW.Chest_Minecart.GUI,tag=!PCTW.Show.Minecart.Done] run function _core.pctw:show_normal_minecarts

# item関連
    ## スタロー
        ### 所持
            #execute as @a[tag=PCTW.Player.Staff] if score @s PCTW.Core.GUI.ID matches 0 if predicate _core.pctw:selected_item/master_gui/mainhand at @s run function _core.pctw:master_gui/summon
        ### 未所持
            #execute as @a[tag=PCTW.Player.Staff] if score @s PCTW.Core.GUI.ID matches 1.. unless predicate _core.pctw:selected_item/master_gui/mainhand at @s run function
    ## pctw_master_stick
        ### 内容
            execute as @a at @s if predicate _core.pctw:selected_item/pctw_master_gui/selected_item run function _core.pctw:pctw_master_gui/main
        ### 未所持で削除
            execute as @a[tag=PCTW.Player.Use.MasterGUI] at @s unless predicate _core.pctw:selected_item/pctw_master_gui/selected_item if score @s PCTW.Core.Player_ID = @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.Summoned_Place,distance=..0.3,sort=nearest,limit=1] PCTW.Core.Player_ID run function _core.pctw:pctw_master_gui/delete
    ## fishing_battle
        function fishing_battle:item/tick
    

# リログ検知
    execute unless entity @a run function _core.pctw:main/_reload


#endregion