#> _core.pctw:pctw_master_gui/have/mainhand
#
# _core.pctw：『設定』をメインハンド所持時のfunction
#
# @within function _core.pctw:pctw_master_gui/main



#region 内容

# 共通
    ## 移動時
        execute if entity @s[tag=PCTW.Player.Use.MasterGUI] if score @s PCTW.Core.Player_ID = @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.Summoned_Place,sort=nearest,limit=1] PCTW.Core.Player_ID run function _core.pctw:pctw_master_gui/delete

# scoreboard初期化
    scoreboard players reset @s PCTW.Core.Use.WFoaS

#endregion
