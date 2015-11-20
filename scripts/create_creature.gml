//(x, y, oObject, char, colour, oDead, move_type, abilities)

var creature = create_thing(argument0, argument1, argument2, argument3, argument4, argument5);

creature.hp = 1;
creature.solid = true;

move_init(creature, argument6);
creature.abilities = argument7;
creature.vulnerabilities = argument8;

creature.bloody_timer_init = 12;
creature.bloody_timer = creature.bloody_timer_init;

creature.dead_sound = sndDeath;
creature.dead_type = item_type.blood;

// todo: make this return the id of the instance
