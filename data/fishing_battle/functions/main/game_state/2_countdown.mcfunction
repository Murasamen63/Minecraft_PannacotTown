#> fishing_battle:main/game_state/2_countdown
#
# fishing_battle：GameState 開始カウントダウン中の処理function
#
# @within function fishing_battle:main/_main

#region 宣言

#> Temp Score Holder
# @private
    #define score_holder $PTCW.FSBT.Temp.Countdown

#endregion


#region 内容

# 初期値設定
    ## bossbar
        ### 最大値
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run execute store result bossbar pctw:fishing_battle/timer max run data get storage pctw:fishing_battle/system System.Timer
        ### 現在値
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run execute store result bossbar pctw:fishing_battle/timer value run data get storage pctw:fishing_battle/system System.Timer
    ## title
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run title @a times 0 21 0
    ## sidebar
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer as @a at @s run scoreboard objectives setdisplay sidebar
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer as @a at @s run scoreboard players reset @s PCTW.FSBT.Info
    ## xpbar
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer as @a[tag=PCTW.FSBT.Player] at @s run xp set @s 129 levels
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer as @a[tag=PCTW.FSBT.Player] at @s run xp set @s 1000 points
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer as @a[tag=PCTW.FSBT.Player] at @s run xp set @s 0 levels
    ## アイテム
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run clear @a clock{PCTWMasterGUIGameTimerFSBTMinute:1b}
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run clear @a #fishing_battle:hooked_item{FSBTHookedItem:1b}
    ## Team関連
        ### 振り分け
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run function fishing_battle:main/team/selection
        ### tellraw表示
            #### 赤チーム
                execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a[team=FSBTPlayerTeamRed] ["","\n","  あなたは ",{"text":"赤チーム","bold":true,"color":"red"}," です","\n","\n","・チームメンバー","\n",{"text":"  "},{"selector":"@a[team=FSBTPlayerTeamRed]"},"\n"]
            #### 青チーム
                execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a[team=FSBTPlayerTeamBlue] ["","\n","  あなたは ",{"text":"青チーム","bold":true,"color":"blue"}," です","\n","\n","・チームメンバー","\n",{"text":"  "},{"selector":"@a[team=FSBTPlayerTeamBlue]"},"\n"]
            #### 黃チーム
                execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a[team=FSBTPlayerTeamYellow] ["","\n","  あなたは ",{"text":"黃チーム","bold":true,"color":"yellow"}," です","\n","\n","・チームメンバー","\n",{"text":"  "},{"selector":"@a[team=FSBTPlayerTeamYellow]"},"\n"]
            #### 青チーム
                execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a[team=FSBTPlayerTeamGreen] ["","\n","  あなたは ",{"text":"緑チーム","bold":true,"color":"green"}," です","\n","\n","・チームメンバー","\n",{"text":"  "},{"selector":"@a[team=FSBTPlayerTeamGreen]"},"\n"]
        ### 発光
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run effect give @a[tag=PCTW.FSBT.Player] glowing 6 0 true
    ## scoreboard
        ### チームスコア
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.Score.Red 0
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.Score.Blue 0
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.Score.Yellow 0
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.Score.Green 0
        ### GameTimer
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer = $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer run scoreboard players set $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer 120

# カウントダウン処理
    ## 5秒前
        ### 表示
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 100 run title @a title ["","== ",{"text":"5","bold":true}," =="]
    ## 4秒前
        ### 表示
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 80 run title @a title ["","== ",{"text":"4","bold":true}," =="]
    ## 3秒前
        ### 表示
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 60 run title @a title ["","== ",{"text":"3","bold":true,"color":"green"}," =="]
        ### 効果音
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 60 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
    ## 2秒前
        ### 表示
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 40 run title @a title ["","== ",{"text":"2","bold":true,"color":"yellow"}," =="]
        ### 効果音
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 40 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
    ## 1秒前
        ### 表示
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 20 run title @a title ["","== ",{"text":"1","bold":true,"color":"red"}," =="]
        ### 効果音
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 20 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0


# 終了時処理
    ## scoreboard設定
        ### Score
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 run scoreboard players set @a[tag=PCTW.FSBT.Player] PCTW.FSBT.Score 0
    ## 通知
        ### 表示時間変更
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 run title @a times 10 70 20
        ### タイトル表示
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 run title @a title {"text":"Start!!","bold":true,"underlined":true}
        ### tellraw表示
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 run tellraw @a ["","\n","  制限時間は ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"bold":true,"underlined":true,"color":"gold"},{"text":"分間","bold":true,"underlined":true,"color":"gold"}," です","\n"]
        ### 効果音
            execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 as @a at @s run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 0.5
    ## アイテム付与
        execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 as @a[tag=PCTW.FSBT.Player] at @s run function fishing_battle:give/fishing_rod/normal_rod
    ## GameState移行
        execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 2
    ## scoreboard削除
        execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 run scoreboard players reset $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer


# カウントダウン減少
    execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 1.. run scoreboard players remove $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer 1

#endregion