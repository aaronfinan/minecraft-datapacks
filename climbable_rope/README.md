# Climbable Rope (Java Edition 26.3)

Deploy coiled rope from a ceiling and climb it like a ladder. Includes a **datapack** (gameplay) and a **resource pack** (rope visuals).

## Requirements

- Minecraft **Java Edition 26.3** (data pack format **121.0**, resource pack format **97.1**)
- Both the datapack and the resource pack enabled for your world

## Install

1. Copy `climbable_rope/datapack/` to `<world>/datapacks/climbable_rope/`.
2. Copy `climbable_rope/resourcepack/` to your resource packs folder (macOS: `~/Library/Application Support/minecraft/resourcepacks/ClimbableRope/`) and enable it. For a server, host a zip of it and set `resource-pack` in `server.properties`.
3. In game run `/reload` (or restart), then `/datapack list` and confirm `climbable_rope` is enabled.

## Crafting

Shaped, in any column of the crafting grid:

```
S
S
T
```

**S** = String, **T** = Stick. Gives **3 Rope Coils** (max stack 16).

## Usage

1. Hold **Rope Coil** in your main hand or offhand.
2. Look at the **underside** of a block within reach and right-click.
3. The rope unspools downward, one block per coil in the stack, up to 64. It stops at the first non-replaceable block, at lava, or when the stack runs out. Each placed block uses one coil.
4. Stand in the rope and hold **jump** to climb up, **sneak** to hold your position, or let go to slide down. Walking forward into it also climbs if there's a wall behind the rope.

Placement is refused (with an action bar message) if you're aiming at a wall instead of a ceiling, nothing is in reach, or there is no open space under the block.

## Cutting rope

- **Hit** (left-click) a segment to cut it. That segment and everything below it are removed; the part attached to the ceiling stays.
- Cutting the **top** segment removes the whole rope.
- Placing a block into a rope segment cuts it at that point too.
- Cut rope is **not** refunded.

## How it works

| Piece | Implementation |
|------|------|
| Rope Coil item | A `minecraft:lead` with `custom_data.climbable_rope.coil`, a `consumable` component (so right-click is detectable anywhere) and `item_model` pointing at the coil art |
| Right-click detection | `using_item` advancement → `place/start`; a 3-tick `use_t` score makes holding right-click act only once |
| Ceiling check | `place/raycast` steps 0.1 blocks from the eyes (4.5 block reach); `place/hit` only accepts the block if the ray entered it through its bottom face |
| Climbing | Each segment is an invisible `minecraft:light[level=0]` block, added to `#minecraft:climbable`. Light blocks are creative-only, so no survival block changes behaviour |
| Visuals | An `item_display` per segment showing the `climbable_rope:rope_segment` item model (a 4px-thick twisted rope). No vanilla textures are overridden |
| Hitbox | A thin `interaction` entity per segment; hitting it fires the `cut_rope` advancement → `break/attacked` |
| Segment tracking | The display and interaction entities carry `climbable_rope.col_id` (which rope) and `climbable_rope.seg_idx` (1 = top) |
| Cutting | `break/cut` removes every part of that rope with an index greater than or equal to the cut one. `tick` also cuts when a segment's light block has been replaced |

## Caveats

- Creative-mode light blocks become climbable too (they are invisible and unobtainable in survival).
- Without the resource pack, rope segments render as the missing-texture cube.
- Because the coil is a lead underneath, right-clicking a mob with it leashes the mob (and uses up one coil).

## Developer test item

```mcfunction
loot give @s loot climbable_rope:give_rope_coil
```

Gives a stack of 16 Rope Coils.
