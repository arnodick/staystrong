//what to do when actor has collided with an object in destination cell
//agrument0 = x position of destination cell
//argument1 = y position of destination cell

var cell_next = oGame.map_update[x + argument0, y + argument1]; // temp var for destination cell contents
var cant_move = cell_next.solid;

if (object_index == oPlayer)
{
    screen_shake(10);
    audio_play_sound(sndBump, 1, false);
    //TODO: make these inputs into the movement function, so anything can make noise, shake on impact
    if ( (oPlayer.abilities & int_to_bin(item_type.smash)) == int_to_bin(item_type.smash) )
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
                oGame.map[argument0, argument1] = instance_create(argument0, argument1, cell_next.dead);
                oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1]; // BUG: this code makes the game crash when you kill yourself for some reason?
                //create_item(argument0, argument1, oItem, '~', c_red, oRoad, item_type.bloody);
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
                abilities = abilities ^ int_to_bin(item_type.smash);
                colour = colour_init;
            }
        }
    }
}
else    //if actor is enemy
{
    //if next cell is player then kill them
    if ( cell_next.object_index == oPlayer )
    {
        if global.debug == false
        {
            oGame.map[argument0, argument1] = instance_create(argument0, argument1, oPlayer.dead);
            oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1]; // TODO: this code makes the game crash when you kill yourself for some reason?
            audio_play_sound(oPlayer.dead_sound, 1, false);
            with (oPlayer)
            {
               instance_destroy();
            }
        }
    }
    //if next cell is solid and can smash, then smash next cell
    else if ( (abilities & int_to_bin(item_type.smash)) ==  int_to_bin(item_type.smash) )
    {
        // then if it is not a superwall, smash it
        if (cell_next.object_index != oSuperwall)
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

    //TODO: put this in movement code?
    if instance_exists(oPlayer)
    {
        if (point_distance(x, y, oPlayer.x, oPlayer.y) <= 6)
        {
            if ( irandom(20) <= 1 )
            {
                audio_play_sound_at(sndAlert, x, y, 0, 3, 6, 1, false, 1);
            }
        }
    }
}
