#> fishing_battle:main/game_state/4_end
#
# fishing_battle：GameState 終了時の処理function
#
# @within function fishing_battle:main/_main

#region 宣言

#> Temp Score Holder
# @private
    #define score_holder PCTW.FSBT.Temp.ResultTimer

#endregion

#region 内容

# 初期化
    ## scoreboard初期化
        execute unless score PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches -2147483648.. run scoreboard players set PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer 0
    
    ## リザルト処理
        ### 
#endregion