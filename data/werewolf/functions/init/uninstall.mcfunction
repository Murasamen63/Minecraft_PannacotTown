#> werewolf:init/uninstall
#
# werewolf：
#
# @within function
#   _core.pctw:main/_reload
#   



#region 内容

# ゲームモード変更
    data modify storage pctw:core GameMode set value null

# scoreboard削除
    scoreboard objectives remove PCTW.WW.GameState
    scoreboard objectives remove PCTW.WW.DayTimer
    scoreboard objectives remove PCTW.WW.NightTimer
    scoreboard objectives remove PCTW.WW.Info

# team削除
    team remove WWPlayerTeamWerewolf

# bossbar削除
    bossbar remove pctw:werewolf/timer

# アイテム削除
    clear @a #fishing_battle:pctw_fsbt_items{PCTWFSBTItems:1b}

#endregion