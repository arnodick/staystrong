//basically just nmemonics so you don't have to remember 0 = key movement, 1 = rand, etc

//constants for move() input
enum move_type
{
    key,
    rand,
    obj
}

//constants for different item types
enum item_type
{
    kill,
    wait,
    smash,
    blood,
    invincible,
    bomb
}

global.item_char[item_type.kill] = 'K';
global.item_char[item_type.wait] = 'w';
global.item_char[item_type.smash] = '!';
global.item_char[item_type.blood] = '~';
//global.item_char[item_type.rubble] = ';';

//array of item colours, so they can be iterated through when determing actor's colour
global.item_colours[item_type.kill] = c_maroon;
global.item_colours[item_type.wait] = c_purple;
global.item_colours[item_type.smash] = c_blue;
global.item_colours[item_type.blood] = c_red;
global.item_colours[item_type.invincible] = c_yellow;
global.item_colours[item_type.bomb] = c_orange;
//global.item_colours[item_type.rubble] = make_colour_rgb(120, 75, 0);

//constants for attributes of the map
enum map_grid
{
    right_side,
    top_side,
    left_side,
    bottom_side,
    middle = -1,
    tile_size = 10
}
