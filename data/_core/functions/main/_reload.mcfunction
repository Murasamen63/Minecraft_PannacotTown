#> _core:main/_reload
#
# core：初めに読み込むfunction
#
# @within tag/function minecraft:load

#region 宣言

#> Storage.core
# @public
    #define storage pctw:core

#> Storage.FishingBattle
# @within
#   function _core:main/_reload
#   * fishing_battle:**
    #define storage pctw:fishing_battle/system
    #define storage pctw:fishing_battle/ranking
    #define storage pctw:fishing_battle/shop_price

#> Entity Tag
# @public
    #define tag PCTW.AEC.AlwaysAlive
    #define tag PCTW.Player.Staff

#endregion



#region 内容

# PCTW.Core.Temporaryのリセット
    scoreboard objectives remove PCTW.Core.Temporary

# scoreboard作成
    ## Const
        scoreboard objectives add PCTW.Core.Const dummy
    ## Temporary
        scoreboard objectives add PCTW.Core.Temporary dummy
    ## playerID
        scoreboard objectives add PCTW.Core.Player_ID dummy
    ## CoaS
        scoreboard objectives add PCTW.Core.Use.Coas used:carrot_on_a_stick
    ## WFoaS
        scoreboard objectives add PCTW.Core.Use.WFoaS used:warped_fungus_on_a_stick
    ## Talk_Villager
        scoreboard objectives add PCTW.Core.Talk_Villager custom:talked_to_villager

# scoreboard設定
    ## CoaS
        scoreboard players reset @a PCTW.Core.Use.Coas
    ## WFoaS
        scoreboard players reset @a PCTW.Core.Use.WFoaS
    ## Talk_Villager
        scoreboard players reset @a PCTW.Core.Talk_Villager


# storage作成
    ## core
        data modify storage pctw:core GameMode set value null
    ## fishing_battle
        ### Ranking
            execute unless data storage pctw:fishing_battle/ranking Ranking run data modify storage pctw:fishing_battle/ranking Ranking set value {1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0}}
        ### System
            data modify storage pctw:fishing_battle/system Timer set value 0
        ### Shop_Price
            execute unless data storage pctw:fishing_battle/shop_price Price run data modify storage pctw:fishing_battle/shop_price Price set value {FishingRod:{DoubleRod:0,LureRod:0,RichRod:0,GamblingRod:0,SlotRod:0}}

# function読み込み
    ## 定数
        function _core:const
    ## アンインストール
        ### 釣り大会
            function fishing_battle:init/uninstall

# アイテム削除
    ## temp_Setting
        clear @a written_book{PCTWTempSettingBook:1b}

# 通知
    ## 全体通知
        tellraw @a ["","\n","  ",{"text":"Welcome to PannacotTown !!","bold":true,"underlined":true,"color":"gold"},"  -  ","v1.0.0","\n"]


# gamerule設定


#endregion