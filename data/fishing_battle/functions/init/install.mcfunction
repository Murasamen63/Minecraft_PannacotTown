#> fishing_battle:init/install
#
# fishing_battle：釣り大会の設定をインストールするfunction
#
# @within function _core.pctw:master_gui/content/function/1


#region 内容


# ゲームモード変更
    data modify storage pctw:core GameMode set value FishingBattle

# reloadを実行
    function fishing_battle:main/_reload


#endregion