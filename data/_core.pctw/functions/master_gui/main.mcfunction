#> _core.pctw:master_gui/main
#
# core : MasterGUIのメイン機能を制御します
#
# @within function _core.pctw:main/_main

#region 宣言

#> Entity Tag
# @public
    #define tag PCTW.Player.Use_MasterGUI
# @private
    #define tag PCTW.Minecart.MasterGUI.Summon

#endregion



#region 内容

# トロッコ召喚
    execute if entity @s[tag=!PCTW.Player.Use_MasterGUI] anchored eyes positioned ^ ^-0.2 ^ run summon minecraft:chest_minecart ~ ~ ~ {CustomName:'{"text":"メニュー"}',Tags:["PCTW.Minecart.MasterGUI","PCTW.Minecart.MasterGUI.Summon","PCTW.Minecart.Set.Done"],Silent:1b,CustomDisplayTile:1b,DisplayState:{Name:"minecraft:air"},NoGravity:1b}

# scoreboard設定
    execute if entity @s[tag=!PCTW.Player.Use_MasterGUI] unless score @s PCTW.Core.Player_ID = @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI.Summon,sort=nearest,limit=1] PCTW.Core.Player_ID run scoreboard players operation @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI.Summon,sort=nearest,limit=1] PCTW.Core.Player_ID = @s PCTW.Core.Player_ID
    execute if entity @s[tag=!PCTW.Player.Use_MasterGUI] run scoreboard players set @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI.Summon] PCTW.Core.Chest_GUI.Page 1

# page初期化
    ## core
        execute if entity @s[tag=!PCTW.Player.Use_MasterGUI] if data storage pctw:core {GameMode:null} as @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI.Summon,sort=nearest,limit=1] at @s run function _core.pctw:master_gui/page/1
    ## fishing_battle
        execute if entity @s[tag=!PCTW.Player.Use_MasterGUI] if data storage pctw:core {GameMode:FishingBattle} as @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI.Summon,sort=nearest,limit=1] at @s run function fishing_battle:master_gui/page/1

# tag操作
    ## ChestGUIタグ
        execute if entity @s[tag=!PCTW.Player.Use_MasterGUI] as @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI.Summon,sort=nearest,limit=1] at @s run tag @s remove PCTW.Minecart.MasterGUI.Summon
    ## playerタグ
        execute if entity @s[tag=!PCTW.Player.Use_MasterGUI] run tag @s add PCTW.Player.Use_MasterGUI

# tp
    execute if entity @s[tag=PCTW.Player.Use_MasterGUI] anchored eyes positioned ^ ^-0.2 ^ run tp @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI,tag=!PCTW.Minecart.MasterGUI.Summon,sort=nearest,limit=1] ~ ~ ~

# function
    execute if entity @s[tag=PCTW.Player.Use_MasterGUI] anchored eyes if score @s PCTW.Core.Player_ID = @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI,tag=!PCTW.Minecart.MasterGUI.Summon,sort=nearest,limit=1] PCTW.Core.Player_ID as @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI,tag=!PCTW.Minecart.MasterGUI.Summon,sort=nearest,limit=1] at @s run function _core.pctw:master_gui/function/main

#endregion