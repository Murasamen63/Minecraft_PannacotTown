#> fishing_battle:main/_main
#
# fishing_battle：常時起動するfunction
#
# @within function _core.pctw:main/_main



#region 内容


# GameState
    ## GameState = 0
        execute if predicate fishing_battle:game_state/ready run function fishing_battle:main/game_state/1_ready
    ## GameState = 1
        execute if predicate fishing_battle:game_state/countdown run function fishing_battle:main/game_state/2_countdown
    ## GameState = 2
        execute if predicate fishing_battle:game_state/play run function fishing_battle:main/game_state/3_play
    ## GameState = 3
        execute if predicate fishing_battle:game_state/result run function fishing_battle:main/game_state/4_result

# 常時実行
    ## 経験値オーブを消す
        execute as @e[type=experience_orb] at @s run kill @s
    ## 店員と会話
        execute as @a at @s if predicate fishing_battle:talk_to_shop_staff/shop_staff if score @s PCTW.Core.Talk_Villager matches 1.. run function fishing_battle:shop/talk_to_shop_staff


#endregion