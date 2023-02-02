#> fishing_battle:advancements/picked_up/high_class/koi
#
# fishing_battle：『こいもよう』を拾った時のadvancementのリワードfunction
#
# @within advancement fishing_battle:picked_up/high_class/koi



#region 内容

# アイテム処理
        ### 元アイテム削除
            execute if predicate fishing_battle:game_state/play run clear @s bread{FSBTNotPickedUpHookedItem:1b,FSBTKoi:1b}
        ### スコア増加
            execute if predicate fishing_battle:game_state/play run scoreboard players add @s PCTW.FSBT.Score 500
        ### 観賞用アイテム付与
            execute if predicate fishing_battle:game_state/play run function fishing_battle:give/hooked_item/high_class/koi
        ### 通知
            ### 通知
                execute if predicate fishing_battle:game_state/play run tellraw @s ["",{"text":"  *GET* ","bold":true,"color":"gold"},"    "," 『",{"text":"こいもよう","italic":true},"』    ","+",{"text":"500pt","bold":true,"color":"red"}]
            ### 効果音
                execute if predicate fishing_battle:game_state/play run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 2.0

# advancement削除
    advancement revoke @s only fishing_battle:picked_up/high_class/koi

#endregion