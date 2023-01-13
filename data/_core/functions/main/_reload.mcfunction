#> _core:main/_reload
#
# core：初めに読み込むfunction
#
# @within tag/function minecraft:load

#> Score Holder
# @public
    #define score_holder PCTW.System

#> Storage
# @public
    #define storage pctw:core
    #define storage pctw:fishing_battle/ranking



#region 内容


# scoreboard作成
    ## Const
        scoreboard objectives add PCTW.Const dummy

# storage作成
    ## core
        data modify storage pctw:core GameMode set value null

# 通知
    #tellraw @a 


#endregion