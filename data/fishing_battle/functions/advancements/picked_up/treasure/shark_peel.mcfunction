#> fishing_battle:advancements/picked_up/treasure/shark_peel
#
# fishing_battle：『サメの皮』を拾った時のadvancementのリワードfunction
#
# @within advancement fishing_battle:picked_up/treasure/shark_peel



#region 内容

# アイテム処理
        ### 元アイテム削除
            execute if predicate fishing_battle:game_state/play run clear @s warped_fungus_on_a_stick{FSBTNotPickedUpHookedItem:1b,FSBTShark_peel:1b}
        ### スコア増加
            execute if predicate fishing_battle:game_state/play run scoreboard players add @s PCTW.FSBT.Score 1000
        ### 観賞用アイテム付与
            execute if predicate fishing_battle:game_state/play run function fishing_battle:give/hooked_item/treasure/shark_peel
        ### 通知
            ### 通知
                execute if predicate fishing_battle:game_state/play run tellraw @s ["",{"text":"  *GET* ","bold":true,"color":"gold"},"    "," 『",{"text":"サメの皮","color":"aqua","italic":true},"』    ","+",{"text":"1000pt","bold":true,"color":"aqua"}]
            ### 効果音
                execute if predicate fishing_battle:game_state/play run playsound ui.toast.challenge_complete voice @s ~ ~ ~ 1.0 2.0

# advancement削除
    advancement revoke @s only fishing_battle:picked_up/treasure/shark_peel

#endregion