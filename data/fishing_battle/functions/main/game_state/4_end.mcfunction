#> fishing_battle:main/game_state/4_end
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
    ## 釣竿の削除
        execute unless score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches -2147483648.. run clear @a fishing_rod{FSBTFishingRod:1b}
    ## scoreboard初期化
        execute unless score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches -2147483648.. run scoreboard players set $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer 0
    
# リザルト処理
    ## ランキング作成
        ### 比較
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 0 run function fishing_battle:ranking/ranking_order_solo
    ## 3位
        ### 順位
            #### 表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 60 run tellraw @a ["","\n",{"text":"3位","bold":true,"underlined":true,"color":"dark_red"}]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 60 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
        ### スコア表示
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 120 run tellraw @a ["",{"score":{"name":"@r[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd]","objective":"PCTW.FSBT.Score"},"bold":true,"color":"dark_red"},{"text":"pt","bold":true,"color":"dark_red"}]
        ### プレイヤー表示
            #### 表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 run tellraw @a ["","\n",{"selector":"@a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd]","bold":true},"\n"]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 180 as @a at @s run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 0.5
    ## 2位
        ### 順位表示
            #### 表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 280 run tellraw @a ["","\n",{"text":"2位","bold":true,"underlined":true,"color":"gray"}]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 280 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
        ### スコア表示
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 340 run tellraw @a ["",{"score":{"name":"@r[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd]","objective":"PCTW.FSBT.Score"},"bold":true,"color":"gray"},{"text":"pt","bold":true,"color":"gray"}]
        ### プレイヤー表示
            #### 表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 run tellraw @a ["","\n",{"selector":"@a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd]","bold":true},"\n"]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 400 as @a at @s run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 0.5
    ## 1位
        ### 順位
            #### 表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 500 run tellraw @a ["","\n",{"text":"1位","bold":true,"underlined":true,"color":"gold"}]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 500 as @a at @s run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 1.0
        ### スコア表示
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 560 run tellraw @a ["",{"score":{"name":"@r[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st]","objective":"PCTW.FSBT.Score"},"bold":true,"color":"gold"},{"text":"pt","bold":true,"color":"gold"}]
        ### プレイヤー表示
            #### 時間設定
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run title @a reset
            #### title表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run title @a title {"selector":"@a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st]","bold":true}
            #### subtitle表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run title @a subtitle {"text":"---Winner!!---","bold":true,"color":"gold"}
            #### 表示
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run tellraw @a ["","\n",{"selector":"@a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st]","bold":true},"\n"]
            #### 効果音
                execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a at @s run playsound ui.toast.challenge_complete voice @s ~ ~ ~ 1.0 1.0

# 終了処理
    ## 情報表示
        ### スコア代入
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a[tag=PCTW.FSBT.Player] at @s run scoreboard players operation @s PCTW.FSBT.Info = @s PCTW.FSBT.Score
        ### 名称変更
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run scoreboard objectives modify PCTW.FSBT.Info displayname "スコア"
        ### sidebar設定
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run scoreboard objectives setdisplay sidebar PCTW.FSBT.Info
    ## scoreboard初期化
        ### Score
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a at @s run scoreboard players reset @s PCTW.FSBT.Score
        ### GameTimer
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a at @s run execute store result score $PCTW.FSBT.System PCTW.FSBT.GameTimer run data get storage pctw:fishing_battle/system Timer
    ## tag削除
        ### 順位タグ
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a at @s run tag @s remove PCTW.FSBT.Temp.Score.1st
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a at @s run tag @s remove PCTW.FSBT.Temp.Score.2nd
            execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 as @a at @s run tag @s remove PCTW.FSBT.Temp.Score.3rd
    ## GameState変更
        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 0
    ### ResultTimer削除
        execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches 620 run scoreboard players reset $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer

# リザルトタイマー増加
    execute if score $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer matches ..619 run scoreboard players add $PCTW.FSBT.Temp.ResultTimer PCTW.FSBT.GameTimer 1

#endregion