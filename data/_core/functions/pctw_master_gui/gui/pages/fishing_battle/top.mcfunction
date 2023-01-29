#> _core:pctw_master_gui/gui/pages/fishing_battle/top
#
# _core：MasterGUIのページ「fishing_battle：トップ」
#
# @within function
#   _core:pctw_master_gui/gui/switch_function/select_gamemode/change_fsbt
#   _core:pctw_master_gui/gui/switch_function/fishing_battle/refresh_top_page
#   _core:pctw_master_gui/summon_master_gui



#region 内容

# インベントリ内容
    ## 1行目
        item replace entity @s enderchest.0 with air
        item replace entity @s enderchest.1 with air
        item replace entity @s enderchest.2 with air
        item replace entity @s enderchest.3 with air
        item replace entity @s enderchest.4 with air
        item replace entity @s enderchest.5 with air
        item replace entity @s enderchest.6 with air
        item replace entity @s enderchest.7 with air
        item replace entity @s enderchest.8 with air
    ## 2行目
        item replace entity @s enderchest.9 with air
        item replace entity @s enderchest.10 with air
        ### 制限時間設定
            item replace entity @s enderchest.11 with clock{display:{Name:'{"text":"制限時間（分）","italic":false}'},PCTWItems:1b,PCTWMasterGUISwitches:1b,PCTWMasterGUIGameTimerFSBTMinute:1b} 64
        ### 取り引き値段変更
            item replace entity @s enderchest.12 with emerald{display:{Name:'{"text":"取引値段","italic":false}'},PCTWItems:1b,PCTWMasterGUISwitches:1b,PCTWMasterGUIChangeSetTradePriceFSBTPage:1b} 1
        item replace entity @s enderchest.13 with air
        item replace entity @s enderchest.14 with air
        ### ゲームスタート
            item replace entity @s enderchest.15 with command_block{display:{Name:'{"text":"ゲームスタート","color":"aqua","italic":false}'},PCTWItems:1b,PCTWMasterGUISwitches:1b,PCTWMasterGUIGameStartFSBT:1b} 1
        item replace entity @s enderchest.16 with air
        item replace entity @s enderchest.17 with air
    ## 3行目
        item replace entity @s enderchest.18 with air
        item replace entity @s enderchest.19 with air
        item replace entity @s enderchest.20 with air
        item replace entity @s enderchest.21 with air
        item replace entity @s enderchest.22 with air
        item replace entity @s enderchest.23 with air
        item replace entity @s enderchest.24 with air
        item replace entity @s enderchest.25 with ender_eye{display:{Name:'{"text":"補充する","italic":false}'},PCTWItems:1b,PCTWMasterGUISwitches:1b,PCTWMasterGUIRefreshFSBTtop:1b} 1
        ### ゲームモード選択に戻る
            item replace entity @s enderchest.26 with oak_sign{display:{Name:'{"text":"ゲームモード選択に戻る","italic":false}',Lore:['{"text":" "}','[{"text":"現在のモード：『","color":"white","italic":false},{"text":"釣り大会","color":"aqua"},{"text":"』","color":"white","italic":false}]']},PCTWItems:1b,PCTWMasterGUISwitches:1b,PCTWMasterGUIBackToSelectGameMode:1b} 1

#endregion