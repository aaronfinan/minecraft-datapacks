scoreboard players remove @a[scores={climbable_rope.use_t=1..}] climbable_rope.use_t 1
execute as @e[type=minecraft:interaction,tag=climbable_rope.segment] at @s unless block ~ ~ ~ minecraft:light run function climbable_rope:break/cut
