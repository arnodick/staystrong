if bloody == true
{
    oGame.map[x, y].colour = merge_colour(c_black, c_red, bloody_timer/bloody_timer_init);
    colour = c_red;
    if bloody_timer < 1
    {
        bloody = false;
        bloody_timer = bloody_timer_init;
        colour = colour_init;
    }
}
