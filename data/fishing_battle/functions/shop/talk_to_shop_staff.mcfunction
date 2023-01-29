#> fishing_battle:shop/talk_to_shop_staff
#
# fishing_battle：店員と会話した時のfunction
#
# @within function fishing_battle:main/_main


#region 内容

# 話し声
    playsound entity.villager.ambient voice @s ~ ~ ~ 1.0 1.0

# 会話
    ## ダブル釣竿
        execute if predicate fishing_battle:talk_to_shop_staff/double_rod run tellraw @s [""," [店員] ","釣り竿ってね、2つになると効果倍になるんですよ。"]
    ## 博打釣竿
        execute if predicate fishing_battle:talk_to_shop_staff/gambling_rod run tellraw @s [""," [店員] ","りっちょく！"]
    ## 入れ食い釣竿
        execute if predicate fishing_battle:talk_to_shop_staff/lure_rod run tellraw @s [""," [店員] ","こいつがありゃ美女も魚も釣り放題だ！"]
    ## リッチ釣竿
        execute if predicate fishing_battle:talk_to_shop_staff/rich_rod run tellraw @s [""," [店員] ","これ使うとリッチな音が聞こえるんだ。"]
    ## おじガチャ釣竿
        execute if predicate fishing_battle:talk_to_shop_staff/slot_rod run tellraw @s [""," [店員] ","ただのおじさんです。本当にただのおじさんです。"]

# リセット
    scoreboard players reset @s PCTW.Core.Talk_Villager

#endregion