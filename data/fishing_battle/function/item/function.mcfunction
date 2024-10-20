#> fishing_battle:item/function
#
# fishing_battle：アイテムの処理function
#
# @within function _core.pctw:main/_main



#region 内容

# 装備
    ## 緑の音符
        execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{FSBTGreen_note:1b}}}] at @s if score @s PCTW.Core.Use.WFoaS matches 1.. run function fishing_battle:item/equipment/green_note
    ## アスネリ
        execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{FSBTAsuneli:1b}}}] at @s if score @s PCTW.Core.Use.WFoaS matches 1.. run function fishing_battle:item/equipment/asuneli
    ## よたん(本体)
        execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{FSBTYotan_cloth:1b}}}] at @s if score @s PCTW.Core.Use.WFoaS matches 1.. run function fishing_battle:item/equipment/yotan_cloth
    ## サメの皮
        execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{FSBTShark_peel:1b}}}] at @s if score @s PCTW.Core.Use.WFoaS matches 1.. run function fishing_battle:item/equipment/shark_peel

#endregion