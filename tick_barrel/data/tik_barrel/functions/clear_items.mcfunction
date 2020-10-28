# created by Tikotap/g33king

execute store success score @s tikBarrelItemEqu run data modify entity @s ArmorItems[0].tag.item set from entity @s ArmorItems[0].tag.tik_barrel_processor[0].id
data modify entity @s ArmorItems[0].tag.item set from entity @s HandItems[0].id

execute as @s[scores={tikBarrelItemEqu=1..}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:structure_block",Count:1},Tags:[tikBarrelReplacer]}
execute as @s[scores={tikBarrelItemEqu=1..}] at @s run data modify entity @e[type=item,tag=tikBarrelReplacer,limit=1,distance=..3] Item set from entity @s ArmorItems[0].tag.tik_barrel_processor[0]
execute as @s[scores={tikBarrelItemEqu=1..}] at @s run tag @e remove tikBarrelReplacer

data modify entity @s[scores={tikBarrelItemEqu=0}] ArmorItems[0].tag.savedItems append from entity @s ArmorItems[0].tag.tik_barrel_processor[0]

scoreboard players set @e tikBarrelItemEqu 0
data remove entity @s ArmorItems[0].tag.tik_barrel_processor[0]
advancement revoke @a only tik_barrel:interacted_with_tik_barrel

execute unless data entity @s ArmorItems[0].tag.tik_barrel_processor[0] run data modify block ~ ~ ~ Items set from entity @s ArmorItems[0].tag.savedItems
execute unless data entity @s ArmorItems[0].tag.tik_barrel_processor[0] unless data entity @s ArmorItems[0].tag.savedItems run data merge block ~ ~ ~ {Items:[]}
execute unless data entity @s ArmorItems[0].tag.tik_barrel_processor[0] run data remove entity @s ArmorItems[0].tag.savedItems

execute if data entity @s ArmorItems[0].tag.tik_barrel_processor[0] run function tik_barrel:clear_items