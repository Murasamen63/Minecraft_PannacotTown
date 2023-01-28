#> _core:pctw_master_stick/have/offhand
#
# _core：『設定』をオフハンド所持時のfunction
#
# @within function _core:pctw_master_stick/main



#region 内容

# 共通
    ## 移動時
        execute if entity @s[tag=PCTW.Player.Use.MasterGUI] unless entity @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.Summoned_Place,distance=..0.3] run function _core:pctw_master_stick/delete
    ## エラー
        ### 配置場所にブロックが有る
            execute if score @s PCTW.Core.Use.WFoaS matches 1.. anchored eyes positioned ^ ^ ^2 align xyz unless block ~ ~ ~ air run tellraw @s {"text":"  配置予定場所にブロックが存在します。","color":"red"}
            execute if score @s PCTW.Core.Use.WFoaS matches 1.. anchored eyes positioned ^ ^ ^2 align xyz unless block ~ ~ ~ air run playsound ui.button.click voice @s ~ ~ ~ 1.0 2.0
        ### 既に設置済み
            execute if score @s PCTW.Core.Use.WFoaS matches 1.. if entity @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.Summoned_Place,distance=..0.3] run tellraw @s {"text":"  既に配置されています。","color":"red"}
            execute if score @s PCTW.Core.Use.WFoaS matches 1.. if entity @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.Summoned_Place,distance=..0.3] run playsound ui.button.click voice @s ~ ~ ~ 1.0 2.0

# 所持
    ## particle表示
        execute anchored eyes positioned ^ ^ ^2 align xyz run particle electric_spark ~0.5 ~0.5 ~0.5 0 0 0 0 1 normal
# 使用
    execute if score @s PCTW.Core.Use.WFoaS matches 1.. unless entity @e[type=area_effect_cloud,tag=PCTW.AEC.MasterGUI.Summoned_Place,distance=..0.3] anchored eyes positioned ^ ^ ^2 align xyz if block ~ ~ ~ air at @s run function _core:pctw_master_stick/summon_master_gui

# scoreboard初期化
    scoreboard players reset @s PCTW.Core.Use.WFoaS

#endregion
