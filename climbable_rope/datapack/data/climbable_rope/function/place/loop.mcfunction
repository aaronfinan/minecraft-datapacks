execute if score #place climbable_rope.idx matches 64.. run return 0
execute if block ~ ~ ~ minecraft:lava run return 0
execute if block ~ ~ ~ minecraft:light run return 0
execute unless block ~ ~ ~ #minecraft:replaceable run return 0
execute if entity @s[tag=climbable_rope.hand_main] unless predicate climbable_rope:is_rope_coil run return 0
execute if entity @s[tag=climbable_rope.hand_off] unless predicate climbable_rope:is_rope_coil_offhand run return 0

scoreboard players add #place climbable_rope.idx 1
execute if block ~ ~ ~ minecraft:water[level=0] run setblock ~ ~ ~ minecraft:light[level=0,waterlogged=true]
execute unless block ~ ~ ~ minecraft:light run setblock ~ ~ ~ minecraft:light[level=0]
execute positioned ~ ~-0.5 ~ summon minecraft:interaction run function climbable_rope:place/init_hitbox
execute summon minecraft:item_display run function climbable_rope:place/init_visual

execute if entity @s[tag=climbable_rope.hand_main] run item modify entity @s weapon.mainhand climbable_rope:consume_one
execute if entity @s[tag=climbable_rope.hand_off] run item modify entity @s weapon.offhand climbable_rope:consume_one

execute positioned ~ ~-1 ~ run function climbable_rope:place/loop
