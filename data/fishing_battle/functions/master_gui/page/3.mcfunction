#> fishing_battle:master_gui/page/3
#
# fishing_battle
#
# @within function
#   fishing_battle:master_gui/function/main
#   fishing_battle:master_gui/function/1
#   fishing_battle:master_gui/function/3



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
        item replace entity @s container.10 with air

        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} run item replace entity @s container.11 with white_wool{display:{Name:'[{"text":"チーム戦 : ","color":"white","italic":false},{"text":"オフ","color":"gray","bold":true,"italic":false,"underlined":true}]'},PCTWItems:1b,PCTWMasterGUIButton:1b,FSBTMasterGUITeamOff:1b} 1
        execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} run item replace entity @s container.11 with red_wool{display:{Name:'[{"text":"チーム戦 : ","color":"white","italic":false},{"text":"オン","color":"yellow","bold":true,"italic":false,"underlined":true}]'},PCTWItems:1b,PCTWMasterGUIButton:1b,FSBTMasterGUITeamOn:1b} 1

        item replace entity @s container.12 with air
        item replace entity @s container.13 with blue_banner{display:{Name:'[{"text":"数 : ","color":"white","italic":false},{"text":"2チーム","color":"blue","bold":true,"italic":false,"underlined":true}]'},PCTWItems:1b,PCTWMasterGUIButton:1b,FSBTMasterGUITeamNum2:1b} 1
        item replace entity @s container.14 with yellow_banner{display:{Name:'[{"text":"数 : ","color":"white","italic":false},{"text":"3チーム","color":"yellow","bold":true,"italic":false,"underlined":true}]'},PCTWItems:1b,PCTWMasterGUIButton:1b,FSBTMasterGUITeamNum3:1b} 1
        item replace entity @s container.15 with lime_banner{display:{Name:'[{"text":"数 : ","color":"white","italic":false},{"text":"4チーム","color":"green","bold":true,"italic":false,"underlined":true}]'},PCTWItems:1b,PCTWMasterGUIButton:1b,FSBTMasterGUITeamNum4:1b} 1
        item replace entity @s container.16 with air
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
        item replace entity @s container.26 with book{display:{Name:'{"text":"戻る","color":"white","italic":false}'},PCTWItems:1b,PCTWMasterGUIButton:1b,FSBTMasterGUIBackToTop:1b} 1

#endregion