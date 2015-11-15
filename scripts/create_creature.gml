// create_creature(x, y, oObject, char, colour, oDead, move_type)

var creature = create_thing(argument0, argument1, argument2, argument3, argument4, argument5);
creature.move_type = argument6;

creature.solid = true;

//creature.move_type = -1;
creature.move_moving = true;
creature.move_target = -1;
creature.move_distance = 1;
creature.move_dir[0] = 0;
creature.move_dir[1] = 0;

creature.bloody = false;
creature.bloody_timer_init = 12;
creature.bloody_timer = creature.bloody_timer_init;

creature.dead_sound = sndDeath;
creature.items = $0;


// todo: make this return the id of the instance
