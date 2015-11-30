//determines what happens when an actor bumps into a solid object
//argument0[0] = x position being collided with
//argument0[1] = y position being collided with

var cell_next = oGame.map_update[argument0, argument1]; // temp var for destination cell contents
//var cant_move = cell_next.solid;

if ( (abilities & int_to_bin(item_type.bomb)) == int_to_bin(item_type.bomb) )
{
    if (cell_next.object_index == oEnemy)
    {
        abilities = abilities ^ int_to_bin(item_type.bomb);
        with (cell_next)
        {
            abilities = abilities | int_to_bin(item_type.bomb);
        }
    }
    /*
    if (cell_next.object_index == oEnemy)
    {
        abilities = abilities ^ int_to_bin(item_type.bomb);
        hp++;
        with (cell_next)
        {
            abilities = abilities | int_to_bin(item_type.bomb);
            //move_moving = false;
        }
        
    }
    */
}

//if actor can kill or smash, amd target is vulnerable to either, destroy target
else if ( ((abilities & cell_next.vulnerabilities) == int_to_bin(item_type.kill)) or ((abilities & cell_next.vulnerabilities) ==  int_to_bin(item_type.smash)) )
{
    if(cell_next != id) //don't kill yourself!
    {
        if (object_index == oPlayer)
        {
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
            //TODO: make these inputs into the movement function, so anything can make noise, shake on impact
            //TODO: just put this code in the tree code, make its dead value = oExit when < 10 trees AND oExit ! exist
            /*
            if ( (instance_number(oTree) < 40) and (cell_next.object_index == oTree) and (!instance_exists(oExit)) and ( (random(instance_number(oTree)) < 1) or (instance_number(oTree) == 1) ) )
            {
                oGame.map[argument0, argument1] = instance_create(argument0, argument1, oExit);
                oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1];
            }
            */
        }
        with (cell_next)
        {
            hp--; //kill or damage target
            do_dead(hp);
        }
    }
}

if (object_index == oPlayer)
{
    screen_shake(10);   //TODO: generalize shake, so different targets can shake
    audio_play_sound(sndBump, 1, false);
}
