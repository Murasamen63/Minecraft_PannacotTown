#> fishing_battle:give/shop_sign/trade_double_rod_sign
#
# fishing_rod：アイテムを付与『『ダブル釣竿』の取引用看板』
#
# @private



#region 内容

give @s spruce_sign{display:{Name:'[{"text":"『"},{"text":"ダブル釣竿","color":"aqua","italic":true},{"text":"』"},{"text":"の取引用看板"}]'},BlockEntityTag:{Text1:'{"text":"","clickEvent":{"action":"run_command","value":"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade_double_rod"}}',Text2:'{"text":"ダブル釣竿"}',Text3:'[{"nbt":"Price.FishingRod.DoubleRod","storage":"pctw:fishing_battle/shop_price","bold":true,"color":"green"},{"text":"pt","bold":true,"color":"green"}]',GlowingText:1b},PCTWItems:1b,PCTWFSBTItems:1b,FSBTShopTradeSign:1b,FSBTTradeDoubleRodSign:1b}

#endregion