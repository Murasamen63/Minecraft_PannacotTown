#> fishing_battle:advancements/consume_item/caffe_latte
#
# fishing_battle：『カフェラテ』を食べた時のadvancementのリワードfunction
#
# @within advancement fishing_battle:consume_item/caffe_latte



#region 内容

# タグ付与
    tag @s add PCTW.FSBT.Drink.Caffe_latte

# advancement削除
    advancement revoke @s only fishing_battle:consume_item/caffe_latte

#endregion