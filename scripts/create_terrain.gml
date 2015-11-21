//creates a terrain and gives it some default variables
//then puts it in the map and map_update array
//argument0 = x
//argument1 = y
//argument2 = oObject
//argument3 = char
//argument4 = colour
//argument5 = hp
//argument6 = drop
//argument7 = dead_sound
//argument8 = vulnerabilities

var terrain = create_thing(argument0, argument1, argument2, argument3, argument4, argument5, argument6);

terrain.dead_sound = argument7;
//abilities deafaulted to 0 in create_thing
terrain.vulnerabilities = argument8;

terrain.solid = true;

oGame.map[argument0, argument1] = terrain;
oGame.map_update[argument0, argument1] = terrain;

return terrain;
