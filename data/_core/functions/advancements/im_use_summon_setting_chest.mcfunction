#> _core:advancements/im_use_summon_setting_chest
#
# _core：キノコ棒を右クリックして召喚した時のadvancementのリワードfunction
#
# @within advancement _core:im_use_summon_setting_chest



#region 内容

# 失敗
    ## エラー表示
        execute at @s anchored eyes positioned ^ ^ ^2 align xyz unless block ~ ~ ~ air run tellraw @s ["",{"text":"[Error] ","color":"red"},{"text":"パーティクルの場所にブロックが存在しています。","color":"red"}]
    ## scoreboard減少
        execute at @s anchored eyes positioned ^ ^ ^2 align xyz unless block ~ ~ ~ air run scoreboard players reset @s PCTW.Use.WFoaS
    ## advancement削除
        execute at @s anchored eyes positioned ^ ^ ^2 align xyz unless block ~ ~ ~ air run advancement revoke @s only _core:im_use_summon_setting_chest

# 成功
    ## AEC召喚
        execute at @s anchored eyes positioned ^ ^ ^2 align xyz if block ~ ~ ~ air run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Duration:888,Tags:["PCTW.AEC.AlwaysAlive","PCTW.AEC.Summon.SettingChest"]}
    ## チェスト召喚
        execute at @s anchored eyes positioned ^ ^ ^2 align xyz if block ~ ~ ~ air run setblock ~ ~ ~ chest{Lock:"Setting"} keep

#endregion