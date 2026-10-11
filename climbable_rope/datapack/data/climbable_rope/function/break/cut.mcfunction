scoreboard players operation #cut climbable_rope.col_id = @s climbable_rope.col_id
scoreboard players operation #cut climbable_rope.seg_idx = @s climbable_rope.seg_idx

particle minecraft:block{block_state:"minecraft:hay_block"} ~ ~0.5 ~ 0.1 0.4 0.1 0 12
playsound minecraft:block.wool.break block @a ~ ~0.5 ~ 1 0.8

execute as @e[tag=climbable_rope.part] if score @s climbable_rope.col_id = #cut climbable_rope.col_id if score @s climbable_rope.seg_idx >= #cut climbable_rope.seg_idx at @s run function climbable_rope:break/remove_segment
