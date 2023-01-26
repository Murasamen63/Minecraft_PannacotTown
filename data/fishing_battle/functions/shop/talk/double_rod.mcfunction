#> fishing_battle:shop/talk/double_rod
#
# fishing_battle：村人と会話「ダブル釣竿」
#
# @within advancement fishing_battle:talk_to_villager/double_rod



#region 内容

# 会話
    ## 持っていない場合
        tellraw @s [""," [店員] ","釣り竿ってね、2つになると効果倍になるんですよ。"]
    ## 持っている場合
        #execute as @s[nbt={Inventory:[{id:"minecraft:fishing_rod",tag:{FSBTSlotFishingRod:1b}}]}] at @s run tellraw

#endregion