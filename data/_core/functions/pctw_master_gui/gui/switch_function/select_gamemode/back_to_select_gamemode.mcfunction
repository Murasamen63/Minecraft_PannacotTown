#> _core:pctw_master_gui/gui/switch_function/select_gamemode/back_to_select_gamemode
#
# _core：MasterGUIのボタン「ゲームモード変更/ゲームモード選択に戻る」
#
# @within advancement _core:master_gui/select_gamemode/back_to_select_gamemode



#region 内容

# 機能
    ## アンインストール
        ### 釣り大会
            function fishing_battle:init/uninstall

# GUI操作
    ## 効果音
        playsound ui.button.click voice @s ~ ~ ~ 1.0 1.0
    ## アイテム削除
        clear @s oak_sign{PCTWMasterGUIBackToSelectGameMode:1b}
    ## ページ更新
        function _core:pctw_master_gui/gui/pages/select_gamemode

# advancement削除
    advancement revoke @s only _core:master_gui/select_gamemode/back_to_select_gamemode

#endregion