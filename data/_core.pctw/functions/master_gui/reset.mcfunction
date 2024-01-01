#> _core.pctw:master_gui/reset
#
# core : MasterGUIをリセットするためのものです
#
# @within function
#   _core.pctw:main/_main
#   fishing_battle:master_gui/function/1



#region 内容

# プレイヤーtag削除
    tag @s remove PCTW.Player.Use_MasterGUI

# ChestGUI削除
    execute if score @s PCTW.Core.Player_ID = @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI,distance=..2.5,sort=nearest,limit=1] PCTW.Core.Player_ID as @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI,distance=..2.5,sort=nearest,limit=1] at @s run tp @s ~ ~-200 ~
    execute positioned ~ ~-200 ~ as @e[type=chest_minecart,tag=PCTW.Minecart.MasterGUI,distance=..0.01,sort=nearest,limit=1] run kill @s

#endregion