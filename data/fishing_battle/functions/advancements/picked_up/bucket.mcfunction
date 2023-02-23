#> fishing_battle:advancements/picked_up/bucket
#
# fishing_battle：『カフェラテ』を食べた後のバケツ入手advancementのリワードfunction
#
# @within advancement fishing_battle:picked_up/bucket



#region 内容

# アイテム処理
    ## 削除
        clear @s bucket 1

# advancement削除
    advancement revoke @s only fishing_battle:picked_up/bucket

#endregion