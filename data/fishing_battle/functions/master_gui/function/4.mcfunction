#> fishing_battle:master_gui/function/4
#
# fishing_battle : 
#
# @within function
#   fishing_battle:master_gui/function/main



#region 内容

# Item検知
    execute unless data entity @s {Items:[{Slot:0b}]} run scoreboard players set @s PCTW.Core.Temp 1
    execute unless data entity @s {Items:[{Slot:1b}]} run scoreboard players set @s PCTW.Core.Temp 2
    execute unless data entity @s {Items:[{Slot:26b}]} run scoreboard players set @s PCTW.Core.Temp 3

# 使用プレイヤー以外は触れない
    execute if entity @a[tag=!PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]}] run scoreboard players set @s PCTW.Core.Temp -1
    execute unless score @s PCTW.Core.Player_ID = @a[tag=PCTW.Player.Use_MasterGUI,nbt={Inventory:[{tag:{PCTWMasterGUIButton:1b}}]},limit=1] PCTW.Core.Player_ID run scoreboard players set @s PCTW.Core.Temp -1

# 効果音
    execute if score @s PCTW.Core.Temp matches 1.. as @p[tag=PCTW.Player.Use_MasterGUI] at @s run playsound ui.button.click voice @s ~ ~ ~ 1.0 1.2
    execute if score @s PCTW.Core.Temp matches 1..2 as @p[tag=PCTW.Player.Use_MasterGUI] at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.3

# function
    ## ランク戦
        execute if score @s PCTW.Core.Temp matches 1 run data modify storage pctw:fishing_battle/system System.Team.Enable set value 0b
        execute if score @s PCTW.Core.Temp matches 1 run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 6000
        execute if score @s PCTW.Core.Temp matches 1 run data modify storage pctw:fishing_battle/shop_price Price set value {FishingRod:{DoubleRod:15,LureRod:70,RichRod:160,GamblingRod:180,SlotRod:230}}
        execute if score @s PCTW.Core.Temp matches 1 run data modify storage pctw:fishing_battle/system System.Ranking set value 1b
        execute if score @s PCTW.Core.Temp matches 1 run tellraw @a ["","\n","  ",{"text":"ゲームルール変更","underlined":true,"color":"yellow"},"\n","\n","  『",{"text":"ランク戦","bold":true,"color":"light_purple"},"』","\n"]
        execute if score @s PCTW.Core.Temp matches 1 run clear @p[tag=PCTW.Player.Use_MasterGUI] golden_sword{FSBTMasterGUIRuleRanking:1b}
        execute if score @s PCTW.Core.Temp matches 1 run function fishing_battle:master_gui/page/4
    ## おじガチャ大会
        execute if score @s PCTW.Core.Temp matches 2 run data modify storage pctw:fishing_battle/shop_price Price set value {FishingRod:{DoubleRod:99999,LureRod:99999,RichRod:99999,GamblingRod:99999,SlotRod:0}}
        execute if score @s PCTW.Core.Temp matches 2 run tellraw @a ["","\n","  ",{"text":"ゲームルール変更","underlined":true,"color":"yellow"},"\n","\n","  『",{"text":"おじガチャ大会","bold":true,"color":"aqua"},"』","\n"]
        execute if score @s PCTW.Core.Temp matches 2 run clear @p[tag=PCTW.Player.Use_MasterGUI] emerald{FSBTMasterGUIRuleSlot:1b}
        execute if score @s PCTW.Core.Temp matches 2 run function fishing_battle:master_gui/page/4
    ## 戻る
        execute if score @s PCTW.Core.Temp matches 3 run scoreboard players set @s PCTW.Core.Chest_GUI.Page 1
        execute if score @s PCTW.Core.Temp matches 3 run clear @p[tag=PCTW.Player.Use_MasterGUI] book{FSBTMasterGUIBackToTop:1b}
        execute if score @s PCTW.Core.Temp matches 3 run function fishing_battle:master_gui/page/1

# -1はリセット
    execute if score @s PCTW.Core.Temp matches -1 run clear @a #_core.pctw:master_gui/button_items{PCTWMasterGUIButton:1b}
    execute if score @s PCTW.Core.Temp matches -1 run function fishing_battle:master_gui/page/4

# 初期化
    execute if score @s PCTW.Core.Temp = @s PCTW.Core.Temp run scoreboard players reset @s PCTW.Core.Temp

#endregion