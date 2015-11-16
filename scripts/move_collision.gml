//argument0 = x pos to check for collision
//argument1 = y pos to check for collision

//var cell_next = oGame.map_update[argument0, argument1]; // temp var for destination cell contents
//var cant_move = oGame.map_update[argument0, argument1].solid;

return oGame.map_update[argument0, argument1].solid;

/*
var cell_next = oGame.map_update[argument0, argument1]; // temp var for destination cell contents
var cant_move = cell_next.solid;

if (object_index == oPlayer)
{
    if (cant_move == false)
    {
        oGame.map_update[x, y] = oGame.map[x, y];
        x = argument0;
        y = argument1;
        
        //BUG: is line below causing crashes?
        oGame.map_update[x, y] = id;    // NOW it updates the active cell with you, whether you moved or not
    }
    else
    {
        screen_shake(10);
        audio_play_sound(sndBump, 1, false);
        //TODO: make these inputs into the movement function, so anything can make noise, shake on impact
        if ( (oPlayer.items & int_to_bin(item_type.smash)) == int_to_bin(item_type.smash) )
        {
            //var cell_next = oGame.map_update[argument0, argument1];
            if (cell_next.object_index != oSuperwall)
            {
                // TODO: just put this code in the tree code, make its dead value = oExit when < 10 trees AND oExit ! exist
                if ( (instance_number(oTree) < 40) and (cell_next.object_index == oTree) and (!instance_exists(oExit)) and ( (random(instance_number(oTree)) < 1) or (instance_number(oTree) == 1) ) )
                {
                    oGame.map[argument0, argument1] = instance_create(argument0, argument1, oExit);
                    oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1];
                }
                else
                {
                    //oGame.map[argument0, argument1] = instance_create(argument0, argument1, cell_next.dead);
                    //oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1]; // BUG: this code makes the game crash when you kill yourself for some reason?
                    create_item(argument0, argument1, oItem, '~', c_red, oRoad, item_type.bloody);
                    //TODO BUG: this code cause the game to crash when smashing trees if more than 40 trees because code below can't find cell_next any more. make all destroyed objects drop an item
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
                if (global.debug == false)
                {
                    oPlayer.smashes -= 1;
                }
                if (smashes <= 0)
                {
                    items = items ^ int_to_bin(item_type.smash);
                    colour = colour_init;
                }
            }
        }
    }

}
else
{
    if check_OOB(argument0, argument1, oGame.r_width - 2, oGame.r_height - 2) == -1
    {
        if cant_move == false // if destination cell is not solid, move into it
        {
            oGame.map_update[x, y] = oGame.map[x, y];   // swaps the current cell on the active grid for its sister in the terrain grid
            x = argument0;   // sets your position to the destination cell
            y = argument1;   // but we still haven't actually moved you into the active grid yet!!
        }
        oGame.map_update[x, y] = id;    // NOW it updates the active cell with you, whether you moved or not
    }
    
}

//TODO: just put this in the oGame code? or somewhere
if (bloody == true)
{
    bloody_timer -= 1;
}
return cant_move;
*/
