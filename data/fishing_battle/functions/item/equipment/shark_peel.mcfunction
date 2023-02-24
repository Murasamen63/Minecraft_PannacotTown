#> fishing_battle:item/equipment/shark_peel
#
# fishing_battle：『サメの皮』を装備するfunction
#
# @within function fishing_battle:item/function



#region 内容

# 装備
    item replace entity @s armor.head from entity @s weapon.mainhand

# 手持ち削除
    clear @s warped_fungus_on_a_stick{FSBTShark_peel:1b} 1

# 効果音
    playsound minecraft:item.armor.equip_generic voice @s ~ ~ ~ 1.0 1.0

# スコアリセット
    scoreboard players reset @s PCTW.Core.Use.WFoaS

#endregion