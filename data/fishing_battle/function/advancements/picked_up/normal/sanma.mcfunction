#> fishing_battle:advancements/picked_up/normal/sanma
#
# fishing_battle：『サンマ』を拾った時のadvancementのリワードfunction
#
# @within advancement fishing_battle:picked_up/normal/sanma



#region 内容

# アイテム処理
        ### 元アイテム削除
            #execute if predicate fishing_battle:game_state/play run clear @s cod{FSBTNotPickedUpHookedItem:1b,FSBTSanma:1b}
        ### スコア増加
            execute if predicate fishing_battle:game_state/play run scoreboard players add @s PCTW.FSBT.Score 10
        ### 観賞用アイテム付与
            execute if predicate fishing_battle:game_state/play run function fishing_battle:give/hooked_item/normal/sanma
        ### 通知
            ### 通知
                execute if predicate fishing_battle:game_state/play run tellraw @s ["",{"text":"  *GET* ","bold":true,"color":"gold"},"    "," 『",{"text":"サンマ","italic":true},"』    ","+",{"text":"10pt","bold":true,"color":"green"}]
            ### 効果音
                execute if predicate fishing_battle:game_state/play run playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 2.0

# advancement削除
    advancement revoke @s only fishing_battle:picked_up/normal/sanma

#endregion