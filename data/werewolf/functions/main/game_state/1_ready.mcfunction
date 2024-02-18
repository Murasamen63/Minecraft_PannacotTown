#> werewolf:main/game_state/1_ready
#
# werewolf : 
#
# @within function werewolf:main/_main



#region 内容

# gamemode設定
    ## サバイバルをアドベンチャーに変更
        execute as @a[gamemode=survival] run tellraw @s {"text":" ※サバイバルモードを選択した為、自動的にアドベンチャーモードに変更しました。","color":"yellow"}
        execute as @a[gamemode=survival] run gamemode adventure @s

# Playerタグ管理
    ## advantureにタグ付与
        execute as @a[gamemode=adventure] at @s run tag @s add PCTW.WW.Player
    ## それ以外にタグ剥奪
        execute as @a[gamemode=!adventure] at @s run tag @s remove PCTW.WW.Player

## bossbar反映
        ### 数値初期化
            bossbar set pctw:fishing_battle/timer max 1
            bossbar set pctw:fishing_battle/timer value 1
        ### 名称


#endregion