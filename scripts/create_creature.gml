//creates a creature and gives it some default variables
//then puts it in the map_update array
//argument[0] = x
//argument[1] = y
//argument[2] = oObject or object string for ini input
//argument[3] = solid
//argument[4] = char
//argument[5] = colour
//argument[6] = hp
//argument[7] = drop
//argument[8] = dead_sound
//argument[9] = abilities
//argument[10] = vulnerabilities
//argument[11] = move_type

var creature = -1;

if (argument_count == 3)
{
    ini_open("creatures.ini");
    var object = ini_read_real(argument[2], 'object', 7);
    var solidity = ini_read_real(argument[2], 'solid', 0);
    var char1 = ini_read_string(argument[2], 'char1', 'D');
    var char2 = ini_read_string(argument[2], 'char2', char1);
    var char3 = ini_read_string(argument[2], 'char3', char1);
    var colour = ini_read_real(argument[2], 'colour', 0);
    var hp = ini_read_real(argument[2], 'hp', 1);
    var drop = ini_read_string(argument[2], 'drop', 'blood');
    var dead_sound = ini_read_real(argument[2], 'dead_sound', -1);
    var abilities = ini_read_real(argument[2], 'abilities', 0);
    if (abilities < 0)
    {
        abilities = 0;
    }
    else
    {
        abilities = int_to_bin(abilities);
    }
    var vulnerabilities = ini_read_real(argument[2], 'vulnerabilities', 0);
    var move_type = ini_read_real(argument[2], 'move_type', 1);
    ini_close();
    
    creature = create_thing(argument[0], argument[1], object, choose(char1, char2, char3), colour, hp, drop);
    
    creature.solid = solidity;
    creature.dead_sound = dead_sound;
    creature.abilities = abilities;
    creature.vulnerabilities = int_to_bin(vulnerabilities);
    move_init(creature, move_type);
    
    oGame.map_update[argument[0], argument[1]] = creature;
}
else
{
    creature = create_thing(argument[0], argument[1], argument[2], argument[4], argument[5], argument[6], argument[7]);
    
    creature.solid = argument[3];
    creature.dead_sound = argument[8];
    creature.abilities = argument[9];
    creature.vulnerabilities = argument[10];
    move_init(creature, argument[11]);
    
    oGame.map_update[argument[0], argument[1]] = creature;
}
return creature;
