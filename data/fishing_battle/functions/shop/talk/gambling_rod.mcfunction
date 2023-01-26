#> fishing_battle:shop/talk/gambling_rod
#
# fishing_battle：村人と会話「博打釣竿」
#
# @within advancement fishing_battle:talk_to_villager/gambling_rod



#region 内容

# 会話
    ## 持っていない場合
        tellraw @s [""," [店員] ","りっちょく！"]
    ## 持っている場合
        #execute as @s[nbt={Inventory:[{id:"minecraft:fishing_rod",tag:{FSBTSlotFishingRod:1b}}]}] at @s run tellraw

#endregion