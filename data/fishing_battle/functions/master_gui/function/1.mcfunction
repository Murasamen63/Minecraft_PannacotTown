#> fishing_battle:master_gui/function/1
#
# core : 
#
# @within function
#   fishing_battle:master_gui/function/main



#region 内容

# Item検知
    execute unless data entity @s {Items:[{Slot:26b}]} run scoreboard players set @s PCTW.Core.Temp 5

# 使用プレイヤー以外は触れない
    execute if entity @a[tag=!PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]}] run scoreboard players set @s PCTW.Core.Temp -1
    execute unless score @s PCTW.Core.Player_ID = @a[tag=PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]},limit=1] PCTW.Core.Player_ID run scoreboard players set @s PCTW.Core.Temp -1

# 効果音
    execute if score @s PCTW.Core.Temp matches 1.. as @p[tag=PCTW.Player.Use_MasterGUI] at @s run playsound ui.button.click voice @s ~ ~ ~ 1.0 1.2

# function
    ## 制限時間設定
    ## チーム設定
    ## 特殊ルール
    ## ゲームスタート
    ## ゲームモード選択に戻る
        execute if score @s PCTW.Core.Temp matches 5 run function fishing_battle:init/uninstall
        execute if score @s PCTW.Core.Temp matches 5 run clear @p[tag=PCTW.Player.Use_MasterGUI] book{FSBTMasterGUIBackToGameSelect:1b}
        execute if score @s PCTW.Core.Temp matches 5 run function _core.pctw:master_gui/content/page/1

# -1はリセット
    execute if score @s PCTW.Core.Temp matches -1 run clear @a #_core.pctw:master_gui/button_items{PCTWMasterGUIGameMode1:1b}
    execute if score @s PCTW.Core.Temp matches -1 run function fishing_battle:master_gui/page/1

# 初期化
    execute if score @s PCTW.Core.Temp = @s PCTW.Core.Temp run scoreboard players reset @s PCTW.Core.Temp

#endregion