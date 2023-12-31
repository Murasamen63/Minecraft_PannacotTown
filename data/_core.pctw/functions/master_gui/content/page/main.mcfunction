#> _core.pctw:master_gui/content/page/main
#
# core : MasterGUIのページを制御します
#
# @within function _core.pctw:master_gui/main



#region 内容

# page
    ## core
        ### ゲームモード選択
            execute if score @s PCTW.Core.Chest_GUI.GameMode matches 0 if score @s PCTW.Core.Chest_GUI.Page matches 1 run function _core.pctw:master_gui/content/page/1

# function
    ## core
        ### ゲームモード選択
            execute if score @s PCTW.Core.Chest_GUI.GameMode matches 0 if score @s PCTW.Core.Chest_GUI.Page matches 1 run function _core.pctw:master_gui/content/function/1

# GameMode
    ## fishing_battle
        execute if score @s PCTW.Core.Chest_GUI.GameMode matches 1 run function fishing_battle:master_gui/page/main

#endregion