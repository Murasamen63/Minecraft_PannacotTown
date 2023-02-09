#> _core.pctw:main/_reload
#
# core：初めに読み込むfunction
#
# @within tag/function minecraft:load
#   function _core.pctw:main/_main

#region 宣言

#> Storage
# @public
    #define storage pctw:core

#> Entity Tag
# @public
    #define tag PCTW.AEC.AlwaysAlive
    #define tag PCTW.Player.Staff

#> tag/items
# @public
    #define tag/item _core.pctw:pctw_items
    #define tag/item _core.pctw:debug_items
    #define tag/item _core.pctw:master_gui_switches

#> PCTW Item Tag
    # tag PCTWItems:1b
    # tag PCTWDebugItems:1b
    # tag PCTWMasterGUISwitches:1b

#endregion



#region 内容

# PCTW.Core.Tempのリセット
    scoreboard objectives remove PCTW.Core.Temp

# scoreboard作成
    ## Const
        scoreboard objectives add PCTW.Core.Const dummy
    ## Temporary
        scoreboard objectives add PCTW.Core.Temp dummy
    ## playerID
        scoreboard objectives add PCTW.Core.Player_ID dummy
    ## CoaS
        scoreboard objectives add PCTW.Core.Use.Coas used:carrot_on_a_stick
    ## WFoaS
        scoreboard objectives add PCTW.Core.Use.WFoaS used:warped_fungus_on_a_stick
    ## Talk_Villager
        scoreboard objectives add PCTW.Core.Talk_Villager custom:talked_to_villager
    ## ChestGUI.Page
        scoreboard objectives add PCTW.Core.ChestGUI.Pages dummy

# scoreboard設定
    ## CoaS
        scoreboard players reset * PCTW.Core.Use.Coas
    ## WFoaS
        scoreboard players reset * PCTW.Core.Use.WFoaS
    ## Talk_Villager
        scoreboard players reset * PCTW.Core.Talk_Villager


# storage作成
    ## core
        data modify storage pctw:core GameMode set value null

# function読み込み
    ## 定数
        function _core.pctw:const
    ## アンインストール
        ### 釣り大会
            function fishing_battle:init/uninstall

# data変更
    ## 釣り大会の店員
        execute as @e[type=villager,tag=PCTW.FSBT.Villager.Talk] at @s run data modify entity @s Offers set value {}

# アイテム削除
    ## DebugItems
        clear @a #_core.pctw:debug_items{PCTWDebugItems:1b}
        clear @a #fishing_battle:hooked_item{FSBTHookedItem:1b}

# 通知
    ## 全体通知
        tellraw @a ["","\n","  ",{"text":"Welcome to PannacotTown !!","bold":true,"underlined":true,"color":"gold"},"  -  ","v1.0.0","\n"]


# gamerule設定


#endregion