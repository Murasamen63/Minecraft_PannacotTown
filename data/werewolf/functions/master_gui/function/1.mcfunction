#> werewolf:master_gui/function/1
#
# core : MasterGUIの釣り大会用の
#
# @within function
#   werewolf:master_gui/function/main



#region 内容

# Item検知
    execute unless data entity @s {Items:[{Slot:10b}]} run scoreboard players set @s PCTW.Core.Temp 1
    execute unless data entity @s {Items:[{Slot:11b}]} run scoreboard players set @s PCTW.Core.Temp 2
    execute unless data entity @s {Items:[{Slot:16b}]} run scoreboard players set @s PCTW.Core.Temp 3
    execute unless data entity @s {Items:[{Slot:26b}]} run scoreboard players set @s PCTW.Core.Temp 4

# 使用プレイヤー以外は触れない
    execute if entity @a[tag=!PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]}] run scoreboard players set @s PCTW.Core.Temp -1
    execute unless score @s PCTW.Core.Player_ID = @a[tag=PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]},limit=1] PCTW.Core.Player_ID run scoreboard players set @s PCTW.Core.Temp -1

# 効果音
    execute if score @s PCTW.Core.Temp matches 1.. as @p[tag=PCTW.Player.Use_MasterGUI] at @s run playsound ui.button.click voice @s ~ ~ ~ 1.0 1.2

# function
    ## 制限時間設定
        execute if score @s PCTW.Core.Temp matches 2 run scoreboard players set @s PCTW.Core.Chest_GUI.Page 2
        execute if score @s PCTW.Core.Temp matches 2 run clear @p[tag=PCTW.Player.Use_MasterGUI] clock{WWMasterGUITimerSet:1b}
        execute if score @s PCTW.Core.Temp matches 2 run function werewolf:master_gui/page/2
    ## ゲームスタート
        execute if score @s PCTW.Core.Temp matches 3 run scoreboard players set $PCTW.WW.System PCTW.WW.GameState 1
        execute if score @s PCTW.Core.Temp matches 3 run clear @p[tag=PCTW.Player.Use_MasterGUI] command_block{WWMasterGUIGameStart:1b}
        execute if score @s PCTW.Core.Temp matches 3 as @p[tag=PCTW.Player.Use_MasterGUI] run function _core.pctw:master_gui/reset
    ## ゲームモード選択に戻る
        execute if score @s PCTW.Core.Temp matches 4 run function werewolf:init/uninstall
        execute if score @s PCTW.Core.Temp matches 4 run clear @p[tag=PCTW.Player.Use_MasterGUI] book{WWMasterGUIBackToGameSelect:1b}
        execute if score @s PCTW.Core.Temp matches 4 run function _core.pctw:master_gui/page/1

# -1はリセット
    execute if score @s PCTW.Core.Temp matches -1 run clear @a #_core.pctw:master_gui/button_items{PCTWMasterGUIButton:1b}
    execute if score @s PCTW.Core.Temp matches -1 run function werewolf:master_gui/page/1

# 初期化
    execute if score @s PCTW.Core.Temp = @s PCTW.Core.Temp run scoreboard players reset @s PCTW.Core.Temp

#endregion