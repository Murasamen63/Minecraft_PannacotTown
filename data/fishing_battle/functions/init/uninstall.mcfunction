#> fishing_battle:init/uninstall
#
# fishing_battle：釣り大会の設定をアンインストールするfunction
#
# @private



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


#endregion


# debug
    ## 通知
        say fishing_battle Uninstalled