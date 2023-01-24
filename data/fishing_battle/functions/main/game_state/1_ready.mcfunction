#> fishing_battle:main/game_state/1_ready
#
# fishing_battle：GameState 開始前の処理function
#
# @within function fishing_battle:main/_main



#region 内容

# Playerタグ管理
    ## advantureにタグ付与
        execute as @a[gamemode=adventure] at @s run tag @s add PCTW.FSBT.Player
    ## それ以外にタグ剥奪
        execute as @a[gamemode=!adventure] at @s run tag @s remove PCTW.FSBT.Player

# Timer
    ## アイテムからTimerに反映
        #execute store result score $PCTW.FSBT.System PCTW.FSBT.GameTimer run clear @a clock{FSBTSettingTimeLimitClock:1b} 0
        #scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.GameTimer *= #1200 PCTW.Const
        execute store result storage pctw:fishing_battle/system Timer int 1 run scoreboard players get $PCTW.FSBT.System PCTW.FSBT.GameTimer
    ## 分を計算
        execute store result score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Minute run data get storage pctw:fishing_battle/system Timer
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Minute /= #1200 PCTW.Const
    ## 秒を計算
        execute store result score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second run data get storage pctw:fishing_battle/system Timer
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second %= #1200 PCTW.Const
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second /= #20 PCTW.Const

# 情報表示
    ## bossbar反映
        ### 名称
            #### 3分以上
                ##### 秒数が10以上(2桁)
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                ##### 秒数が9以下(1桁)
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"text":"0","color":"green"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
            #### 1分～3分
                ##### 秒数が10以上(2桁)
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                ##### 秒数が9以下(1桁)
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"text":"0","color":"yellow"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
            #### 1分以下
                ##### 秒数が10以上(2桁)
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
                ##### 秒数が9以下(1桁)
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"text":"0","color":"red"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
        ### 色
            #### 3分以上
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run bossbar set pctw:fishing_battle/timer color green
            #### 1分～3分
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run bossbar set pctw:fishing_battle/timer color yellow
            #### 1分以下
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run bossbar set pctw:fishing_battle/timer color red
    ## actionbar反映
        execute as @a at @s run title @a actionbar ["",{"text":"1位","bold":true,"underlined":true,"color":"gold"},"  ",{"nbt":"Ranking.AllTime.1.Name","storage":"pctw:fishing_battle/ranking"}," ",{"nbt":"Ranking.AllTime.1.Score","storage":"pctw:fishing_battle/ranking","bold":true},{"text":"pt","bold":true},"    ",{"text":"2位","bold":true,"underlined":true,"color":"gray"},"  ",{"nbt":"Ranking.AllTime.2.Name","storage":"pctw:fishing_battle/ranking"}," ",{"nbt":"Ranking.AllTime.2.Score","storage":"pctw:fishing_battle/ranking","bold":true},{"text":"pt","bold":true},"    ",{"text":"3位","bold":true,"underlined":true,"color":"dark_red"},"  ",{"nbt":"Ranking.AllTime.3.Name","storage":"pctw:fishing_battle/ranking"}," ",{"nbt":"Ranking.AllTime.3.Score","storage":"pctw:fishing_battle/ranking","bold":true},{"text":"pt","bold":true}]

#endregion