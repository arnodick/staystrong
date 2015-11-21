//creates an item and gives it some default variables
//then puts it in the map and map_update array
//argument0 = x
//argument1 = y
//argument2 = oObject
//argument3 = char
//argument4 = colour
//argument5 = hp
//argument6 = drop
//argument7 = dead_sound
//argument8 = item type (same as abilities)

var item = create_thing(argument0, argument1, argument2, argument3, argument4, argument5, argument6);

item.dead_sound = argument7;
item.item_type = argument8;
//vulnerabilities deafulted to 0 in create_thing

oGame.map[argument0, argument1] = item;
oGame.map_update[argument0, argument1] = item;

return item;
