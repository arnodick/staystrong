//move an actor to another place

if ( (check_OOB(argument0, argument1, oGame.r_width - 2, oGame.r_height - 2) == -1) or object_index == oPlayer)
{
    oGame.map_update[x, y] = oGame.map[x, y];
    x = argument0;
    y = argument1;
    //BUG: is line below causing crashes?
    oGame.map_update[x, y] = id;    // NOW it updates the active cell with you, whether you moved or not
    
    //TODO: just put this in the oGame code? or somewhere
    if (bloody == true)
    {
        bloody_timer -= 1;
    }
}
