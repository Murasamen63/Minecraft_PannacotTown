#> _core:main/_reload
#
# core：初めに読み込むfunction
#
# @within tag/function minecraft:load

#region 宣言

#> Storage
# @public
    #define storage pctw:core
    #define storage pctw:fishing_battle/system
    #define storage pctw:fishing_battle/ranking

#> Entity Tag
# @public
    #define tag PCTW.AEC.AlwaysAlive
    #define tag PCTW.Player.Staff

#endregion



#region 内容

# PCTW.Temporaryのリセット
    scoreboard objectives remove PCTW.Temporary

# scoreboard作成
    ## Const
        scoreboard objectives add PCTW.Const dummy
    ## Temporary
        scoreboard objectives add PCTW.Temporary dummy
    ## CoaS
        scoreboard objectives add PCTW.Use.Coas used:carrot_on_a_stick
    ## WFoaS
        scoreboard objectives add PCTW.Use.WFoaS used:warped_fungus_on_a_stick

# scoreboard設定
    ## CoaS
        scoreboard players reset @a PCTW.Use.Coas
    ## WFoaS
        scoreboard players reset @a PCTW.Use.WFoaS


# storage作成
    ## core
        data modify storage pctw:core GameMode set value null
    ## fishing_battle
        execute unless data storage pctw:fishing_battle/ranking Ranking run data modify storage pctw:fishing_battle/ranking Ranking set value {1:{Name:null,Score:0},2:{Name:null,Score:0},3:{Name:null,Score:0}}
        data modify storage pctw:fishing_battle/system Timer set value 0


# function読み込み
    ## 定数
        function _core:const
    ## アンインストール
        ### 釣り大会
            function fishing_battle:init/uninstall

# アイテム削除
    ## temp_Setting
        clear @a written_book{PCTWTempSettingBook:1b}
    ## debug_pctw
        clear @a warped_fungus_on_a_stick{PCTWDebug_PCTW:1b}

# アイテム付与
    ## temp_Setting
        give @p written_book{pages:['["","===Setting===","\\n","\\n","・制限時間","\\n",{"text":"3分","bold":true,"underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 3600"}},"  ",{"text":"5分","bold":true,"underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 6000"}},"  ",{"text":"10分","bold":true,"underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 12000"}},"  ",{"text":"15分","bold":true,"underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 18000"}},"  ",{"text":"20分","bold":true,"underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameTimer 24000"}},"\\n","\\n"]','["","===Setting===","\\n","\\n","・ゲーム開始","\\n",{"text":"スタート","bold":true,"underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 1"}}]'],title:"Setting",author:Player,PCTWItems:1b,PCTWTempSettingBook:1b}


# 通知
    #tellraw @a 


# gamerule設定


#endregion