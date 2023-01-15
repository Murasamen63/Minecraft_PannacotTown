#> fishing_battle:main/_main
#
# fishing_battle：初めに読み込むfunction
#
# @within function _core:main/_main



#region 内容


# GameState
    ## GameState = 0
        execute if score $PCTW.FSBT.System PCTW.FSBT.GameState = $PCTW.FSBT.GameState.Ready PCTW.FSBT.GameState run function fishing_battle:main/game_state/1_ready
    ## GameState = 1
        execute if score $PCTW.FSBT.System PCTW.FSBT.GameState = $PCTW.FSBT.GameState.CountDown PCTW.FSBT.GameState run function fishing_battle:main/game_state/2_countdown
    ## GameState = 2
        execute if score $PCTW.FSBT.System PCTW.FSBT.GameState = $PCTW.FSBT.GameState.Play PCTW.FSBT.GameState run function fishing_battle:main/game_state/3_play
    ## GameState = 3
        execute if score $PCTW.FSBT.System PCTW.FSBT.GameState = $PCTW.FSBT.GameState.End PCTW.FSBT.GameState run function fishing_battle:main/game_state/4_end


#endregion