#> fishing_battle:ranking/compare_generation_ranking
#
# fishing_battle：今回のゲームのスコアと歴代ランキングと比較するfunction
#
# @within
#   function fishing_battle:ranking/compare_generation_ranking
#   function fishing_battle:main/game_state/4_result

#region 宣言

#> Temp Score Holder
# @private
    #define score_holder $PCTW.FSBT.Temp.Compare.Count
    #define score_holder $PCTW.FSBT.Temp.GenRank.1st
    #define score_holder $PCTW.FSBT.Temp.GenRank.2nd
    #define score_holder $PCTW.FSBT.Temp.GenRank.3rd

#> Temp Storage
# @private
    #define storage pctw:temp/save

#endregion



#region 内容
    
# 初期化
    ## Storage
        execute unless score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp = $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp run data modify storage pctw:temp/save Save set value {Name:[null],Score:0}
    ## player_head
        ### 1st
            execute unless score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp = $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s run item replace entity @s enderchest.0 with player_head 1
            execute unless score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp = $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s run item modify entity @s enderchest.0 fishing_battle:fill_player_head
        ### 2nd
            execute unless score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp = $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s run item replace entity @s enderchest.0 with player_head 1
            execute unless score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp = $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s run item modify entity @s enderchest.0 fishing_battle:fill_player_head
        ### 3rd
            execute unless score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp = $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s run item replace entity @s enderchest.0 with player_head 1
            execute unless score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp = $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s run item modify entity @s enderchest.0 fishing_battle:fill_player_head
    ## scoreboard
        execute unless score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp = $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp run scoreboard players set $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp 1

# 比較
    ## 現ランキングを保存
        execute store result score $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data get storage pctw:fishing_battle/ranking Ranking.1.Score
        execute store result score $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data get storage pctw:fishing_battle/ranking Ranking.2.Score
        execute store result score $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run data get storage pctw:fishing_battle/ranking Ranking.3.Score
    ## 1st
        ### 第三位
            #### Name
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Name set value []
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Name append from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
            #### Score
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run execute store result storage pctw:fishing_battle/ranking Ranking.3.Score int 1 run scoreboard players get @s PCTW.FSBT.Score
        ### 第二位
            #### Name
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Name set from storage pctw:fishing_battle/ranking Ranking.2.Name
                ##### 初期化
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Name set value []
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Name append from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Name set from storage pctw:temp/save Save.Name
            #### Score
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Score set from storage pctw:fishing_battle/ranking Ranking.2.Score
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score store result storage pctw:fishing_battle/ranking Ranking.2.Score int 1 run scoreboard players get @s PCTW.FSBT.Score
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Score set from storage pctw:temp/save Save.Score
        ### 第一位
            #### Name
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Name set from storage pctw:fishing_battle/ranking Ranking.1.Name
                ##### 初期化
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.1.Name set value []
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.1.Name append from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Name set from storage pctw:temp/save Save.Name
            #### Score
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Score set from storage pctw:fishing_battle/ranking Ranking.1.Score
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score store result storage pctw:fishing_battle/ranking Ranking.1.Score int 1 run scoreboard players get @s PCTW.FSBT.Score
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Score set from storage pctw:temp/save Save.Score
    ## 2nd
        ### 第三位
            #### Name
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Name set value []
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Name append from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
            #### Score
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run execute store result storage pctw:fishing_battle/ranking Ranking.3.Score int 1 run scoreboard players get @s PCTW.FSBT.Score
        ### 第二位
            #### Name
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Name set from storage pctw:fishing_battle/ranking Ranking.2.Name
                ##### 初期化
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Name set value []
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Name append from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Name set from storage pctw:temp/save Save.Name
            #### Score
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Score set from storage pctw:fishing_battle/ranking Ranking.2.Score
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score store result storage pctw:fishing_battle/ranking Ranking.2.Score int 1 run scoreboard players get @s PCTW.FSBT.Score
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Score set from storage pctw:temp/save Save.Score
        ### 第一位
            #### Name
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Name set from storage pctw:fishing_battle/ranking Ranking.1.Name
                ##### 初期化
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.1.Name set value []
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.1.Name append from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Name set from storage pctw:temp/save Save.Name
            #### Score
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Score set from storage pctw:fishing_battle/ranking Ranking.1.Score
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score store result storage pctw:fishing_battle/ranking Ranking.1.Score int 1 run scoreboard players get @s PCTW.FSBT.Score
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 2 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Score set from storage pctw:temp/save Save.Score
    ## 3rd
        ### 第三位
            #### Name
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Name set value []
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Name append from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
            #### Score
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score run execute store result storage pctw:fishing_battle/ranking Ranking.3.Score int 1 run scoreboard players get @s PCTW.FSBT.Score
        ### 第二位
            #### Name
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Name set from storage pctw:fishing_battle/ranking Ranking.2.Name
                ##### 初期化
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Name set value []
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Name append from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Name set from storage pctw:temp/save Save.Name
            #### Score
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Score set from storage pctw:fishing_battle/ranking Ranking.2.Score
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score store result storage pctw:fishing_battle/ranking Ranking.2.Score int 1 run scoreboard players get @s PCTW.FSBT.Score
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.3.Score set from storage pctw:temp/save Save.Score
        ### 第一位
            #### Name
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Name set from storage pctw:fishing_battle/ranking Ranking.1.Name
                ##### 初期化
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.1.Name set value []
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.1.Name append from entity @s EnderItems[{Slot:0b}].tag.SkullOwner.Name
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Name set from storage pctw:temp/save Save.Name
            #### Score
                ##### 一次保存
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:temp/save Save.Score set from storage pctw:fishing_battle/ranking Ranking.1.Score
                ##### 置き換え
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score store result storage pctw:fishing_battle/ranking Ranking.1.Score int 1 run scoreboard players get @s PCTW.FSBT.Score
                ##### 一次保存を添付
                    execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 3 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s if score @s PCTW.FSBT.Score > $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score run data modify storage pctw:fishing_battle/ranking Ranking.2.Score set from storage pctw:temp/save Save.Score

# 再帰処理
    ## 3回まで繰り返す
        execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1.. run scoreboard players add $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp 1
        execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 1..3 run function fishing_battle:ranking/compare_generation_ranking
    ## 終了処理
        ### ランキング反映
            #### 1位
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 run data merge block 1 2 28 {front_text:{messages:["{\"text\":\"1位\",\"bold\":true,\"underlined\":true,\"color\":\"gold\"}","[\"\"]","{\"nbt\":\"Ranking.1.Name\",\"storage\":\"pctw:fishing_battle/ranking\"}","[\"\",{\"nbt\":\"Ranking.1.Score\",\"storage\":\"pctw:fishing_battle/ranking\",\"bold\":true},{\"text\":\"pt\",\"bold\":true}]"]},GlowingText:1b}
            #### 2位
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 run data merge block 1 2 28 {front_text:{messages:["{\"text\":\"2位\",\"bold\":true,\"underlined\":true,\"color\":\"gray\"}","[\"\"]","{\"nbt\":\"Ranking.2.Name\",\"storage\":\"pctw:fishing_battle/ranking\"}","[\"\",{\"nbt\":\"Ranking.2.Score\",\"storage\":\"pctw:fishing_battle/ranking\",\"bold\":true},{\"text\":\"pt\",\"bold\":true}]"]},GlowingText:1b}
            #### 3位
                execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 run data merge block 3 2 28 {front_text:{messages:["{\"text\":\"3位\",\"bold\":true,\"underlined\":true,\"color\":\"dark_red\"}","[\"\"]","{\"nbt\":\"Ranking.3.Name\",\"storage\":\"pctw:fishing_battle/ranking\"}","[\"\",{\"nbt\":\"Ranking.3.Score\",\"storage\":\"pctw:fishing_battle/ranking\",\"bold\":true},{\"text\":\"pt\",\"bold\":true}]"]},GlowingText:1b}
        ### player_head削除
            execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.1st] at @s run item replace entity @s enderchest.0 with air
            execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.2nd] at @s run item replace entity @s enderchest.0 with air
            execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 as @a[tag=PCTW.FSBT.Player,tag=PCTW.FSBT.Temp.Score.3rd] at @s run item replace entity @s enderchest.0 with air
        ### storage削除
            execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 run data remove storage pctw:temp/save Save
        ### scoreboard
            execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 run scoreboard players reset $PCTW.FSBT.Temp.GenRank.1st PCTW.FSBT.Score
            execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 run scoreboard players reset $PCTW.FSBT.Temp.GenRank.2nd PCTW.FSBT.Score
            execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 run scoreboard players reset $PCTW.FSBT.Temp.GenRank.3rd PCTW.FSBT.Score
            execute if score $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp matches 4 run scoreboard players reset $PCTW.FSBT.Temp.Compare.Count PCTW.Core.Temp

#endregion