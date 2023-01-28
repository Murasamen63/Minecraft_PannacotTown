#> _core:pctw_master_gui/main
#
# _core：『設定』を所持している時のfunction
#
# @within function _core:main/_main



#region 内容

# 所持
    ## mainhand
        execute if entity @s[tag=PCTW.Player.Staff] if predicate _core:selected_item/pctw_master_gui/mainhand unless predicate _core:action/is_sneaking run function _core:pctw_master_gui/have/mainhand
    ## mainhand+shift
    ## offhand
        execute if entity @s[tag=PCTW.Player.Staff] if predicate _core:selected_item/pctw_master_gui/offhand unless predicate _core:action/is_sneaking run function _core:pctw_master_gui/have/offhand
    ## offhand+shift

# scoreboardリセット
    execute if entity @s[tag=!PCTW.Player.Staff] if score @s PCTW.Core.Use.WFoaS matches 1.. run scoreboard players reset @s PCTW.Core.Use.WFoaS

#endregion