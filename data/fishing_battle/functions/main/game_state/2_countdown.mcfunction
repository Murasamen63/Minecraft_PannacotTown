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
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches -2147483648.. run execute store result bossbar pctw:fishing_battle/timer max run data get storage pctw:fishing_battle/system Timer
        ### 現在値
            execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches -2147483648.. run execute store result bossbar pctw:fishing_battle/timer value run data get storage pctw:fishing_battle/system Timer
    ## title
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches -2147483648.. run title @a times 0 21 0
    ## sidebar
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches -2147483648.. as @a at @s run scoreboard objectives setdisplay sidebar
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches -2147483648.. as @a at @s run scoreboard players reset @s PCTW.FSBT.Info
    ## scoreboard
        execute unless score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches -2147483648.. run scoreboard players set $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer 120


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
    ## GameState移行
        execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 2
    ## scoreboard削除
        execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 0 run scoreboard players reset $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer


# カウントダウン減少
    execute if score $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer matches 1.. run scoreboard players remove $PTCW.FSBT.Temp.Countdown PCTW.FSBT.GameTimer 1

#endregion