#> fishing_battle:shop/talk/lure_rod
#
# fishing_battle：村人と会話「入れ食い釣竿」
#
# @within advancement fishing_battle:talk_to_villager/lure_rod



#region 内容

# 会話
    ## 持っていない場合
        tellraw @s [""," [店員] ","こいつがありゃ美女も魚も釣り放題だ！"]
    ## 持っている場合
        #execute as @s[nbt={Inventory:[{id:"minecraft:fishing_rod",tag:{FSBTSlotFishingRod:1b}}]}] at @s run tellraw

#endregion