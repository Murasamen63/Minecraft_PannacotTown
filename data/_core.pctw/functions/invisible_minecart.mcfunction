#> _core.pctw:invisible_minecart
#
# core : 
#
# @within function _core.pctw:main/_main

#region 宣言

#> Entity Tag
# @public
    #define tag PCTW.Minecart.Set.Done

#endregion



#region 内容

# minecart設定
    ## minecart
        data merge entity @s[type=minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"down"}},DisplayOffset:4}
    ## chest_minecart
        data merge entity @s[type=chest_minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"up"}},DisplayOffset:4}
    ## furnace_minecart
        data merge entity @s[type=furnace_minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"north"}},DisplayOffset:4}
    ## tnt_minecart
        data merge entity @s[type=tnt_minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"south"}},DisplayOffset:4}
    ## hopper_minecart
        data merge entity @s[type=hopper_minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"west"}},DisplayOffset:4}

# タグ付与
    tag @s add PCTW.Minecart.Set.Done

#endregion

## from misode's at: https://gist.github.com/misode/57dca050fbe2a0a8232c0c3fbab04e35