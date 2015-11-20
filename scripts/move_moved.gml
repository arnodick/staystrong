//moves an actor to another place
//argument0[0] = x position to move to
//argument0[1] = y position to move to

if ( (check_OOB(argument0, argument1, oGame.r_width - 2, oGame.r_height - 2) == -1) or object_index == oPlayer)
{
    oGame.map_update[x, y] = oGame.map[x, y];
    x = argument0;
    y = argument1;
    //BUG: is line below causing crashes?
    oGame.map_update[x, y] = id;    // NOW it updates the active cell with you, whether you moved or not
}
