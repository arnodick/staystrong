if (bloody == true)
{
    var cell = oGame.map[x, y];
    var colour_blend_amount = (bloody_timer + 2)/bloody_timer_init;
    if (colour_blend_amount > 1)
    {
        colour_blend_amount = 1;
    }
    colour = c_red;
    cell.colour = merge_colour(c_black, c_red, colour_blend_amount);
    if (cell.char == ' ')
    {
        cell.char = '.';
    }
    if bloody_timer < 1
    {
        bloody = false;
        bloody_timer = bloody_timer_init;
        //TODO: maybe just do this in do_creature?
        //if you have abilities, set your colour to the corresponding ability when not bloody any more
        colour = colour_init;   //otherwise, default colour
    }
}
