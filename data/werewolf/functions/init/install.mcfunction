#> werewolf:init/install
#
# werewolf：
#
# @within function 


#region 内容


# ゲームモード変更
    data modify storage pctw:core GameMode set value Werewolf

# reloadを実行
    function werewolf:main/_reload

# 通知
    ## 全体
        ### 表示
            title @a times 10 70 20
            title @a title {"text":"\uE000","font":"pctw:fishing_title_rogo"}
            tellraw @a ["","\n"," ゲームモードを","\n","     『",{"text":"Werewolf(仮)","bold":true,"italic":true,"underlined":true,"color":"red"},"』","\n","                                 に設定しました！","\n"]
        ### 効果音
            execute as @a at @s run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 1.0
    ## スタッフ
        tellraw @a[tag=PCTW.Player.Staff] ["","\n",{"text":"  "},{"text":"・スタッフ","color":"gold"},"\n",{"text":"  "},{"selector":"@a[tag=PCTW.Player.Staff]"},"\n"]

#endregion