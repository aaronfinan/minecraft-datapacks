# The ray entered through the bottom face only if its previous step was in the cell directly below.
tag @s remove climbable_rope.from_below
execute align xyz positioned ~0.5 ~-0.5 ~0.5 summon marker run tag @s add climbable_rope.probe
execute positioned ^ ^ ^-0.1 align xyz if entity @e[type=marker,tag=climbable_rope.probe,dx=0,dy=0,dz=0] run tag @s add climbable_rope.from_below
kill @e[type=marker,tag=climbable_rope.probe]

execute unless entity @s[tag=climbable_rope.from_below] run function climbable_rope:place/fail_not_ceiling
execute if entity @s[tag=climbable_rope.from_below] align xyz run function climbable_rope:place/try_anchor
tag @s remove climbable_rope.from_below
