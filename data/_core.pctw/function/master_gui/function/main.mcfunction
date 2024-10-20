#> _core.pctw:master_gui/function/main
#
# core : MasterGUIのページを制御します
#
# @within function _core.pctw:master_gui/main



#region 内容

# GameMode
    ## core
        execute if data storage pctw:core {GameMode:null} if score @s PCTW.Core.Chest_GUI.Page matches 1 run function _core.pctw:master_gui/function/1
    ## fishing_battle
        execute if data storage pctw:core {GameMode:FishingBattle} run function fishing_battle:master_gui/function/main
    ## werewolf
        execute if data storage pctw:core {GameMode:Werewolf} run function werewolf:master_gui/function/main

#endregion