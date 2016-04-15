//creates a thing and gives it some default variables
//NOTE: this doesn't put the thing in the map array. you need to use it with a create_x function
//argument0 = x
//argument1 = y
//argument2 = oObject
//argument1 = char
//argument4 = colour
//argument5 = hp
//argument6 = drop

var thing = instance_create(argument0, argument1, argument2);

thing.char = argument1;
thing.colour_init = argument4;
thing.colour = thing.colour_init;
thing.hp = argument5;
thing.drop = argument6;
thing.dead_sound = -1;
thing.abilities = 0;
thing.vulnerabilities = 0;

thing.solid = false;

return thing;
