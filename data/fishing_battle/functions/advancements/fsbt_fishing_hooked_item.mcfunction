#> fishing_battle:advancements/fsbt_fishing_hooked_item
#
# fishing_battle：専用の釣り竿でアイテムを釣った際のadvancementのリワードfunction
#
# @within advancement fishing_battle:fsbt_fishing_hooked_item



#region 内容

# scoreboard増加
scoreboard players add @s PCTW.FSBT.Fishing.Count 1

# advancement剥奪
advancement revoke @s only fishing_battle:fsbt_fishing_hooked_item

#endregion