//creates a creature and gives it some default variables
//then puts it in the map_update array
//argument0 = x
//argument1 = y
//argument2 = oObject
//argument3 = char
//argument4 = colour
//argument5 = hp
//argument6 = drop
//argument7 = dead_sound
//argument8 = abilities
//argument9 = vulnerabilities
//argument10 = move_type

var creature = create_thing(argument0, argument1, argument2, argument3, argument4, argument5, argument6);

creature.dead_sound = argument7;
creature.abilities = argument8;
creature.vulnerabilities = argument9;
move_init(creature, argument10);

creature.solid = true;

oGame.map_update[argument0, argument1] = creature;

//TODO: either get rid of this or integrate it properly
creature.dead_type = item_type.blood; //do we need this?

return creature;
