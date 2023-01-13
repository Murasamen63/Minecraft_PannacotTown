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



#region 内容


# scoreboard作成
    ## Gamemode
        scoreboard objectives add PCTW.GameMode dummy

# storage作成
    data modify storage pctw:core GameMode set value Empty

# 通知
    #tellraw @a 


#endregion