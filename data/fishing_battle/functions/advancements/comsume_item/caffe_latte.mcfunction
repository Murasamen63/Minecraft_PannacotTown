#> fishing_battle:advancements/comsume_item/caffe_latte
#
# fishing_battle：『カフェラテ』を食べた時のadvancementのリワードfunction
#
# @within advancement fishing_battle:comsume_item/caffe_latte



#region 内容

# アイテム処理
    ## バケツ削除
        clear @s bucket 1

# advancement削除
    advancement revoke @s only fishing_battle:consume_item/caffe_latte

#endregion