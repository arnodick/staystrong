//clears a space on the map and creates the player there
//argument0 = x
//argument1 = y
//argument2 = oObject
//argument3 = char
//argument4 = colour
//argument5 = oDead
//TODO: MAKE THIS VARIABLE INPUT! so if you forget something doesn't freak out

var thing = instance_create(argument0, argument1, argument2);
var spot = map[argument0, argument1];
with (spot)
{
    instance_destroy();
}
map[argument0, argument1] = instance_create(argument0, argument1, oSpace);
map_update[argument0, argument1] = thing;
thing.char = argument3;
thing.colour_init = argument4;
thing.colour = merge_colour(argument4, c_black, y/oGame.r_height);
thing.dead = argument5;
return thing;
