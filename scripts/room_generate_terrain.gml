// takes 3 inputs, will randomly select 1 and output it
//argument0 = x
//argument1 = y
//argument2 = object to create
//argument3 = object's character to display
//argument4 = object's colour
//argument5 = type of thing made when object dies
// maybe make this variables input? or just 5 inputs?
var thing = instance_create(argument0, argument1, argument2);

map[argument0, argument1] = thing;
//map_update[argument0, argument1] = thing;
thing.char = argument3;
thing.colour_init = argument4;
thing.colour = argument4;//merge_colour(argument4, c_black, y/oGame.r_height);
thing.dead = argument5;
return thing;
