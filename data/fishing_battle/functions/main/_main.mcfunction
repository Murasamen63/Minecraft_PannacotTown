#> fishing_battle:main/_main
#
# fishing_battle：常時起動するfunction
#
# @within function _core:main/_main



#region 内容


# GameState
    ## GameState = 0
        execute if score $PCTW.FSBT.System PCTW.FSBT.GameState = $PCTW.FSBT.GameState.Ready PCTW.FSBT.GameState run function fishing_battle:main/game_state/1_ready
    ## GameState = 1
        execute if score $PCTW.FSBT.System PCTW.FSBT.GameState = $PCTW.FSBT.GameState.CountDown PCTW.FSBT.GameState run function fishing_battle:main/game_state/2_countdown
    ## GameState = 2
        execute if score $PCTW.FSBT.System PCTW.FSBT.GameState = $PCTW.FSBT.GameState.Play PCTW.FSBT.GameState run function fishing_battle:main/game_state/3_play
    ## GameState = 3
        execute if score $PCTW.FSBT.System PCTW.FSBT.GameState = $PCTW.FSBT.GameState.End PCTW.FSBT.GameState run function fishing_battle:main/game_state/4_end

# 常時実行
    ## 経験値オーブを消す
        execute as @e[type=experience_orb] at @s run kill @s
    ## 店員と会話
        execute as @a at @s if predicate fishing_battle:talk_to_shop_staff/shop_staff if score @s PCTW.Core.Talk_Villager matches 1.. run function fishing_battle:shop/talk_to_shop_staff


#endregion