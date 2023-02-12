#> _core.pctw:main/tick
#
# _core.pctw：モードなしの状態で常時実行させるfunction
#
# @within function _core.pctw:main/_main



#region 内容

# scoreboard
    ## talk_to_villager
        execute as @a at @s if score @s PCTW.Core.Talk_Villager matches 1.. run scoreboard players reset @s PCTW.Core.Talk_Villager

#endregion