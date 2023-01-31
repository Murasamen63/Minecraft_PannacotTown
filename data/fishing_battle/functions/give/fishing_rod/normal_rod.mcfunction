#> fishing_battle:give/fishing_rod/normal_rod
#
# fishing_rod：アイテムを付与『ボロのつりざお』
#
# @within function fishing_battle:main/game_state/2_countdown



#region 内容

# give
    give @s fishing_rod{display:{Name:'{"text":"釣り竿","color":"white"}',Lore:['{"text":"普通 III","color":"gray","italic": false}','{"text":" "}','{"text":"ただの釣竿","color":"white","italic":false}']},Unbreakable:1b,Enchantments:[{id:"minecraft:lure",lvl:2s}],HideFlags:5,PCTWItems:1b,PCTWFSBTItems:1b,FSBTFishingRod:1b,FSBTNormalFishingRod:1b} 1

#endregion