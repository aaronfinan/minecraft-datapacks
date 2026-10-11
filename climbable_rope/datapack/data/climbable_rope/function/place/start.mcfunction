advancement revoke @s only climbable_rope:place_rope

# using_item fires every tick while right-click is held; only act on the first tick of a press.
execute if score @s climbable_rope.use_t matches 1.. run return run scoreboard players set @s climbable_rope.use_t 3
scoreboard players set @s climbable_rope.use_t 3

tag @s remove climbable_rope.hand_main
tag @s remove climbable_rope.hand_off
execute if predicate climbable_rope:is_rope_coil run tag @s add climbable_rope.hand_main
execute unless entity @s[tag=climbable_rope.hand_main] if predicate climbable_rope:is_rope_coil_offhand run tag @s add climbable_rope.hand_off

scoreboard players set @s climbable_rope.ray_steps 0
execute if entity @s[tag=climbable_rope.hand_main] anchored eyes positioned ^ ^ ^ anchored feet run function climbable_rope:place/raycast
execute if entity @s[tag=climbable_rope.hand_off] anchored eyes positioned ^ ^ ^ anchored feet run function climbable_rope:place/raycast

tag @s remove climbable_rope.hand_main
tag @s remove climbable_rope.hand_off
