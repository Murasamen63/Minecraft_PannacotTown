#> _core:main/_reload
#
# core：初めに読み込むfunction
#
# @within tag/function minecraft:load

#> Storage
# @public
    #define storage pctw:core
    #define storage pctw:fishing_battle/system
    #define storage pctw:fishing_battle/ranking



#region 内容


# scoreboard作成
    ## Const
        scoreboard objectives add PCTW.Const dummy

# storage作成
    ## core
        data modify storage pctw:core GameMode set value null
    ## fishing_battle
        execute unless data storage pctw:fishing_battle/ranking Ranking run data modify storage pctw:fishing_battle/ranking Ranking set value {1:{Name:null,Score:0},2:{Name:null,Score:0},3:{Name:null,Score:0},4:{Name:null,Score:0},5:{Name:null,Score:0}}
        data modify storage pctw:fishing_battle/system Timer set value 6000

# アンインストール
    ## 釣り大会
        function fishing_battle:init/uninstall


# 通知
    #tellraw @a 


#endregion