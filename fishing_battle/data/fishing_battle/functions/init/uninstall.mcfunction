#> fishing_battle:init/uninstall
#
# fishing_battle：釣り大会の設定をアンインストールするfunction
#
# @within function _core:main/_reload



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

# bossbar削除
    bossbar remove pctw:fishing_battle/timer

# アイテム削除
    clear @a #fishing_battle:pctw_fsbt_items{PCTWFSBTItems:1b}


#endregion


# debug
    ## 通知
        say fishing_battle Uninstalled