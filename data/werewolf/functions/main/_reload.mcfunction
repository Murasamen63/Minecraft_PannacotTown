#> werewolf:main/_reload
#
# werewolf：
#
# @within function werewolf:init/install

#region 宣言

#> Score Holder
# @within function werewolf:**
    #define score_holder $PCTW.WW.System
    
#> Storage
# @within * werewolf:**
    #define storage pctw:werewolf/system
    #define storage pctw:werewolf/shop_price

#> bossbar
# @within function werewolf:**
    #define bossbar pctw:werewolf/timer

#> Entity Tag
# @within function werewolf:**
    #define tag PCTW.WW.Player

#endregion


#region 内容

# scoreboard
    ## 作成
        ### GameState
            scoreboard objectives add PCTW.WW.GameState dummy
        ### GameTimer
            #### 昼タイマー
                scoreboard objectives add PCTW.WW.DayTimer dummy
            #### 夜タイマー
                scoreboard objectives add PCTW.WW.NightTimer dummy
        ### Info
            scoreboard objectives add PCTW.WW.Info dummy
    ## 設定
        ### GameState
            scoreboard players set $PCTW.WW.System PCTW.WW.GameState 0
        ### DayTimer
            scoreboard players set $PCTW.WW.System PCTW.WW.DayTimer 0
        ### NightTimer
            scoreboard players set $PCTW.WW.System PCTW.WW.NightTimer 0

# team
    ## 作成
        ### プレイヤーチーム
            team add WWPlayerTeamWerewolf

# storage
    ## 作成
        ### System
            execute unless data storage pctw:werewolf/system System run data modify storage pctw:werewolf/system System set value {Timer:{Day:0,Night:0}}
        ### shop_price
            execute unless data storage pctw:werewolf/system Price run data modify storage pctw:werewolf/shop_price Price set value {}

# bossbar
    ## 作成
        ### Timer
            bossbar add pctw:werewolf/timer ""
    ## 設定
        ### timer
            bossbar set pctw:werewolf/timer visible true
            bossbar set pctw:werewolf/timer players @a
            bossbar set pctw:werewolf/timer style notched_10
            bossbar set pctw:werewolf/timer color green
            bossbar set pctw:werewolf/timer max 1
            bossbar set pctw:werewolf/timer value 1

# xpbar
        execute as @a at @s run xp set @s 129 levels
        execute as @a at @s run xp set @s 1000 points
        execute as @a at @s run xp set @s 0 levels
    
#endregion