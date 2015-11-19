//(x, y, oObject, char, colour, oDead, move_type, abilities)

var creature = create_thing(argument0, argument1, argument2, argument3, argument4, argument5);

creature.solid = true;

move_init(creature, argument6);
creature.bloody_timer_init = 12;
creature.bloody_timer = creature.bloody_timer_init;

creature.dead_sound = sndDeath;
creature.abilities = argument7;

// todo: make this return the id of the instance
