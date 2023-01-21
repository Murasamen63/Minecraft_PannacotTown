#> fishing_battle:main/game_state/3_play
#
# fishing_battle：GameState ゲーム中の処理function
#
# @within function fishing_battle:main/_main



#region 内容

# Timer関連
    ## scoreboard計算
        ### 分を計算
            execute store result score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Minute run scoreboard players get $PCTW.FSBT.System PCTW.FSBT.GameTimer
            scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Minute /= #1200 PCTW.Const
        ### 秒を計算
            execute store result score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second run scoreboard players get $PCTW.FSBT.System PCTW.FSBT.GameTimer
            scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second %= #1200 PCTW.Const
            scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second /= #20 PCTW.Const
        ### 時間通知
            #### 10分
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 12000 run tellraw @a ["","\n","残り ",{"text":"10分","bold":true,"underlined":true,"color":"gold"},"\n"]
            #### 5分
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 6000 run tellraw @a ["","\n","残り ",{"text":"5分","bold":true,"underlined":true,"color":"gold"},"\n"]
            #### 3分
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3600 run tellraw @a ["","\n","残り ",{"text":"3分","bold":true,"underlined":true,"color":"gold"},"\n"]
            #### 1分
                ##### tellraw
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1200 run tellraw @a ["","\n","残り ",{"text":"1分","bold":true,"underlined":true,"color":"red"},"\n"]
                ##### 効果音
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1200 as @a at @s run playsound minecraft:entity.player.levelup voice @s ~ ~ ~ 1.0 0.5
            #### 30秒
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 600 run tellraw @a ["","\n","残り ",{"text":"30秒","bold":true,"underlined":true,"color":"red"},"\n"]
            #### 10秒
                ##### tellraw
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 200 run tellraw @a ["","\n","残り ",{"text":"1分","bold":true,"underlined":true,"color":"red"},"\n"]
                ##### 効果音
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 200 as @a at @s run playsound minecraft:entity.player.levelup voice @s ~ ~ ~ 1.0 1.0
            #### 5秒前
                ##### 表示
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 100 run tellraw @s ["","\n",{"text":"5","bold":true,"underlined":true,"color":"red"}]
                ##### 効果音
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 100 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
            #### 4秒前
                ##### 表示
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 80 run tellraw @s ["",{"text":"4","bold":true,"underlined":true,"color":"red"}]
                ##### 効果音
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 80 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
            #### 3秒前
                ##### 表示
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 60 run tellraw @s ["",{"text":"3","bold":true,"underlined":true,"color":"red"}]
                ##### 効果音
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 60 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
            #### 2秒前
                ##### 表示
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 40 run tellraw @s ["",{"text":"2","bold":true,"underlined":true,"color":"red"}]
                ##### 効果音
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 40 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
            #### 1秒前
                ##### 表示
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 20 run tellraw @s ["",{"text":"1","bold":true,"underlined":true,"color":"red"}]
                ##### 効果音
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 20 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
        ### 終了
            #### 通知
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 0 run title @a title {"text":"Finish!!","bold":true,"underlined":true,"color":"gold"}
            #### GameState変更
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 0 run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 3
            #### 通知
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 0 run title

    ## bossbar反映
        ### 現在値
            execute store result bossbar pctw:fishing_battle/timer value run scoreboard players get $PCTW.FSBT.System PCTW.FSBT.GameTimer
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

# タイマー減少
    execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1.. run scoreboard players remove $PCTW.FSBT.System PCTW.FSBT.GameTimer 1

#endregion