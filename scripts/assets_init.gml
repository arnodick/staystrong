//basically just nmemonics so you don't have to remember 0 = key movement, 1 = rand, etc

//constants for move() input
enum move_type
{
    key,
    rand,
    obj
}
//binary constants for different item types
enum item_type
{
    smash = 1,
    wait = 2,
    invincible = 4
}
