#> fishing_battle:advancements/picked_up/normal/cod
#
# fishing_battle：『タラ』を拾った時のadvancementのリワードfunction
#
# @within advancement fishing_battle:picked_up/normal/cod



#region 内容

# アイテム処理
        ### 元アイテム削除
            clear @s cod{FSBTNotPickedUpHookedItem:1b,FSBTCod:1b}
        ### スコア増加
            scoreboard players add @s PCTW.FSBT.Score 2
        ### 観賞用アイテム付与
            function fishing_battle:give/hooked_item/normal/cod
        ### 通知
            ### 通知
                tellraw @s ["",{"text":"  *GET* ","bold":true,"color":"gold"},"    "," 『",{"text":"タラ","italic":true},"』    ","+",{"text":"2pt","bold":true,"color":"green"}]
            ### 効果音
                playsound entity.experience_orb.pickup voice @s ~ ~ ~ 1.0 2.0

# advancement削除
    advancement revoke @s only fishing_battle:picked_up/normal/cod

#endregion