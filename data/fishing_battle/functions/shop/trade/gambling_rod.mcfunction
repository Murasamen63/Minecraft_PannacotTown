#> fishing_battle:shop/trade/gambling_rod
#
# fishing_rod：『博打釣竿』の取引用function
#
# @within function fishing_battle:give/shop_sign/trade_gambling_rod_sign



#region 宣言

#> Temp Score Holder
# @private
    #define score_holder $PCTW.FSBT.Temp.GamblingRod.Price

#endregion

#region 内容

# 初期化
    execute store result score $PCTW.FSBT.Temp.GamblingRod.Price PCTW.Core.Temp run data get storage pctw:fishing_battle/shop_price Price.FishingRod.GamblingRod

# GameState = 0
    ## 説明
        execute if score $PCTW.FSBT.System PCTW.FSBT.GameState matches 0 run tellraw @s "hello"

# GameState = 2
    ## トレード処理
        ### 失敗
            #### 通知
                ##### 表示
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameState matches 2 if score @s PCTW.FSBT.Score < $PCTW.FSBT.Temp.GamblingRod.Price PCTW.Core.Temp run tellraw @s ["","\n",{"text":"  スコアが足りません!","color":"red"},"    ","必須スコア ",{"nbt":"Price.FishingRod.GamblingRod","storage":"pctw:fishing_battle/shop_price","bold":true,"color":"green"},{"text":"pt","bold":true,"color":"green"},"\n"]
                ##### 効果音
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameState matches 2 if score @s PCTW.FSBT.Score < $PCTW.FSBT.Temp.GamblingRod.Price PCTW.Core.Temp run playsound ui.button.click voice @s ~ ~ ~ 1.0 1.8
        ### 成功
            #### アイテムを付与
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameState matches 2 if score @s PCTW.FSBT.Score >= $PCTW.FSBT.Temp.GamblingRod.Price PCTW.Core.Temp run function fishing_battle:give/fishing_rod/gambling_rod
            #### 通知
                ##### 表示
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameState matches 2 if score @s PCTW.FSBT.Score >= $PCTW.FSBT.Temp.GamblingRod.Price PCTW.Core.Temp run tellraw @s ["","\n","  『",{"text":"博打釣竿","italic":true,"color":"aqua"},"』 を交換しました!","\n"]
                ##### 効果音
                    execute if score $PCTW.FSBT.System PCTW.FSBT.GameState matches 2 if score @s PCTW.FSBT.Score >= $PCTW.FSBT.Temp.GamblingRod.Price PCTW.Core.Temp run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 2.0
            #### スコア減少
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameState matches 2 if score @s PCTW.FSBT.Score >= $PCTW.FSBT.Temp.GamblingRod.Price PCTW.Core.Temp run scoreboard players operation @s PCTW.FSBT.Score -= $PCTW.FSBT.Temp.GamblingRod.Price PCTW.Core.Temp

# scoreboard削除
    scoreboard players reset $PCTW.FSBT.Temp.GamblingRod.Price PCTW.Core.Temp

#endregion