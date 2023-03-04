#> fishing_battle:main/team/update_team_score
#
# fishing_battle：チームのスコアを反映させるfunction
#
# @within function fishing_battle:main/game_state/3_play



#region 内容

# 増減した個人のスコアを合計に反映
    ## 赤チーム
        execute if entity @s[team=FSBTPlayerTeamRed] run scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.Score.Red = @s PCTW.FSBT.Score
    ## 青チーム
        execute if entity @s[team=FSBTPlayerTeamBlue] run scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.Score.Blue = @s PCTW.FSBT.Score
    ## 黃チーム
        execute if entity @s[team=FSBTPlayerTeamYellow] run scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.Score.Yellow = @s PCTW.FSBT.Score
    ## 緑チーム
        execute if entity @s[team=FSBTPlayerTeamGreen] run scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.Score.Green = @s PCTW.FSBT.Score

# 合計から全員のスコアに反映
    ## 赤チーム
        execute if entity @s[team=FSBTPlayerTeamRed] run scoreboard players operation @a[team=FSBTPlayerTeamRed] PCTW.FSBT.Score = $PCTW.FSBT.System PCTW.FSBT.Info.ShowRedScore
    ## 青チーム
        execute if entity @s[team=FSBTPlayerTeamBlue] run scoreboard players operation @a[team=FSBTPlayerTeamBlue] PCTW.FSBT.Score = $PCTW.FSBT.System PCTW.FSBT.Score.Blue
    ## 黃チーム
        execute if entity @s[team=FSBTPlayerTeamYellow] run scoreboard players operation @a[team=FSBTPlayerTeamYellow] PCTW.FSBT.Score = $PCTW.FSBT.System PCTW.FSBT.Score.Yellow
    ## 緑チーム
        execute if entity @s[team=FSBTPlayerTeamGreen] run scoreboard players operation @a[team=FSBTPlayerTeamGreen] PCTW.FSBT.Score = $PCTW.FSBT.System PCTW.FSBT.Score.Green

#endregion