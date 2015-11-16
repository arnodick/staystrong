//(x, y, oObject, char, colour, oDead, move_type)

var creature = create_thing(argument0, argument1, argument2, argument3, argument4, argument5);

creature.solid = true;

move_init(creature, argument6);
check_bloody_init(creature);

creature.dead_sound = sndDeath;
creature.abilities = $0;


// todo: make this return the id of the instance
