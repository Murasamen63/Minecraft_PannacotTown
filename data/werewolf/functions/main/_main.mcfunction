#> werewolf:main/_main
#
# werewolf：
#
# @within function _core.pctw:main/_main



#region 内容

# GameState
    ## GameState = 0
        execute if predicate werewolf:game_state/1_ready run function werewolf:main/game_state/1_ready
    ## GameState = 1
        execute if predicate werewolf:game_state/2_countdown run function werewolf:main/game_state/2_countdown
    ## GameState = 2
        execute if predicate werewolf:game_state/3_play run function werewolf:main/game_state/3_play
    ## GameState = 3
        execute if predicate werewolf:game_state/4_result run function werewolf:main/game_state/4_result

#endregion