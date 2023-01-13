#> fishing_battle:main/_reload
#
# fishing_battle：初めに読み込むfunction
#
# @within function fishing_battle:init/install



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
        execute if score PCTW.System PCTW.FSBT.GameState matches -2147483648.. run scoreboard players set PCTW.System PCTW.FSBT.GameState 0
    ## Info
        scoreboard objectives modify PCTW.FSBT.Info displayname "今日の記録"
        scoreboard objectives setdisplay sidebar PCTW.FSBT.Info
        

# Team作成


# アイテム付与
    ## 歴代ランキング本
        execute as @a[nbt=!{Inventory:[{id:"minecraft:written_book",tag:{FSBTRankingBook:1b}}]}] run give @s written_book{pages:['["","==== ",{"text":"ランキング","bold":true,"color":"gold"}," ====","\\n","\\n",{"text":"1位  ","bold":true,"color":"red"},{"nbt":"Ranking.1.Name","storage":"pctw:fishing_battle/ranking","bold":true,"hoverEvent":{"action":"show_text","contents":[{"nbt":"Ranking.1.Score","storage":"pctw:fishing_battle/ranking","bold":true},"pt"]}},"\\n","\\n",{"text":"2位  ","color":"gray"},{"nbt":"Ranking.2.Name","storage":"pctw:fishing_battle/ranking","hoverEvent":{"action":"show_text","contents":[{"nbt":"Ranking.2.Score","storage":"pctw:fishing_battle/ranking","color":"gray"},"pt"]}},"\\n","\\n",{"text":"3位  ","color":"gold"},{"nbt":"Ranking.3.Name","storage":"pctw:fishing_battle/ranking","hoverEvent":{"action":"show_text","contents":[{"nbt":"Ranking.3.Score","storage":"pctw:fishing_battle/ranking","color":"gold"},"pt"]}},"\\n","\\n","\\n","4位",{"nbt":"Ranking.4.Name","storage":"pctw:fishing_battle/ranking","hoverEvent":{"action":"show_text","contents":[{"nbt":"Ranking.4.Score","storage":"pctw:fishing_battle/ranking"},"pt"]}},"\\n","5位",{"nbt":"Ranking.5.Name","storage":"pctw:fishing_battle/ranking","hoverEvent":{"action":"show_text","contents":[{"nbt":"Ranking.5.Score","storage":"pctw:fishing_battle/ranking"},"pt"]}}]'],title:"歴代ランキング",author:"釣り大会",PCTWItems:1b,PCTWFSBTItems:1b,FSBTRankingBook:1b}
    ## Setting


#endregion