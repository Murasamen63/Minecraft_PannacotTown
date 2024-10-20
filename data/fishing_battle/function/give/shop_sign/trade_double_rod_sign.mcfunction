#> fishing_battle:give/shop_sign/trade_double_rod_sign
#
# fishing_rod：アイテムを付与『『ダブル釣竿』の取引用看板』
#
# @private



#region 内容

#give @s spruce_sign{display:{Name:'[{"text":"『"},{"text":"ダブル釣竿","color":"aqua","italic":true},{"text":"』"},{"text":"の取引用看板"}]'},BlockEntityTag:{front_text:{messages:['[""]','{"text":"ダブル釣竿","clickEvent":{"action":"run_command","value":"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/double_rod"}}','["",{"nbt":"Price.FishingRod.DoubleRod","storage":"pctw:fishing_battle/shop_price","bold":true,"color":"green"},{"text":"pt","bold":true,"color":"green"}]','""'],has_glowing_text:1b}},PCTWItems:1b,PCTWFSBTItems:1b,FSBTShopTradeSign:1b,FSBTTradeDoubleRodSign:1b}

#endregion