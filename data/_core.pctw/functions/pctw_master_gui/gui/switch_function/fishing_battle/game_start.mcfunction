#> _core.pctw:pctw_master_gui/gui/switch_function/fishing_battle/game_start
#
# _core.pctw：MasterGUIのボタン「釣り大会/ゲームスタート」
#
# @within advancement _core.pctw:master_gui/fishing_battle/top/game_start



#region 内容

# 機能
    ## GameState変更
        scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 1

# GUI操作
    ## アイテム削除
        clear @s command_block{PCTWMasterGUIGameStartFSBT:1b}
    ## ページ更新
        function _core.pctw:pctw_master_gui/gui/pages/fishing_battle/top
    ## インベントリ削除
        function _core.pctw:pctw_master_gui/delete

# advancement削除
    advancement revoke @s only _core.pctw:master_gui/fishing_battle/top/game_start

#endregion