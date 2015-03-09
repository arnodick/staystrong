// create_creature(x, y, oType, char, colour, oDead)
var creature = instance_create(argument0, argument1, argument2);
map_update[argument0, argument1] = creature;
creature.char = argument3;
creature.colour_init = argument4;
creature.colour = merge_colour(argument4, c_black, y/oGame.r_height);
creature.dead = argument5;

creature.solid = true;
creature.move_distance = 1;

// todo: make this return the id of the instance
