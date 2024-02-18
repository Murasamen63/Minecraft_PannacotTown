#> fishing_battle:main/game_state/1_ready
#
# fishing_battle：GameState 開始前の処理function
#
# @within function fishing_battle:main/_main



#region 内容

# gamemode設定
    ## サバイバルをアドベンチャーに変更
        execute as @a[gamemode=survival] run tellraw @s {"text":" ※サバイバルモードを選択した為、自動的にアドベンチャーモードに変更しました。","color":"yellow"}
        execute as @a[gamemode=survival] run gamemode adventure @s

# Playerタグ管理
    ## advantureにタグ付与
        execute as @a[gamemode=adventure] at @s run tag @s add PCTW.FSBT.Player
    ## それ以外にタグ剥奪
        execute as @a[gamemode=!adventure] at @s run tag @s remove PCTW.FSBT.Player

# Map
    ## ショップ看板
        ### ダブル釣竿
            data merge block 5 0 22 {front_text:{messages:["[\"\"]","{\"text\":\"ダブル釣竿\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/double_rod\"}}","[\"\",{\"nbt\":\"Price.FishingRod.DoubleRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]","\"\""]},GlowingText:1b}
        ### リッチ釣竿
            data merge block 8 0 17 {front_text:{messages:["[\"\"]","{\"text\":\"リッチ釣竿\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/rich_rod\"}}","[\"\",{\"nbt\":\"Price.FishingRod.RichRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]","\"\""]},GlowingText:1b}
        ### 入れ食い釣竿
            data merge block 5 0 19 {front_text:{messages:["[\"\"]","{\"text\":\"入れ食い釣竿\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/lure_rod\"}}","[\"\",{\"nbt\":\"Price.FishingRod.LureRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]","\"\""]},GlowingText:1b}
        ### 博打釣竿
            data merge block 10 0 17 {front_text:{messages:["[\"\"]","{\"text\":\"博打釣竿\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/gambling_rod\"}}","[\"\",{\"nbt\":\"Price.FishingRod.GamblingRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]","\"\""]},GlowingText:1b}
        ### おじガチャ釣竿
            data merge block 12 0 19 {front_text:{messages:["[\"\"]","{\"text\":\"おじガチャ釣竿\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/slot_rod\"}}","[\"\",{\"nbt\":\"Price.FishingRod.SlotRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]","\"\""]},GlowingText:1b}


# Timer
    ## アイテムからTimerに反映
        #execute store result score $PCTW.FSBT.System PCTW.FSBT.GameTimer run clear @a clock{PCTWMasterGUIGameTimerFSBTMinute:1b} 0
        #scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.GameTimer *= #1200 PCTW.Core.Const
        execute store result storage pctw:fishing_battle/system System.Timer int 1 run scoreboard players get $PCTW.FSBT.System PCTW.FSBT.GameTimer
    ## 分を計算
        execute store result score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Minute run data get storage pctw:fishing_battle/system System.Timer
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Minute /= #1200 PCTW.Core.Const
    ## 秒を計算
        execute store result score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second run data get storage pctw:fishing_battle/system System.Timer
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second %= #1200 PCTW.Core.Const
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second /= #20 PCTW.Core.Const

# storage
    ## Ranking
        execute unless data storage pctw:fishing_battle/system System{Timer:6000,Team:{Enable:0b},Ranking:1b} run data modify storage pctw:fishing_battle/system System.Ranking set value 0b
        execute unless data storage pctw:fishing_battle/shop_price Price{FishingRod:{DoubleRod:15,LureRod:70,RichRod:160,GamblingRod:180,SlotRod:230}} run data modify storage pctw:fishing_battle/system System.Ranking set value 0b

# 情報表示
    ## bossbar反映
        ### 数値初期化
            bossbar set pctw:fishing_battle/timer max 1
            bossbar set pctw:fishing_battle/timer value 1
        ### 名称
            #### 個人戦
                ##### 3分以上
                    ###### 秒数が10以上(2桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b},Ranking:0b} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                    ###### 秒数が9以下(1桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b},Ranking:0b} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"text":"0","color":"green"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                ##### 1分～3分
                    ###### 秒数が10以上(2桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b},Ranking:0b} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                    ###### 秒数が9以下(1桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b},Ranking:0b} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"text":"0","color":"yellow"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                ##### 1分以下
                    ###### 秒数が10以上(2桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b},Ranking:0b} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
                    ###### 秒数が9以下(1桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b},Ranking:0b} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"text":"0","color":"red"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
            #### チーム戦
                ##### 2チーム
                    ###### 3分以上
                        ####### 秒数が10以上(2桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:2}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"2Team  ","color":"blue","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                        ####### 秒数が9以下(1桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:2}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"2Team  ","color":"blue","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"text":"0","color":"green"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                    ###### 1分～3分
                        ####### 秒数が10以上(2桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:2}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"2Team  ","color":"blue","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                        ####### 秒数が9以下(1桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:2}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"2Team  ","color":"blue","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"text":"0","color":"yellow"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                    ###### 1分以下
                        ####### 秒数が10以上(2桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:2}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"2Team  ","color":"blue","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
                        ####### 秒数が9以下(1桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:2}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"2Team  ","color":"blue","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"text":"0","color":"red"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
                ##### 3チーム
                    ###### 3分以上
                        ####### 秒数が10以上(2桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:3}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"3Team  ","color":"yellow","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                        ####### 秒数が9以下(1桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:3}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"3Team  ","color":"yellow","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"text":"0","color":"green"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                    ###### 1分～3分
                        ####### 秒数が10以上(2桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:3}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"3Team  ","color":"yellow","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                        ####### 秒数が9以下(1桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:3}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"3Team  ","color":"yellow","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"text":"0","color":"yellow"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                    ###### 1分以下
                        ####### 秒数が10以上(2桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:3}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"3Team  ","color":"yellow","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
                        ####### 秒数が9以下(1桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:3}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"3Team  ","color":"yellow","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"text":"0","color":"red"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
                ##### 4チーム
                    ###### 3分以上
                        ####### 秒数が10以上(2桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:4}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"4Team  ","color":"green","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                        ####### 秒数が9以下(1桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:4}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"4Team  ","color":"green","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"text":"0","color":"green"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                    ###### 1分～3分
                        ####### 秒数が10以上(2桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:4}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"4Team  ","color":"green","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                        ####### 秒数が9以下(1桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:4}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"4Team  ","color":"green","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"text":"0","color":"yellow"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                    ###### 1分以下
                        ####### 秒数が10以上(2桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:4}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"4Team  ","color":"green","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
                        ####### 秒数が9以下(1桁)
                            execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b,Count:4}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"text":"4Team  ","color":"green","bold": true},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"text":"0","color":"red"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
            #### ランク戦
                execute if data storage pctw:fishing_battle/system System{Ranking:1b} run bossbar set pctw:fishing_battle/timer name ["","ランク戦  ",{"text":"5","color":"green"}," : ",{"text":"00","color":"green"}]
        ### 色
            #### 3分以上
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run bossbar set pctw:fishing_battle/timer color green
            #### 1分～3分
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run bossbar set pctw:fishing_battle/timer color yellow
            #### 1分以下
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run bossbar set pctw:fishing_battle/timer color red

# 進捗
    advancement grant @a only fishing_battle:display/1 

#endregion