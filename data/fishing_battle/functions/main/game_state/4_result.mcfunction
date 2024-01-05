#> fishing_battle:main/game_state/4_result
#
# fishing_battle：GameState 終了時の処理function
#
# @within function fishing_battle:main/_main

#region 宣言

#> Temp Score Holder
# @private
    #define score_holder $PCTW.FSBT.Temp.ResultTimer

#endregion

#region 内容

# 初期化
    ## 通知
        execute unless score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer = $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer run tellraw @a ["","\n",{"text":"  "},{"text":"結果発表","bold":true,"underlined":true},"\n"]
    ## info
        execute unless score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer = $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer run scoreboard players reset * PCTW.FSBT.Info
    ## scoreboard初期化
        execute unless score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer = $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer run scoreboard players set $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer 0
    
# リザルト処理
    ## ランキング作成
        ### 比較
            #### 個人戦
                execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 0 run function fishing_battle:ranking/ranking_order_solo
            #### チーム戦
                execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 0 run function fishing_battle:ranking/ranking_order_team
    ## 3位
        ### 順位
            #### 表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 60 run tellraw @a ["","\n",{"text":"  "},{"text":"3位","bold":true,"underlined":true,"color":"dark_red"}]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 60 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
        ### スコア表示
            #### 個人戦
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 120 if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run tellraw @a ["",{"text":"  "},{"score":{"name":"@r[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd]","objective":"PCTW.FSBT.Score"},"bold":true,"color":"dark_red"},{"text":"pt","bold":true,"color":"dark_red"}]
            #### チーム戦
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 120 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a ["",{"text":"  "},{"score":{"name":"@e[type=marker,tag=PCTW.FSBT.Marker.Save_Score,tag=PCTW.FSBT.Temp.Score.3rd,limit=1]","objective":"PCTW.FSBT.Score"},"bold":true,"color":"dark_red"},{"text":"pt","bold":true,"color":"dark_red"}]
        ### プレイヤー表示
            #### 表示
                ##### 個人戦
                    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run tellraw @a ["","\n",{"text":"  "},{"selector":"@a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd]","bold":true},"\n"]
                ##### チーム戦
                    ###### 改行
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a " "
                    ###### 赤チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Red,tag=PCTW.FSBT.Temp.Score.3rd] run tellraw @a ["",{"text":"  "},{"text":"赤チーム","bold":true,"color":"red"}]
                    ###### 青チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Blue,tag=PCTW.FSBT.Temp.Score.3rd] run tellraw @a ["",{"text":"  "},{"text":"青チーム","bold":true,"color":"blue"}]
                    ###### 黃チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Yellow,tag=PCTW.FSBT.Temp.Score.3rd] run tellraw @a ["",{"text":"  "},{"text":"黃チーム","bold":true,"color":"yellow"}]
                    ###### 緑チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Green,tag=PCTW.FSBT.Temp.Score.3rd] run tellraw @a ["",{"text":"  "},{"text":"緑チーム","bold":true,"color":"green"}]
                    ###### 改行
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a " "
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 as @a at @s run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 0.5
    ## 2位
        ### 順位表示
            #### 表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 280 run tellraw @a ["","\n",{"text":"  "},{"text":"2位","bold":true,"underlined":true,"color":"gray"}]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 280 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
        ### スコア表示
            #### 個人戦
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 340 if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run tellraw @a ["",{"text":"  "},{"score":{"name":"@r[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd]","objective":"PCTW.FSBT.Score"},"bold":true,"color":"gray"},{"text":"pt","bold":true,"color":"gray"}]
            #### チーム戦
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 340 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a ["",{"text":"  "},{"score":{"name":"@e[type=marker,tag=PCTW.FSBT.Marker.Save_Score,tag=PCTW.FSBT.Temp.Score.2nd,limit=1]","objective":"PCTW.FSBT.Score"},"bold":true,"color":"gray"},{"text":"pt","bold":true,"color":"gray"}]
        ### プレイヤー表示
            #### 表示
                ##### 個人戦
                    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run tellraw @a ["","\n",{"text":"  "},{"selector":"@a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd]","bold":true},"\n"]
                ##### チーム戦
                    ###### 改行
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a " "
                    ###### 赤チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Red,tag=PCTW.FSBT.Temp.Score.2nd] run tellraw @a ["",{"text":"  "},{"text":"赤チーム","bold":true,"color":"red"}]
                    ###### 青チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Blue,tag=PCTW.FSBT.Temp.Score.2nd] run tellraw @a ["",{"text":"  "},{"text":"青チーム","bold":true,"color":"blue"}]
                    ###### 黃チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Yellow,tag=PCTW.FSBT.Temp.Score.2nd] run tellraw @a ["",{"text":"  "},{"text":"黃チーム","bold":true,"color":"yellow"}]
                    ###### 緑チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Green,tag=PCTW.FSBT.Temp.Score.2nd] run tellraw @a ["",{"text":"  "},{"text":"緑チーム","bold":true,"color":"green"}]
                    ###### 改行
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a " "
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 as @a at @s run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 0.5
    ## 1位
        ### 順位
            #### 表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 500 run tellraw @a ["","\n",{"text":"  "},{"text":"1位","bold":true,"underlined":true,"color":"gold"}]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 500 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
        ### スコア表示
            #### 個人戦
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 560 if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run tellraw @a ["",{"text":"  "},{"score":{"name":"@r[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st]","objective":"PCTW.FSBT.Score"},"bold":true,"color":"gold"},{"text":"pt","bold":true,"color":"gold"}]
            #### チーム戦
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 560 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run tellraw @a ["",{"text":"  "},{"score":{"name":"@e[type=marker,tag=PCTW.FSBT.Marker.Save_Score,tag=PCTW.FSBT.Temp.Score.1st,limit=1]","objective":"PCTW.FSBT.Score"},"bold":true,"color":"gold"},{"text":"pt","bold":true,"color":"gold"}]
        ### プレイヤー表示
            #### 発行
                ##### 個人戦
                    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run execute as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s run effect give @s glowing 10 0 true
                ##### チーム戦
                    ###### 赤チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Red,tag=PCTW.FSBT.Temp.Score.1st] run execute as @a[team=FSBTPlayerTeamRed] at @s run effect give @s glowing 10 0 true
                    ###### 青チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Blue,tag=PCTW.FSBT.Temp.Score.1st] run execute as @a[team=FSBTPlayerTeamBlue] at @s run effect give @s glowing 10 0 true
                    ###### 黃チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Yellow,tag=PCTW.FSBT.Temp.Score.1st] run execute as @a[team=FSBTPlayerTeamYellow] at @s run effect give @s glowing 10 0 true
                    ###### 緑チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Green,tag=PCTW.FSBT.Temp.Score.1st] run execute as @a[team=FSBTPlayerTeamGreen] at @s run effect give @s glowing 10 0 true
            #### 時間設定
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run title @a reset
            #### title表示
                ##### 個人戦
                    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run title @a title {"selector":"@a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st]","bold":true}
                ##### チーム戦
                    ###### 赤チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Red,tag=PCTW.FSBT.Temp.Score.1st] run title @a title {"text":"赤チーム","bold":true,"color":"red"}
                    ###### 青チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Blue,tag=PCTW.FSBT.Temp.Score.1st] run title @a title {"text":"青チーム","bold":true,"color":"blue"}
                    ###### 黃チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Yellow,tag=PCTW.FSBT.Temp.Score.1st] run title @a title {"text":"黃チーム","bold":true,"color":"yellow"}
                    ###### 緑チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Green,tag=PCTW.FSBT.Temp.Score.1st] run title @a title {"text":"緑チーム","bold":true,"color":"green"}
            #### subtitle表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run title @a subtitle {"text":"---Winner!!---","bold":true,"color":"gold"}
            #### 表示
                ##### 個人戦
                    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run tellraw @a ["","\n",{"text":"  "},{"selector":"@a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st]","bold":true},"\n"]
                ##### チーム戦
                    ###### 赤チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Red,tag=PCTW.FSBT.Temp.Score.1st] run tellraw @a ["","\n",{"text":"  "},{"selector":"@a[team=FSBTPlayerTeamRed]","bold":true},"\n"]
                    ###### 青チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Blue,tag=PCTW.FSBT.Temp.Score.1st] run tellraw @a ["","\n",{"text":"  "},{"selector":"@a[team=FSBTPlayerTeamBlue]","bold":true},"\n"]
                    ###### 黃チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Yellow,tag=PCTW.FSBT.Temp.Score.1st] run tellraw @a ["","\n",{"text":"  "},{"selector":"@a[team=FSBTPlayerTeamYellow]","bold":true},"\n"]
                    ###### 緑チーム
                        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if entity @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score.Green,tag=PCTW.FSBT.Temp.Score.1st] run tellraw @a ["","\n",{"text":"  "},{"selector":"@a[team=FSBTPlayerTeamGreen]","bold":true},"\n"]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a at @s run playsound ui.toast.challenge_complete voice @s ~ ~ ~ 1.0 1.0

# 終了処理
    ## ランク戦時、歴代ランキングと比較
        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Ranking:1b} run function fishing_battle:ranking/compare_generation_ranking
    ## チーム戦のmarkerを削除
        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run kill @e[type=marker,tag=PCTW.FSBT.Marker.Save_Score]
    ## 情報表示
        ### スコア代入
            #### 個人戦
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a[tag=PCTW.FSBT.Player] at @s if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run scoreboard players operation @s PCTW.FSBT.Info = @s PCTW.FSBT.Score
            #### チーム戦
                ##### 赤チーム
                    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a[tag=PCTW.FSBT.Player] at @s if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run scoreboard players operation 赤チーム PCTW.FSBT.Info = $PCTW.FSBT.System PCTW.FSBT.Score.Red
                ##### 青チーム
                    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a[tag=PCTW.FSBT.Player] at @s if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run scoreboard players operation 青チーム PCTW.FSBT.Info = $PCTW.FSBT.System PCTW.FSBT.Score.Blue
                ##### 黃チーム
                    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a[tag=PCTW.FSBT.Player] at @s if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run scoreboard players operation 黃チーム PCTW.FSBT.Info = $PCTW.FSBT.System PCTW.FSBT.Score.Yellow
                ##### 緑チーム
                    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a[tag=PCTW.FSBT.Player] at @s if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run scoreboard players operation 緑チーム PCTW.FSBT.Info = $PCTW.FSBT.System PCTW.FSBT.Score.Green
        ### 名称変更
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run scoreboard objectives modify PCTW.FSBT.Info displayname "スコア"
        ### sidebar設定
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run scoreboard objectives setdisplay sidebar PCTW.FSBT.Info
    ## scoreboard初期化
        ### Score
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a at @s run scoreboard players reset @s PCTW.FSBT.Score
        ### GameTimer
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a at @s run execute store result score $PCTW.FSBT.System PCTW.FSBT.GameTimer run data get storage pctw:fishing_battle/system System.Timer
    ## tag削除
        ### 順位タグ
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @e at @s run tag @s remove PCTW.FSBT.Temp.Score.1st
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @e at @s run tag @s remove PCTW.FSBT.Temp.Score.2nd
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @e at @s run tag @s remove PCTW.FSBT.Temp.Score.3rd
    ## GameState変更
        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 0
    ### ResultTimer削除
        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run scoreboard players reset $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer

# リザルトタイマー増加
    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches ..619 run scoreboard players add $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer 1

#endregion