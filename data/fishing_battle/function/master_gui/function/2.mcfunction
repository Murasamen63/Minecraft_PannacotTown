#> fishing_battle:master_gui/function/2
#
# fishing_battle : 
#
# @within function
#   fishing_battle:master_gui/function/main



#region 内容

# Item検知
    execute unless data entity @s {Items:[{Slot:10b}]} run scoreboard players set @s PCTW.Core.Temp 1
    execute unless data entity @s {Items:[{Slot:11b}]} run scoreboard players set @s PCTW.Core.Temp 2
    execute unless data entity @s {Items:[{Slot:12b}]} run scoreboard players set @s PCTW.Core.Temp 3
    execute unless data entity @s {Items:[{Slot:13b}]} run scoreboard players set @s PCTW.Core.Temp 4
    execute unless data entity @s {Items:[{Slot:14b}]} run scoreboard players set @s PCTW.Core.Temp 5
    execute unless data entity @s {Items:[{Slot:15b}]} run scoreboard players set @s PCTW.Core.Temp 6
    execute unless data entity @s {Items:[{Slot:16b}]} run scoreboard players set @s PCTW.Core.Temp 7
    execute unless data entity @s {Items:[{Slot:26b}]} run scoreboard players set @s PCTW.Core.Temp 8

# 使用プレイヤー以外は触れない
    execute if entity @a[tag=!PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]}] run scoreboard players set @s PCTW.Core.Temp -1
    execute unless score @s PCTW.Core.Player_ID = @a[tag=PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]},limit=1] PCTW.Core.Player_ID run scoreboard players set @s PCTW.Core.Temp -1

# 効果音
    execute if score @s PCTW.Core.Temp matches 1..3 as @p[tag=PCTW.Player.Use_MasterGUI] at @s run playsound ui.button.click voice @s ~ ~ ~ 1.0 0.7
    execute if score @s PCTW.Core.Temp matches 5..7 as @p[tag=PCTW.Player.Use_MasterGUI] at @s run playsound ui.button.click voice @s ~ ~ ~ 1.0 1.4
    execute if score @s PCTW.Core.Temp matches 8.. as @p[tag=PCTW.Player.Use_MasterGUI] at @s run playsound ui.button.click voice @s ~ ~ ~ 1.0 1.2

# function
    ## -5m
        execute if score @s PCTW.Core.Temp matches 1 unless score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 6000.. run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 0
        execute if score @s PCTW.Core.Temp matches 1 if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 6000.. run scoreboard players remove $PCTW.FSBT.System PCTW.FSBT.GameTimer 6000
        #execute if score @s PCTW.Core.Temp matches 1 run clear @p[tag=PCTW.Player.Use_MasterGUI] blue_stained_glass{FSBTMasterGUITimer-5m:1b}
        execute if score @s PCTW.Core.Temp matches 1 run function fishing_battle:master_gui/page/2
    ## -1m
        execute if score @s PCTW.Core.Temp matches 2 unless score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1200.. run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 0
        execute if score @s PCTW.Core.Temp matches 2 if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1200.. run scoreboard players remove $PCTW.FSBT.System PCTW.FSBT.GameTimer 1200
        #execute if score @s PCTW.Core.Temp matches 2 run clear @p[tag=PCTW.Player.Use_MasterGUI] blue_stained_glass{FSBTMasterGUITimer-1m:1b}
        execute if score @s PCTW.Core.Temp matches 2 run function fishing_battle:master_gui/page/2
    ## -10s
        execute if score @s PCTW.Core.Temp matches 3 unless score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 200.. run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 0
        execute if score @s PCTW.Core.Temp matches 3 if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 200.. run scoreboard players remove $PCTW.FSBT.System PCTW.FSBT.GameTimer 200
        #execute if score @s PCTW.Core.Temp matches 3 run clear @p[tag=PCTW.Player.Use_MasterGUI] light_blue_stained_glass{FSBTMasterGUITimer-10s:1b}
        execute if score @s PCTW.Core.Temp matches 3 run function fishing_battle:master_gui/page/2
    ## 制限時間
        #execute if score @s PCTW.Core.Temp matches 4 run clear @p[tag=PCTW.Player.Use_MasterGUI] clock{FSBTMasterGUITimer:1b}
        execute if score @s PCTW.Core.Temp matches 4 run function fishing_battle:master_gui/page/2
    ## +10s
        execute if score @s PCTW.Core.Temp matches 5 run scoreboard players add $PCTW.FSBT.System PCTW.FSBT.GameTimer 200
        #execute if score @s PCTW.Core.Temp matches 5 run clear @p[tag=PCTW.Player.Use_MasterGUI] orange_stained_glass{FSBTMasterGUITimer+10s:1b}
        execute if score @s PCTW.Core.Temp matches 5 run function fishing_battle:master_gui/page/2
    ## +1m
        execute if score @s PCTW.Core.Temp matches 6 run scoreboard players add $PCTW.FSBT.System PCTW.FSBT.GameTimer 1200
        #execute if score @s PCTW.Core.Temp matches 6 run clear @p[tag=PCTW.Player.Use_MasterGUI] red_stained_glass{FSBTMasterGUITimer+1m:1b}
        execute if score @s PCTW.Core.Temp matches 6 run function fishing_battle:master_gui/page/2
    ## +5m
        execute if score @s PCTW.Core.Temp matches 7 run scoreboard players add $PCTW.FSBT.System PCTW.FSBT.GameTimer 6000
        #execute if score @s PCTW.Core.Temp matches 7 run clear @p[tag=PCTW.Player.Use_MasterGUI] red_stained_glass{FSBTMasterGUITimer+5m:1b}
        execute if score @s PCTW.Core.Temp matches 7 run function fishing_battle:master_gui/page/2
    ## 戻る
        execute if score @s PCTW.Core.Temp matches 8 run scoreboard players set @s PCTW.Core.Chest_GUI.Page 1
        #execute if score @s PCTW.Core.Temp matches 8 run clear @p[tag=PCTW.Player.Use_MasterGUI] book{FSBTMasterGUIBackToTop:1b}
        execute if score @s PCTW.Core.Temp matches 8 run function fishing_battle:master_gui/page/1

# -1はリセット
    #execute if score @s PCTW.Core.Temp matches -1 run clear @a #_core.pctw:master_gui/button_items{PCTWMasterGUIButton:1b}
    execute if score @s PCTW.Core.Temp matches -1 run function fishing_battle:master_gui/page/2

# 初期化
    execute if score @s PCTW.Core.Temp = @s PCTW.Core.Temp run scoreboard players reset @s PCTW.Core.Temp

#endregion