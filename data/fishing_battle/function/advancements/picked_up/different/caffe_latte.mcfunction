#> fishing_battle:advancements/picked_up/different/caffe_latte
#
# fishing_battle：『カフェラテ』を拾った時のadvancementのリワードfunction
#
# @within advancement fishing_battle:picked_up/different/caffe_latte



#region 内容

# アイテム処理
    ## 元アイテム削除
        #execute if predicate fishing_battle:game_state/play run clear @s milk_bucket{FSBTNotPickedUpHookedItem:1b,FSBTCaffe_latte:1b}
    ## スコア増加
        execute if predicate fishing_battle:game_state/play run scoreboard players add @s PCTW.FSBT.Score 150
    ## 観賞用アイテム付与
        execute if predicate fishing_battle:game_state/play run function fishing_battle:give/hooked_item/different/caffe_latte
    ## 通知
        ### 通知
            execute if predicate fishing_battle:game_state/play run tellraw @s ["",{"text":"  *GET* ","bold":true,"color":"gold"},"    "," 『",{"text":"カフェラテ","italic":true},"』    ","+",{"text":"150pt","bold":true,"color":"red"}]
        ### 効果音
            execute if predicate fishing_battle:game_state/play run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 2.0

# advancement削除
    advancement revoke @s only fishing_battle:picked_up/different/caffe_latte

#endregion