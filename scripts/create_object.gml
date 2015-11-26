//creates an item and gives it some default variables
//then puts it in the map and map_update array
//argument[0] = x
//argument[1] = y
//argument[2] = oObject or object string for ini input
//argument[3] = solid
//argument[4] = char
//argument[5] = colour
//argument[6] = hp
//argument[7] = drop
//argument[8] = dead_sound
//argument[9] = item type (same as abilities, except an int instead of binary)
//argument[10] = vulnerabilities

var object = -1;

if (argument_count == 3)
{
    ini_open("objects.ini");
    var object_type = ini_read_real(argument[2], 'object', 7);
    var solidity = ini_read_real(argument[2], 'solid', 0);
    var char1 = ini_read_string(argument[2], 'char1', 'D');
    var char2 = ini_read_string(argument[2], 'char2', char1);
    var char3 = ini_read_string(argument[2], 'char3', char1);
    var char4 = ini_read_string(argument[2], 'char4', char1);
    var char5 = ini_read_string(argument[2], 'char5', char1);
    var colour = ini_read_real(argument[2], 'colour', 0);
    var hp1 = ini_read_real(argument[2], 'hp1', 1);
    var hp2 = ini_read_real(argument[2], 'hp2', hp1);
    var hp3 = ini_read_real(argument[2], 'hp3', hp1);
    var drop1 = ini_read_string(argument[2], 'drop1', 'blood');
    var drop2 = ini_read_string(argument[2], 'drop2', drop1);
    var drop3 = ini_read_string(argument[2], 'drop3', drop1);
    var drop4 = ini_read_string(argument[2], 'drop4', drop1);
    var drop5 = ini_read_string(argument[2], 'drop5', drop1);
    var dead_sound1 = ini_read_real(argument[2], 'dead_sound1', -1);
    var dead_sound2 = ini_read_real(argument[2], 'dead_sound2', dead_sound1);
    var dead_sound3 = ini_read_real(argument[2], 'dead_sound3', dead_sound1);
    var dead_sound4 = ini_read_real(argument[2], 'dead_sound4', dead_sound1);
    var dead_sound5 = ini_read_real(argument[2], 'dead_sound5', dead_sound1);
    var item_type = ini_read_real(argument[2], 'item_type', 0);
    var vulnerabilities = ini_read_real(argument[2], 'vulnerabilities', 0);
    if (vulnerabilities == -1)
    {
        vulnerabilities = 0;
    }
    else
    {
        vulnerabilities = int_to_bin(vulnerabilities);
    }
    ini_close();
    
    object = create_thing(argument[0], argument[1], object_type, choose(char1, char2, char3, char4, char5), colour, choose(hp1, hp2, hp3), choose(drop1, drop2, drop3, drop4, drop5));
    
    object.solid = solidity;
    object.dead_sound = choose(dead_sound1, dead_sound2, dead_sound3, dead_sound4, dead_sound5);
    object.item_type = item_type;
    object.vulnerabilities = vulnerabilities;
    
    oGame.map[argument[0], argument[1]] = object;
    oGame.map_update[argument[0], argument[1]] = object;
}
else
{
    object = create_thing(argument[0], argument[1], argument[2], argument[4], argument[5], argument[6], argument[7]);
    
    object.solid = argument[3];
    object.dead_sound = argument[8];
    object.item_type = argument[9];
    object.vulnerabilities = argument[10];
    
    oGame.map[argument[0], argument[1]] = object;
    oGame.map_update[argument[0], argument[1]] = object;
}
return object;
