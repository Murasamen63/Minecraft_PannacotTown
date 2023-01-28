#> _core:pctw_master_stick/summon_master_gui
#
# _core：『設定』を使用 EnderChestGUIを召喚
#
# @within function _core:pctw_master_stick/have/offhand

#region 宣言

#> Temp Score Holder
# @private
    #define score_holder $PCTW.Temp.UUID

#> Tag
# @within function _core:pctw_master_stick/**
    #define tag PCTW.Player.Use.MasterGUI

#endregion



#region 内容

# タグ付け
    tag @s add PCTW.Player.Use.MasterGUI

# 召喚
    ## EnderChest
        ### AEC
            execute anchored eyes positioned ^ ^ ^2 align xyz run summon area_effect_cloud ~ ~ ~ {Duration:8888,Tags:["PCTW.AEC.AlwaysAlive","PCTW.AEC.MasterGUI","PCTW.AEC.MasterGUI.EnderChest"]}
        ### EnderChest
            #### 東
                execute anchored eyes positioned ^ ^ ^2 align xyz if entity @s[y_rotation=-135..-44.9] run setblock ~ ~ ~ ender_chest[facing=west] replace
            #### 西
                execute anchored eyes positioned ^ ^ ^2 align xyz if entity @s[y_rotation=45..134.9] run setblock ~ ~ ~ ender_chest[facing=east] replace
            #### 北
                execute anchored eyes positioned ^ ^ ^2 align xyz if entity @s[y_rotation=-180..-135] run setblock ~ ~ ~ ender_chest[facing=south] replace
                execute anchored eyes positioned ^ ^ ^2 align xyz if entity @s[y_rotation=135..180] run setblock ~ ~ ~ ender_chest[facing=south] replace
            #### 南
                execute anchored eyes positioned ^ ^ ^2 align xyz if entity @s[y_rotation=-45..44.9] run setblock ~ ~ ~ ender_chest[facing=north] replace
        ### 効果音
            execute as @a at @s run playsound block.stone.place voice @s ~ ~ ~ 1.0 1.0
    ## SummonedPlaceAEC
        summon area_effect_cloud ~ ~ ~ {Duration:8888,Tags:["PCTW.AEC.AlwaysAlive","PCTW.AEC.MasterGUI","PCTW.AEC.MasterGUI.Summoned_Place"]}

# PlayerID設定
    ## Player
        execute store result score @s PCTW.Core.Player_ID run data get entity @s UUID[0]
        execute store result score $PCTW.Temp.UUID PCTW.Core.Player_ID run data get entity @s UUID[1]
        scoreboard players operation @s PCTW.Core.Player_ID *= $PCTW.Temp.UUID PCTW.Core.Player_ID
    ## EnderChestAEC
        execute anchored eyes positioned ^ ^ ^2 align xyz run scoreboard players operation @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.EnderChest,sort=nearest,limit=1] PCTW.Core.Player_ID = @s PCTW.Core.Player_ID
    ## SummonedPlaceAEC
        scoreboard players operation @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.Summoned_Place,sort=nearest,limit=1] PCTW.Core.Player_ID = @s PCTW.Core.Player_ID

# リセット
    scoreboard players reset $PCTW.Temp.UUID PCTW.Core.Player_ID
    
#endregion