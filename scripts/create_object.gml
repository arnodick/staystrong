//creates an item and gives it some default variables
//then puts it in the map and map_update array
//argument0 = x
//argument1 = y
//argument2 = oObject
//argument3 = solid
//argument4 = char
//argument5 = colour
//argument6 = hp
//argument7 = drop
//argument8 = dead_sound
//argument9 = item type (same as abilities, except an int instead of binary)
//argument10 = vulnerabilities

var object = create_thing(argument0, argument1, argument2, argument4, argument5, argument6, argument7);

object.solid = argument3;

object.dead_sound = argument8;
object.item_type = argument9;
object.vulnerabilities = argument10;

oGame.map[argument0, argument1] = object;
oGame.map_update[argument0, argument1] = object;

return object;
