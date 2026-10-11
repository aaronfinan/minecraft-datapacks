scoreboard players add @s climbable_rope.ray_steps 1
execute if score @s climbable_rope.ray_steps matches 46.. run function climbable_rope:place/fail_no_target
execute if score @s climbable_rope.ray_steps matches 46.. run return 0
execute unless block ~ ~ ~ #minecraft:replaceable run function climbable_rope:place/hit
execute unless block ~ ~ ~ #minecraft:replaceable run return 0
execute positioned ^ ^ ^0.1 run function climbable_rope:place/raycast
