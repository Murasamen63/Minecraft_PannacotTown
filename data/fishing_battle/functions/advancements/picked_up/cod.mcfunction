#> fishing_battle:advancements/picked_up/cod
#
# fishing_battle：生鱈を拾った時のadvancementのリワードfunction
#
# @within advancement fishing_battle:picked_up/cod



#region 内容

# アイテム処理
        ### アイテム検知
            execute store result score @s PCTW.Core.Temporary run clear @s cod{FSBTNotPickedUpHookedItem:1b} 0
        ### 元アイテム削除
            #execute if score @s PCTW.Core.Temporary matches 1.. run
        ### 観賞用アイテム付与
            #give 

# advancement削除
    advancement revoke @s only fishing_battle:picked_up/cod

#endregion