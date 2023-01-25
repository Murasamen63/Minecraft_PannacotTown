#> fishing_battle:give/shop_sign/trade_lure_rod_sign
#
# fishing_rod：アイテムを付与『『入れ食い釣竿』の取引用看板』
#
# @private



#region 内容

give @s spruce_sign{display:{Name:'[{"text":"『"},{"text":"入れ食い釣竿","color":"aqua","italic":true},{"text":"』"},{"text":"の取引用看板"}]'},BlockEntityTag:{Text1:'{"text":"","clickEvent":{"action":"run_command","value":"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade_lure_rod"}}',Text2:'{"text":"入れ食い釣竿"}',Text3:'[{"nbt":"Price.FishingRod.LureRod","storage":"pctw:fishing_battle/shop_price","bold":true,"color":"green"},{"text":"pt","bold":true,"color":"green"}]',GlowingText:1b},PCTWItems:1b,PCTWFSBTItems:1b,FSBTShopTradeSign:1b,FSBTTradeLureRodSign:1b}

#endregion