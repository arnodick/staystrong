var cell_next = oGame.map_update[argument0, argument1]; // temp var for destination cell contents
var cant_move = cell_next.solid;

if (object_index == oPlayer)
{
    if cant_move == false
    {
        check_smash(cell_next);
        oGame.map_update[x, y] = oGame.map[x, y];
        x = argument0;
        y = argument1;
    }
    else
    {
        screen_shake(oGame.shake_count_max_bump, 4);
        audio_play_sound(sndBump, 1, false);
        //TODO: make these inputs into the movement function, so anything can make noise, shake on impact
        move_timer = true;
        move_timer_count = oGame.shake_count_max_bump;
        step_count = 0;
        if oGame.smashes > 0
        {
            //var cell_next = oGame.map_update[argument0, argument1];
            if (cell_next.object_index != oSuperwall)
            {
                // TODO: just put this code in the tree code, make its dead value = oExit when < 10 trees AND oExit ! exist
                if ( (instance_number(oTree) < 20) and (cell_next.object_index == oTree) and (!instance_exists(oExit)) and ( (random(10) < 1) or (instance_number(oTree) == 1) ) )
                {
                    oGame.map[argument0, argument1] = instance_create(argument0, argument1, oExit);
                    oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1];
                }
                else
                {
                    oGame.map[argument0, argument1] = instance_create(argument0, argument1, cell_next.dead);
                    oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1]; // TODO: this code makes the game crash when you kill yourself for some reason?
                }
                if (!audio_is_playing(cell_next.dead_sound))
                {
                    audio_play_sound(cell_next.dead_sound, 1, false);
                }
                if (cell_next.object_index == oTree)
                {
                    oGame.smashed += 1;
                }
                with (cell_next)
                {
                    instance_destroy();
                }
                oGame.smashes -= 1;
            }
        }
    }
    oGame.turn = true;
}
else
{
    if check_OOB(argument0, argument1, oGame.r_width - 2, oGame.r_height - 2) == -1
    {
        if cant_move == false // if destination cell is not solid, move into it
        {
            check_smash(cell_next);
            oGame.map_update[x, y] = oGame.map[x, y];   // swaps the current cell on the active grid for its sister in the terrain grid
            x = argument0;   // sets your position to the destination cell
            y = argument1;   // but we still haven't actually moved you into the active grid yet!!
        }
        oGame.map_update[x, y] = id;    // NOW it updates the active cell with you, whether you moved or not
    }

}
if bloody == true
{
    bloody_timer -= 1;
}
return cant_move;
