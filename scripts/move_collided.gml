var cell_next = oGame.map_update[argument0, argument1]; // temp var for destination cell contents
var cant_move = cell_next.solid;

if ( ((abilities & cell_next.vulnerabilities) == int_to_bin(item_type.kill)) or ((abilities & cell_next.vulnerabilities) ==  int_to_bin(item_type.smash)) )
{
    if(cell_next != id)
    {
        if (object_index == oPlayer)
        {
            //TODO: make these inputs into the movement function, so anything can make noise, shake on impact
            // TODO: just put this code in the tree code, make its dead value = oExit when < 10 trees AND oExit ! exist
            if ( (instance_number(oTree) < 40) and (cell_next.object_index == oTree) and (!instance_exists(oExit)) and ( (random(instance_number(oTree)) < 1) or (instance_number(oTree) == 1) ) )
            {
                oGame.map[argument0, argument1] = instance_create(argument0, argument1, oExit);
                oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1];
            }
            else
            {
                oGame.map[argument0, argument1] = instance_create(argument0, argument1, cell_next.dead);
                oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1];
            }
            if (cell_next.object_index == oTree)
            {
                oGame.smashed += 1;
            }
            if (global.debug == false)
            {
                oPlayer.smashes -= 1;
            }
            if (smashes <= 0)
            {
                abilities = abilities ^ int_to_bin(item_type.smash);
                colour = colour_init;
            }
        }
        else
        {
            oGame.map[argument0, argument1] = instance_create(argument0, argument1, cell_next.dead);
            oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1];
        }
        if (!audio_is_playing(cell_next.dead_sound))
        {
            audio_play_sound(cell_next.dead_sound, 1, false);
        }
        with (cell_next)
        {
            instance_destroy();
        }
    }
}

if (object_index == oPlayer)
{
    screen_shake(10);
    audio_play_sound(sndBump, 1, false);
}
