#> fishing_battle:master_gui/function/3
#
# fishing_battle : 
#
# @within function
#   fishing_battle:master_gui/function/main



#region 内容

# Item検知
    execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} unless data entity @s {Items:[{Slot:11b,tag:{FSBTMasterGUITeamOff:1b}}]} run scoreboard players set @s PCTW.Core.Temp 1
    execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} unless data entity @s {Items:[{Slot:11b,tag:{FSBTMasterGUITeamOn:1b}}]} run scoreboard players set @s PCTW.Core.Temp 2
    execute unless data entity @s {Items:[{Slot:13b}]} run scoreboard players set @s PCTW.Core.Temp 3
    execute unless data entity @s {Items:[{Slot:14b}]} run scoreboard players set @s PCTW.Core.Temp 4
    execute unless data entity @s {Items:[{Slot:15b}]} run scoreboard players set @s PCTW.Core.Temp 5
    execute unless data entity @s {Items:[{Slot:26b}]} run scoreboard players set @s PCTW.Core.Temp 6

# 使用プレイヤー以外は触れない
    execute if entity @a[tag=!PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]}] run scoreboard players set @s PCTW.Core.Temp -1
    execute unless score @s PCTW.Core.Player_ID = @a[tag=PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]},limit=1] PCTW.Core.Player_ID run scoreboard players set @s PCTW.Core.Temp -1

# 効果音
    execute if score @s PCTW.Core.Temp matches 1.. as @p[tag=PCTW.Player.Use_MasterGUI] at @s run playsound ui.button.click voice @s ~ ~ ~ 1.0 1.2

# function
    ## チーム戦:オフ
        execute if score @s PCTW.Core.Temp matches 1 run data modify storage pctw:fishing_battle/system System.Team.Enable set value 1b
        #execute if score @s PCTW.Core.Temp matches 1 run clear @p[tag=PCTW.Player.Use_MasterGUI] white_wool{FSBTMasterGUITeamOff:1b}
        execute if score @s PCTW.Core.Temp matches 1 run function fishing_battle:master_gui/page/3
    ## チーム戦:オン
        execute if score @s PCTW.Core.Temp matches 2 run data modify storage pctw:fishing_battle/system System.Team.Enable set value 0b
        #execute if score @s PCTW.Core.Temp matches 2 run clear @p[tag=PCTW.Player.Use_MasterGUI] red_wool{FSBTMasterGUITeamOn:1b}
        execute if score @s PCTW.Core.Temp matches 2 run function fishing_battle:master_gui/page/3
    ## 数:2チーム
        execute if score @s PCTW.Core.Temp matches 3 run data modify storage pctw:fishing_battle/system System.Team.Count set value 2
        #execute if score @s PCTW.Core.Temp matches 3 run clear @p[tag=PCTW.Player.Use_MasterGUI] blue_banner{FSBTMasterGUITeamNum2:1b}
        execute if score @s PCTW.Core.Temp matches 3 run function fishing_battle:master_gui/page/3
    ## 数:3チーム
        execute if score @s PCTW.Core.Temp matches 4 run data modify storage pctw:fishing_battle/system System.Team.Count set value 3
        #execute if score @s PCTW.Core.Temp matches 4 run clear @p[tag=PCTW.Player.Use_MasterGUI] yellow_banner{FSBTMasterGUITeamNum3:1b}
        execute if score @s PCTW.Core.Temp matches 4 run function fishing_battle:master_gui/page/3
    ## 数:4チーム
        execute if score @s PCTW.Core.Temp matches 5 run data modify storage pctw:fishing_battle/system System.Team.Count set value 4
        #execute if score @s PCTW.Core.Temp matches 5 run clear @p[tag=PCTW.Player.Use_MasterGUI] lime_banner{FSBTMasterGUITeamNum4:1b}
        execute if score @s PCTW.Core.Temp matches 5 run function fishing_battle:master_gui/page/3
    ## 戻る
        execute if score @s PCTW.Core.Temp matches 6 run scoreboard players set @s PCTW.Core.Chest_GUI.Page 1
        #execute if score @s PCTW.Core.Temp matches 6 run clear @p[tag=PCTW.Player.Use_MasterGUI] book{FSBTMasterGUIBackToTop:1b}
        execute if score @s PCTW.Core.Temp matches 6 run function fishing_battle:master_gui/page/1

# -1はリセット
    #execute if score @s PCTW.Core.Temp matches -1 run clear @a #_core.pctw:master_gui/button_items{PCTWMasterGUIButton:1b}
    execute if score @s PCTW.Core.Temp matches -1 run function fishing_battle:master_gui/page/3

# 初期化
    execute if score @s PCTW.Core.Temp = @s PCTW.Core.Temp run scoreboard players reset @s PCTW.Core.Temp

#endregion