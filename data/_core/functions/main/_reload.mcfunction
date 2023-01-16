#> _core:main/_reload
#
# core：初めに読み込むfunction
#
# @within tag/function minecraft:load

#region 宣言

#> Storage
# @public
    #define storage pctw:core
    #define storage pctw:fishing_battle/system
    #define storage pctw:fishing_battle/ranking

#> Entity Tag
# @public
    #define tag PCTW.AEC.AlwaysAlive


#endregion

#region 内容


# scoreboard作成
    ## Const
        scoreboard objectives add PCTW.Const dummy
    ## CoaS
        scoreboard objectives add PCTW.Use.Coas used:carrot_on_a_stick
    ## WFoaS
        scoreboard objectives add PCTW.Use.WFoaS used:warped_fungus_on_a_stick

# storage作成
    ## core
        data modify storage pctw:core GameMode set value null
    ## fishing_battle
        execute unless data storage pctw:fishing_battle/ranking Ranking run data modify storage pctw:fishing_battle/ranking Ranking set value {1:{Name:null,Score:0},2:{Name:null,Score:0},3:{Name:null,Score:0},4:{Name:null,Score:0},5:{Name:null,Score:0}}
        data modify storage pctw:fishing_battle/system Timer set value 6000


# function読み込み
    ## 定数
        function _core:const
    ## アンインストール
        ### 釣り大会
            function fishing_battle:init/uninstall


# 通知
    #tellraw @a 

#endregion