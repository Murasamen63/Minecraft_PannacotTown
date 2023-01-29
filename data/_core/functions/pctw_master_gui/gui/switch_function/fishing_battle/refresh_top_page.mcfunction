#> _core:pctw_master_gui/gui/switch_function/fishing_battle/refresh_top_page
#
# _core：MasterGUIのボタン「釣り大会/補充する」
#
# @within advancement _core:master_gui/fishing_battle/top/refresh_top_page



#region 内容

# GUI操作
    ## 効果音
        playsound ui.button.click voice @s ~ ~ ~ 1.0 1.0
    ## アイテム削除
        clear @s ender_eye{PCTWMasterGUIRefreshFSBTtop:1b}
    ## ページ更新
        function _core:pctw_master_gui/gui/pages/fishing_battle/top

# advancement削除
    advancement revoke @s only _core:master_gui/fishing_battle/top/refresh_top_page

#endregion