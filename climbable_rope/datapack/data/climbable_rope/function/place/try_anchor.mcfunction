execute if block ~ ~-1 ~ minecraft:light run function climbable_rope:place/fail_no_space
execute if block ~ ~-1 ~ minecraft:light run return 0
execute unless block ~ ~-1 ~ #minecraft:replaceable run function climbable_rope:place/fail_no_space
execute unless block ~ ~-1 ~ #minecraft:replaceable run return 0

scoreboard players add #climbable_rope climbable_rope.col_seq 1
scoreboard players set #place climbable_rope.idx 0
execute positioned ~0.5 ~-0.5 ~0.5 run function climbable_rope:place/loop

execute if score #place climbable_rope.idx matches 0 run function climbable_rope:place/fail_no_blocks
execute if score #place climbable_rope.idx matches 0 run return 0
playsound minecraft:block.wool.place block @a ~0.5 ~-0.5 ~0.5 1 0.8
playsound minecraft:item.armor.equip_leather player @s ~ ~ ~ 0.6 1.2
