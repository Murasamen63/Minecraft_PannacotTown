#> fishing_battle:give/shop_sign/trade_gambling_rod_sign
#
# fishing_rod：アイテムを付与『『リッチ釣竿』の取引用看板』
#
# @private



#region 内容

#give @s spruce_sign{display:{Name:'[{"text":"『"},{"text":"博打釣竿","color":"aqua","italic":true},{"text":"』"},{"text":"の取引用看板"}]'},BlockEntityTag:{front_text:{messages:['[""]','{"text":"博打釣竿","clickEvent":{"action":"run_command","value":"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/gambling_rod"}}','["",{"nbt":"Price.FishingRod.GamblingRod","storage":"pctw:fishing_battle/shop_price","bold":true,"color":"green"},{"text":"pt","bold":true,"color":"green"}]','""'],has_glowing_text:1b}},PCTWItems:1b,PCTWFSBTItems:1b,FSBTShopTradeSign:1b,FSBTTradeGamblingRodSign:1b}

#endregion