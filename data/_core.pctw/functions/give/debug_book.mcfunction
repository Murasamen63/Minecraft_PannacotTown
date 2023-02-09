#> _core.pctw:give/debug_book
#
# _core.pctw：アイテムを付与「Debug Book」
#
# @private



#region 内容

# 企画別
    ## 釣り大会
        execute if data storage pctw:core {GameMode:FishingBattle} run function fishing_battle:give/debug_fsbt
    ## core
        execute if data storage pctw:core {GameMode:null} run give @p written_book{pages:['["","更新","\\n",{"text":"reload","bold":true,"underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/reload"}},"\\n","\\n","スタッフタグ付与","\\n",{"text":"付与","bold":true,"underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/execute as @a[sort=nearest,limit=2] at @s run tag @s add PCTW.Player.Staff"}}]'],title:"Debug_Core",author:System,PCTWItems:1b,PCTWDebugItems:1b,PCTWCoreDebugBook:1b}

# export https://www.minecraftjson.com/
    #{"jformat":8,"jobject":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"更新"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"\n"},{"bold":true,"italic":false,"underlined":true,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"run_command","click_event_value":"/reload","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"reload"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"\n"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"\n"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"スタッフタグ付与"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"\n"},{"bold":true,"italic":false,"underlined":true,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"run_command","click_event_value":"/execute as @a[sort=nearest,limit=2] at @s run tag @s add PCTW.Player.Staff","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"付与"}],"command":"/give @p written_book{pages:%s,title:\"Debug_Core\",author:System,PCTWItems:1b,PCTWDebugItems:1b,PCTWCoreDebugBook:1b}","jtemplate":"book"}

#endregion