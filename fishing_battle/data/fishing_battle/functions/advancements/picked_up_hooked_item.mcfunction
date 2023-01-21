#> fishing_battle:advancements/picked_up_hooked_item
#
# fishing_battle：釣ったアイテムを拾った時のadvancementのリワードfunction
#
# @within advancement fishing_battle:picked_up_hooked_item



#region 内容

# アイテム処理
    ## 生鱈
        ### アイテム検知
            execute store result score @s PCTW.Temporary run clear @s cod{FSBTNotPickedUpHookedItem:1b} 0
        ### 効果を処理
            #execute if score @s PCTW.Temporary matches 1.. run
        ### アイテムを削除

# advancement削除
    advancement revoke @s only fishing_battle:picked_up_hooked_item

#endregion