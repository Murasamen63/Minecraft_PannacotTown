#> fishing_battle:master_gui/function/main
#
# core : MasterGUIのページを制御します
#
# @within function _core.pctw:master_gui/function/main



#region 内容

# function
    ## top
        execute if score @s PCTW.Core.Chest_GUI.Page matches 1 run function fishing_battle:master_gui/function/1
    ## 制限時間設定
        execute if score @s PCTW.Core.Chest_GUI.Page matches 2
    ## チーム設定
        execute if score @s PCTW.Core.Chest_GUI.Page matches 3
    ## 特殊ルール
        execute if score @s PCTW.Core.Chest_GUI.Page matches 4

#endregion