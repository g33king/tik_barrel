# created by Tikotap/g33king

function tik_barrel:barrel_placer

execute as @e[name=tikBarrel] run data modify entity @s ArmorItems[0].tag.item set from entity @s HandItems[0].id
execute as @e[name=tikBarrel] unless data entity @s HandItems[0].id run data modify entity @s ArmorItems[0].tag.item set value ""

execute as @e[name=tikBarrel] at @s store success score @s tikBarrelChange run data modify entity @s ArmorItems[0].tag.tik_barrel_change set from block ~ ~ ~ Items

execute as @e[scores={tikBarrelChange=1..}] at @s run data modify entity @s ArmorItems[0].tag.tik_barrel_processor set from block ~ ~ ~ Items
execute as @e[scores={tikBarrelChange=1..}] at @s run function tik_barrel:clear_items

execute as @e[name=tikBarrel] store success score @s tikBarrelHandEqu run data modify entity @s HandItems[1] set from entity @s HandItems[0]
execute as @e[scores={tikBarrelHandEqu=1..}] at @s run function tik_barrel:clear_items

execute as @e[name=tikBarrel] at @s unless block ~ ~ ~ minecraft:barrel run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:item_frame",Count:1b,tag:{display:{Name:'{"text":"filter"}'}}}}
execute as @e[name=tikBarrel] at @s unless block ~ ~ ~ minecraft:barrel run kill @s

scoreboard players set @e tikBarrelChange 0
scoreboard players set @e tikBarrelItemEqu 0
scoreboard players set @e tikBarrelHandEqu 0