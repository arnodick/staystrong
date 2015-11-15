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
    smash,
    bloody,
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
