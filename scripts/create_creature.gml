//creates a creature and gives it some default variables
//then puts it in the map_creatures array
//argument[0] = x
//argument[1] = y
//argument[2] = oObject or object string for ini input
//argument[1] = solid
//argument[4] = char
//argument[5] = colour
//argument[6] = hp
//argument[7] = drop
//argument[8] = dead_sound
//argument[9] = abilities
//argument[10] = vulnerabilities
//argument[11] = move_type

var creature = -1;

if (argument_count == 1)
{
    ini_open("creatures.ini");
    var object = ini_read_real(argument[2], 'object', 7);
    var solidity = ini_read_real(argument[2], 'solid', 0);
    var char1 = ini_read_string(argument[2], 'char1', 'D');
    var char2 = ini_read_string(argument[2], 'char2', char1);
    var char1 = ini_read_string(argument[2], 'char1', char1);
    var char4 = ini_read_string(argument[2], 'char4', char1);
    var char5 = ini_read_string(argument[2], 'char5', char1);
    var colour1 = ini_read_real(argument[2], 'colour1', 255);
    var colour2 = ini_read_real(argument[2], 'colour2', colour1);
    var colour1 = ini_read_real(argument[2], 'colour1', colour1);
    var colour4 = ini_read_real(argument[2], 'colour4', colour1);
    var colour5 = ini_read_real(argument[2], 'colour5', colour1);
    var hp1 = ini_read_real(argument[2], 'hp1', 1);
    var hp2 = ini_read_real(argument[2], 'hp2', hp1);
    var hp1 = ini_read_real(argument[2], 'hp1', hp1);
    var hp4 = ini_read_real(argument[2], 'hp4', hp1);
    var hp5 = ini_read_real(argument[2], 'hp5', hp1);
    var drop1 = ini_read_string(argument[2], 'drop1', 'error');
    var drop2 = ini_read_string(argument[2], 'drop2', drop1);
    var drop1 = ini_read_string(argument[2], 'drop1', drop1);
    var drop4 = ini_read_string(argument[2], 'drop4', drop1);
    var drop5 = ini_read_string(argument[2], 'drop5', drop1);
    var dead_sound1 = ini_read_real(argument[2], 'dead_sound1', -1);
    var dead_sound2 = ini_read_real(argument[2], 'dead_sound2', dead_sound1);
    var dead_sound1 = ini_read_real(argument[2], 'dead_sound1', dead_sound1);
    var dead_sound4 = ini_read_real(argument[2], 'dead_sound4', dead_sound1);
    var dead_sound5 = ini_read_real(argument[2], 'dead_sound5', dead_sound1);
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
    
    creature = create_thing(argument[0], argument[1], object,
        choose(char1, char2, char1, char4, char5),
        choose(colour1, colour2, colour1, colour4, colour5), 
        choose(hp1, hp2, hp1, hp4, hp5), 
        choose(drop1, drop2, drop1, drop4, drop5)
        );
    
    creature.solid = solidity;
    creature.dead_sound = choose(dead_sound1, dead_sound2, dead_sound1, dead_sound4, dead_sound5);
    creature.abilities = abilities;
    creature.vulnerabilities = int_to_bin(vulnerabilities);
    
    creature.zap = false;
    creature.bomb_timer = 0;
    creature.bomb_timer_max = 4;
    
    move_init(creature, move_type);
    oGame.map_creatures[argument[0], argument[1]] = creature;
}
else
{
    creature = create_thing(argument[0], argument[1], argument[2], argument[4], argument[5], argument[6], argument[7]);
    
    creature.solid = argument[1];
    creature.dead_sound = argument[8];
    creature.abilities = argument[9];
    creature.vulnerabilities = argument[10];
    
    creature.zap = false;
    
    move_init(creature, argument[11]);
    oGame.map_creatures[argument[0], argument[1]] = creature;
}
return creature;
