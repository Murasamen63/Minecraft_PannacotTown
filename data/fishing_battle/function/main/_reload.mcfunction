#> fishing_battle:main/_reload
#
# fishing_battle：初めに読み込むfunction
#
# @within function fishing_battle:init/install

#region 宣言

#> Score Holder
# @within function fishing_battle:**
    #define score_holder $PCTW.FSBT.System
    
#> Storage
# @within * fishing_battle:**
    #define storage pctw:fishing_battle/system
    #define storage pctw:fishing_battle/ranking
    #define storage pctw:fishing_battle/shop_price

#> bossbar
# @within function fishing_battle:**
    #define bossbar pctw:fishing_battle/timer

#> Entity Tag
# @within function fishing_battle:**
    #define tag PCTW.FSBT.Player

#endregion



#region 内容

# scoreboard
    ## 作成
        ### GameState
            scoreboard objectives add PCTW.FSBT.GameState dummy
        ### GameTimer
            #### コアタイマー
                scoreboard objectives add PCTW.FSBT.GameTimer dummy
            #### 時間表記(分)
                scoreboard objectives add PCTW.FSBT.ShowTimer.Minute dummy
            #### 時間表記(秒)
                scoreboard objectives add PCTW.FSBT.ShowTimer.Second dummy
        ### Score
            #### 得点
                scoreboard objectives add PCTW.FSBT.Score dummy
            #### チームの合計得点
                scoreboard objectives add PCTW.FSBT.Score.Red dummy
                scoreboard objectives add PCTW.FSBT.Score.Blue dummy
                scoreboard objectives add PCTW.FSBT.Score.Yellow dummy
                scoreboard objectives add PCTW.FSBT.Score.Green dummy
        ### Info
            scoreboard objectives add PCTW.FSBT.Info dummy
    ## 設定
        ### GameState
            scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 0
        ### GameTimer
            scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 0

# team
    ## 作成
        ### プレイヤーチーム
            team add FSBTPlayerTeamRed
            team add FSBTPlayerTeamBlue
            team add FSBTPlayerTeamYellow
            team add FSBTPlayerTeamGreen
    ## 設定
        ### FSBTPlayerTeamRed
            team modify FSBTPlayerTeamRed color red
        ### FSBTPlayerTeamBlue
            team modify FSBTPlayerTeamBlue color blue
        ### FSBTPlayerTeamYellow
            team modify FSBTPlayerTeamYellow color yellow
        ### FSBTPlayerTeamGreen
            team modify FSBTPlayerTeamGreen color green

# storage
    ## 作成
        ### Ranking
            execute unless data storage pctw:fishing_battle/ranking Ranking run data modify storage pctw:fishing_battle/ranking Ranking set value {1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0}}
        ### System
            data modify storage pctw:fishing_battle/system System set value {Timer:0,Team:{Enable:0b,Count:2},Ranking:1b}
        ### Shop_Price
            execute unless data storage pctw:fishing_battle/shop_price Price run data modify storage pctw:fishing_battle/shop_price Price set value {FishingRod:{DoubleRod:15,LureRod:70,RichRod:160,GamblingRod:180,SlotRod:230}}

# bossbar
    ## 作成
        ### Timer
            bossbar add pctw:fishing_battle/timer ""
    ## 設定
        ### timer
            bossbar set pctw:fishing_battle/timer visible true
            bossbar set pctw:fishing_battle/timer players @a
            bossbar set pctw:fishing_battle/timer style notched_10
            bossbar set pctw:fishing_battle/timer color green
            bossbar set pctw:fishing_battle/timer max 1
            bossbar set pctw:fishing_battle/timer value 1

# xpbar
        execute as @a at @s run xp set @s 129 levels
        execute as @a at @s run xp set @s 1000 points
        execute as @a at @s run xp set @s 0 levels

#endregion