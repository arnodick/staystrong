move(move_moving, move_type, move_target);

if (abilities != 0)
{
    for (var a = 0; a < 3; a++) //loop through abilities
    {
        if ( (abilities & int_to_bin(a)) == int_to_bin(a) ) //if you have an ability
        {
            colour = global.item_colours[a];    //your colour = that ability's colour
        }
    }
}
else
{
    colour = colour_init;   //otherwise, default colour
}

check_bloody();
