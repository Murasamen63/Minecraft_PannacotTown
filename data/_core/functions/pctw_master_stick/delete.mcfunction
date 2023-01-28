#> _core:pctw_master_stick/delete
#
# _core：『設定』を使用 EnderChestGUIを削除
#
# @within function
#   _core:main/_main
#   _core:pctw_master_stick/have/mainhand
#   _core:pctw_master_stick/have/offhand



#region 内容

# タグ削除
    tag @s remove PCTW.Player.Use.MasterGUI

# 削除
    ## EnderChest
        ### EnderChest
            execute if score @s PCTW.Core.Player_ID = @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.EnderChest,sort=nearest,limit=1] PCTW.Core.Player_ID as @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.EnderChest,sort=nearest,limit=1] at @s run setblock ~ ~ ~ air replace
        ### AEC
            execute anchored eyes positioned ^ ^ ^2 align xyz run kill @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.EnderChest,sort=nearest,limit=1]
            #summon area_effect_cloud ~ ~ ~ {Duration:8888,Tags:["PCTW.AEC.AlwaysAlive","PCTW.AEC.MasterGUI","PCTW.AEC.MasterGUI.EnderChest"]}
        ### 効果音
            execute as @a at @s run playsound minecraft:block.stone.break voice @s ~ ~ ~ 1.0 0.75
    ## SummonedPlaceAEC
        kill @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.Summoned_Place,sort=nearest,limit=1]
        #summon area_effect_cloud ~ ~ ~ {Duration:8888,Tags:["PCTW.AEC.AlwaysAlive","PCTW.AEC.MasterGUI","PCTW.AEC.MasterGUI.Summoned_Place"]}

#endregion