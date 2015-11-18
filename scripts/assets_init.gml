//basically just nmemonics so you don't have to remember 0 = key movement, 1 = rand, etc

//constants for move() input
enum move_type
{
    key,
    rand,
    obj
}

//array of item colours, so they can be iterated through when determing actor's colour
global.item_colours[0] = c_blue;
global.item_colours[1] = c_maroon;
global.item_colours[2] = c_red;

//constants for different item types
enum item_type
{
    smash,
    kill,
    blood,
    wait,
    invincible
}

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
