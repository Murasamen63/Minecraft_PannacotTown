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
    ## 人狼
        execute if data storage pctw:core {GameMode:Werewolf} run function werewolf:main/_main

# scoreboard設定
    ## Player_ID
        execute as @a unless score @s PCTW.Core.Player_ID = @s PCTW.Core.Player_ID store result score @s PCTW.Core.Player_ID run data get entity @s UUID[0]

# entity関連
    ## minecart
        execute as @e[type=#_core.pctw:minecarts,tag=!PCTW.Minecart.Set.Done] run function _core.pctw:invisible_minecart

# item関連
    ## スタロー
        ### 所持
            execute as @a[tag=PCTW.Player.Staff,gamemode=!spectator] if predicate _core.pctw:selected_item/pctw_master_stick at @s run function _core.pctw:master_gui/main
        ### オフ
            #### 未所持
                execute as @a[tag=PCTW.Player.Use_MasterGUI] unless predicate _core.pctw:selected_item/pctw_master_stick at @s run function _core.pctw:master_gui/reset
            #### ゲームモード
                execute as @a[tag=PCTW.Player.Use_MasterGUI,gamemode=spectator] at @s run function _core.pctw:master_gui/reset
    ## fishing_battle
        function fishing_battle:item/tick

# リログ検知
    execute unless entity @a run function _core.pctw:main/_reload


#endregion