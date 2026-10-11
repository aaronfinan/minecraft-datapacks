data merge entity @s {item:{id:"minecraft:lead",count:1,components:{"minecraft:item_model":"climbable_rope:rope_segment"}},item_display:"none",Tags:["climbable_rope.part","climbable_rope.visual"]}
scoreboard players operation @s climbable_rope.col_id = #climbable_rope climbable_rope.col_seq
scoreboard players operation @s climbable_rope.seg_idx = #place climbable_rope.idx
