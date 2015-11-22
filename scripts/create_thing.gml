//creates a thing and gives it some default variables
//NOTE: this doesn't put the thing in the map array. you need to use it with a create_x function
//argument0 = x
//argument1 = y
//argument2 = oObject
//argument3 = char
//argument4 = colour
//argument5 = hp
//argument6 = drop

var thing = instance_create(argument0, argument1, argument2);
//var spot = oGame.map[argument0, argument1];
//oGame.map[argument0, argument1] = instance_create(argument0, argument1, oSpace);
//oGame.map_update[argument0, argument1] = thing;

thing.char = argument3;
thing.colour_init = argument4;
thing.colour = thing.colour_init;
thing.hp = argument5;
thing.drop = argument6;
thing.dead_sound = -1;
thing.abilities = 0;
thing.vulnerabilities = 0;

thing.solid = false;

//thing.colour = merge_colour(argument4, c_black, y/oGame.r_height);

/* will not destroying existing entities cause problems?
with (spot)
{
    //instance_destroy();
}
*/
return thing;
