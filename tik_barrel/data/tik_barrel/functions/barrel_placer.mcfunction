# created by Tikotap/g33king

#Pose:{LeftArm:[-15f,135f,0f],RightArm:[345f,315f,0f]}

execute as @e[nbt={Item:{id:"minecraft:item_frame",Count:1b,tag:{display:{Name:'{"text":"filter"}'}}}}] at @s align xyz if block ~ ~-1 ~ minecraft:barrel run summon minecraft:armor_stand ~.5 ~-1 ~.5 {ShowArms:1b,CustomName:'"tikBarrel"',Invisible:1b,ArmorItems:[{id:"minecraft:structure_void",Count:1b},{},{},{}],Pose:{LeftArm:[-25f,135f,0f],RightArm:[335f,315f,0f]},NoGravity:1b}
execute as @e[nbt={Item:{id:"minecraft:item_frame",Count:1b,tag:{display:{Name:'{"text":"filter"}'}}}}] at @s align xyz if block ~ ~-1 ~ minecraft:barrel run kill @s