#> fishing_battle:main/_reload
#
# fishing_battle：初めに読み込むfunction
#
# @within function fishing_battle:init/install

#region 宣言

#> Score Holder
# @within function fishing_battle:**
    #define score_holder $PCTW.FSBT.System
    #define score_holder $PCTW.FSBT.GameState.Ready
    #define score_holder $PCTW.FSBT.GameState.CountDown
    #define score_holder $PCTW.FSBT.GameState.Play
    #define score_holder $PCTW.FSBT.GameState.End

#> bossbar
# @within function fishing_battle:**
    #define bossbar pctw:fishing_battle/timer

#> Entity Tag
# @within function fishing_battle:**
    #define tag PCTW.FSBT.Player

#endregion



#region 内容

# scoreboard作成
    ## GameState
        scoreboard objectives add PCTW.FSBT.GameState dummy
    ## GameTimer
        ### コアタイマー
            scoreboard objectives add PCTW.FSBT.GameTimer dummy
        ### 時間表記(分)
            scoreboard objectives add PCTW.FSBT.ShowTimer.Minute dummy
        ### 時間表記(秒)
            scoreboard objectives add PCTW.FSBT.ShowTimer.Second dummy
    ## Score
        scoreboard objectives add PCTW.FSBT.Score dummy
    ## Info
        scoreboard objectives add PCTW.FSBT.Info dummy
    ## 釣った回数
        scoreboard objectives add PCTW.FSBT.Fishing.Count dummy

# scoreboard設定
    ## GameState
        execute unless score $PCTW.FSBT.System PCTW.FSBT.GameState matches -2147483648.. run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 0
        scoreboard players set $PCTW.FSBT.GameState.Ready PCTW.FSBT.GameState 0
        scoreboard players set $PCTW.FSBT.GameState.CountDown PCTW.FSBT.GameState 1
        scoreboard players set $PCTW.FSBT.GameState.Play PCTW.FSBT.GameState 2
        scoreboard players set $PCTW.FSBT.GameState.End PCTW.FSBT.GameState 3
        

# team作成
    ## プレイヤーチーム
        team add FSBTPlayerTeamRed
        team add FSBTPlayerTeamBlue
        team add FSBTPlayerTeamYellow
        team add FSBTPlayerTeamGreen

# team設定
    ## FSBTPlayerTeamRed
        team modify FSBTPlayerTeamRed color red
    ## FSBTPlayerTeamBlue
        team modify FSBTPlayerTeamBlue color blue
    ## FSBTPlayerTeamYellow
        team modify FSBTPlayerTeamYellow color yellow
    ## FSBTPlayerTeamGreen
        team modify FSBTPlayerTeamGreen color green


# bossbar作成
    ## Timer
        bossbar add pctw:fishing_battle/timer ""
        
# bossbar設定
    ## timer
        bossbar set pctw:fishing_battle/timer visible true
        bossbar set pctw:fishing_battle/timer players @a
        bossbar set pctw:fishing_battle/timer style notched_10
        bossbar set pctw:fishing_battle/timer color green
        bossbar set pctw:fishing_battle/timer max 1
        bossbar set pctw:fishing_battle/timer value 1
    
#endregion


# debug
    ## 通知
        say fishing_battle:main/_reload Done.