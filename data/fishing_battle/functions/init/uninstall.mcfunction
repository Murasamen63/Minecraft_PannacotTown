#> fishing_battle:init/uninstall
#
# fishing_battle：釣り大会の設定をアンインストールするfunction
#
# @within function
#   _core.pctw:main/_reload
#   _core.pctw:pctw_master_gui/gui/switch_function/select_gamemode/back_to_select_gamemode



#region 内容

# ゲームモード変更
    data modify storage pctw:core GameMode set value null

# scoreboard削除
    scoreboard objectives remove PCTW.FSBT.GameState
    scoreboard objectives remove PCTW.FSBT.GameTimer
    scoreboard objectives remove PCTW.FSBT.Fishing.Count
    scoreboard objectives remove PCTW.FSBT.Info
    scoreboard objectives remove PCTW.FSBT.Score
    scoreboard objectives remove PCTW.FSBT.ShowTimer.Minute
    scoreboard objectives remove PCTW.FSBT.ShowTimer.Second
    scoreboard objectives remove PCTW.FSBT.Score.Red
    scoreboard objectives remove PCTW.FSBT.Score.Blue
    scoreboard objectives remove PCTW.FSBT.Score.Yellow
    scoreboard objectives remove PCTW.FSBT.Score.Green

# team削除
    team remove FSBTPlayerTeamRed
    team remove FSBTPlayerTeamBlue
    team remove FSBTPlayerTeamYellow
    team remove FSBTPlayerTeamGreen

# bossbar削除
    bossbar remove pctw:fishing_battle/timer

# アイテム削除
    clear @a #fishing_battle:pctw_fsbt_items{PCTWFSBTItems:1b}

#endregion