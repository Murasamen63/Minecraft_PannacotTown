#> fishing_battle:ranking/ranking_order_solo
#
# fishing_battle：順位を決めるfunction
#
# @within
#   function fishing_battle:ranking/ranking_order_solo
#   function fishing_battle:main/game_state/4_end


#region 宣言

#> Temp Score Holder
# @private
    #define score_holder $PCTW.FSBT.Temp.WIP.Comparison.Rank
    #define score_holder $PCTW.FSBT.Temp.largest.Score
    #define score_holder $PCTW.FSBT.Temp.Rank.Num_of_People

#> Tag
# @within
#   function fishing_battle:main/game_state/4_end
#   function fishing_battle:ranking/ranking_order_solo
    #define tag PCTW.FSBT.Temp.Score.1st
    #define tag PCTW.FSBT.Temp.Score.2nd
    #define tag PCTW.FSBT.Temp.Score.3rd

#endregion


#region 内容

# 初期化
    execute unless score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches -2147483648.. run scoreboard players set $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary 1

# 比較
    ## 各自スコアを一時保管
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 1.. run execute as @a[tag=PCTW.FSBT.Player,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd] at @s run scoreboard players operation @s PCTW.Temporary = @s PCTW.FSBT.Score
    ## トップのスコアを保存
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 1.. run scoreboard players operation $PCTW.FSBT.Temp.largest.Score PCTW.FSBT.Score > @a[tag=PCTW.FSBT.Player,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd] PCTW.Temporary
    ## 各自のスコアからトップスコアを減算
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 1.. run scoreboard players operation @a[tag=PCTW.FSBT.Player,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd] PCTW.Temporary -= $PCTW.FSBT.Temp.largest.Score PCTW.FSBT.Score

# 順位付け
    ## 1位
        ### 1位タグ付け
            execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 1 run execute as @a[tag=PCTW.FSBT.Player,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd,scores={PCTW.Temporary=0}] at @s run tag @s add PCTW.FSBT.Temp.Score.1st
    ## 2位
        ### 2位タグ付け
            execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 2 run execute as @a[tag=PCTW.FSBT.Player,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd,scores={PCTW.Temporary=0}] at @s run tag @s add PCTW.FSBT.Temp.Score.2nd
    ## 3位
        ### 3位タグ付け
            execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 3 run execute as @a[tag=PCTW.FSBT.Player,tag=!PCTW.FSBT.Temp.Score.1st,tag=!PCTW.FSBT.Temp.Score.2nd,tag=!PCTW.FSBT.Temp.Score.3rd,scores={PCTW.Temporary=0}] at @s run tag @s add PCTW.FSBT.Temp.Score.3rd

# 再帰処理
    ## 回数を1上げる
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 1..3 run scoreboard players add $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary 1
    ## scoreboard初期化 
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 1..3 run scoreboard players reset $PCTW.FSBT.Temp.largest.Score PCTW.FSBT.Score
    ## 3位まで繰り返す
        execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 1..3 run function fishing_battle:ranking/ranking_order_solo
    ## 終了
        ### スコア削除
            ### 比較スコア
                execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 4 run scoreboard players reset $PCTW.FSBT.Temp.largest.Score PCTW.FSBT.Score
            ### Temporary
                execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 4 run scoreboard players reset @a PCTW.Temporary
            ### 周回数スコア
                execute if score $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary matches 4 run scoreboard players reset $PCTW.FSBT.Temp.WIP.Comparison.Rank PCTW.Temporary

#endregion