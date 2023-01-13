#> fishing_battle:main/_main
#
# fishing_battle：初めに読み込むfunction
#
# @within function _core:main/_main



#region 内容


# GameState
    ## GameState = 0
        execute if score PCTW.System PCTW.FSBT.GameState matches 0
    ## GameState = 1
        execute if score PCTW.System PCTW.FSBT.GameState matches 1
    ## GameState = 2
        execute if score PCTW.System PCTW.FSBT.GameState matches 2
    ## GameState = 3
        execute if score PCTW.System PCTW.FSBT.GameState matches 3


#endregion