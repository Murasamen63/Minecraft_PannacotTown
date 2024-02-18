#> werewolf:master_gui/page/1
#
# fishing_battle : MasterGUIのページ1の内容を制御します
#
# @within function
#   _core.pctw:master_gui/main
#   _core.pctw:master_gui/function/1
#   werewolf:master_gui/function/1
#   werewolf:master_gui/function/2
#   werewolf:master_gui/function/3



#region 内容

# page
    ## 1行目
        item replace entity @s container.0 with air
        item replace entity @s container.1 with air
        item replace entity @s container.2 with air
        item replace entity @s container.3 with air
        item replace entity @s container.4 with air
        item replace entity @s container.5 with air
        item replace entity @s container.6 with air
        item replace entity @s container.7 with air
        item replace entity @s container.8 with air
    ## 2行目
        item replace entity @s container.9 with air
        item replace entity @s container.10 with nether_star{display:{Name:'{"text":"役職設定","color":"gold","bold":true,"italic":false}'},PCTWItems:1b,PCTWMasterGUIButton:1b,WWMasterGUIJobSet:1b} 1
        item replace entity @s container.11 with clock{display:{Name:'{"text":"制限時間設定","color":"gold","bold":true,"italic":false}'},PCTWItems:1b,PCTWMasterGUIButton:1b,WWMasterGUITimerSet:1b} 1
        item replace entity @s container.12 with air
        item replace entity @s container.13 with air
        item replace entity @s container.14 with air
        item replace entity @s container.15 with air
        item replace entity @s container.16 with command_block{display:{Name:'{"text":"ゲームスタート","color":"red","bold":true,"italic":false,"underlined":true}'},PCTWItems:1b,PCTWMasterGUIButton:1b,WWMasterGUIGameStart:1b} 1
        item replace entity @s container.17 with air
    ## 3行目
        item replace entity @s container.18 with air
        item replace entity @s container.19 with air
        item replace entity @s container.20 with air
        item replace entity @s container.21 with air
        item replace entity @s container.22 with air
        item replace entity @s container.23 with air
        item replace entity @s container.24 with air
        item replace entity @s container.25 with air
        item replace entity @s container.26 with book{display:{Name:'{"text":"ゲームモード選択に戻る","color":"white","italic":false}'},PCTWItems:1b,PCTWMasterGUIButton:1b,WWMasterGUIBackToGameSelect:1b} 1

#endregion