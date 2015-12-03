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
    wand,
    smash,
    blood,
    invincible,
    bomb
}

//array of item colours, so they can be iterated through when determing actor's colour
global.item_colours[item_type.kill] = c_maroon;
global.item_colours[item_type.wand] = c_purple;
global.item_colours[item_type.smash] = c_blue;
global.item_colours[item_type.blood] = c_red;
global.item_colours[item_type.invincible] = c_yellow;
global.item_colours[item_type.bomb] = c_orange;
//global.item_colours[item_type.rubble] = make_colour_rgb(120, 75, 0);

//constants for attributes of the map
enum map
{
    right_side,
    top_side,
    left_side,
    bottom_side,
    middle = -1,
    tile_size = 10
}
