advancement revoke @s only climbable_rope:cut_rope
execute as @e[type=minecraft:interaction,tag=climbable_rope.segment,distance=..10] if data entity @s attack at @s run function climbable_rope:break/cut
