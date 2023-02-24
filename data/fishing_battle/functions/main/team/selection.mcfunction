#> fishing_battle:main/team/selection
#
# fishing_battle：チーム分けを行うfunction
#
# @within function
#   fishing_battle:main/team/selection
#   fishing_battle:main/game_state/2_countdown

#region 宣言

#> Temp Score Holder
# @private
    #define score_holder $PCTW.FSBT.Temp.Num_of_Team

#endregion



#region 内容

# チーム数入力
    execute unless score $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp = $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp store result score $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp run data get storage pctw:fishing_battle/system System.Team.Count 1

# チーム加入
    ## 赤チーム
        execute if score $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp matches 2..4 run team join FSBTPlayerTeamRed @r[tag=PCTW.FSBT.Player,team=]
    ## 青チーム
        execute if score $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp matches 2..4 run team join FSBTPlayerTeamBlue @r[tag=PCTW.FSBT.Player,team=]
    ## 黃チーム
        execute if score $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp matches 3..4 run team join FSBTPlayerTeamYellow @r[tag=PCTW.FSBT.Player,team=]
    ## 緑チーム
        execute if score $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp matches 4 run team join FSBTPlayerTeamGreen @r[tag=PCTW.FSBT.Player,team=]

# 再帰処理
    ## 条件達成で再帰
        execute if entity @a[tag=PCTW.FSBT.Player,team=] unless score $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp matches 0 run function fishing_battle:main/team/selection
    ## 条件未達成で終了
        execute unless entity @a[tag=PCTW.FSBT.Player,team=] run scoreboard players reset $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp
        execute if score $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp matches 0 run scoreboard players reset $PCTW.FSBT.Temp.Num_of_Team PCTW.Core.Temp

#endregion