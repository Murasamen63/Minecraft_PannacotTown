#> _core.pctw:master_gui/function/1
#
# core : 
#
# @within function
#   _core.pctw:master_gui/page/main



#region 内容

# Item検知
    execute unless data entity @s {Items:[{Slot:0b}]} run scoreboard players set @s PCTW.Core.Temp 1

# 使用プレイヤー以外は触れない
    execute if entity @a[tag=!PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]}] run scoreboard players set @s PCTW.Core.Temp -1
    execute unless score @s PCTW.Core.Player_ID = @a[tag=PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]},limit=1] PCTW.Core.Player_ID run scoreboard players set @s PCTW.Core.Temp -1

# 効果音
    execute if score @s PCTW.Core.Temp matches 1.. as @p[tag=PCTW.Player.Use_MasterGUI] at @s run playsound ui.button.click voice @s ~ ~ ~ 1.0 1.2

# function
    ## Gamemode:FishingBattle
        execute if score @s PCTW.Core.Temp matches 1 run function fishing_battle:init/install
        execute if score @s PCTW.Core.Temp matches 1 run clear @p[tag=PCTW.Player.Use_MasterGUI] fishing_rod{PCTWMasterGUIGameMode1:1b}
        execute if score @s PCTW.Core.Temp matches 1 run function fishing_battle:master_gui/page/1

# -1はリセット
    execute if score @s PCTW.Core.Temp matches -1 run clear @a #_core.pctw:master_gui/button_items{PCTWMasterGUIButton:1b}
    execute if score @s PCTW.Core.Temp matches -1 run function _core.pctw:master_gui/page/1

# 初期化
    execute if score @s PCTW.Core.Temp = @s PCTW.Core.Temp run scoreboard players reset @s PCTW.Core.Temp

#endregion