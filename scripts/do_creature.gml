//moves creatures around and checks if their abilities are to be used

move(move_moving, move_type, move_target);

if (abilities != 0)
{
    //if you are bloody, spread blood around
    if ( (abilities & int_to_bin(item_type.blood)) == int_to_bin(item_type.blood) )
    {
        var cell = oGame.map[x, y];
        var colour_blend_amount = (bloody_timer + 2)/bloody_timer_init;
        if (colour_blend_amount > 1)
        {
            colour_blend_amount = 1;
        }
        colour = global.item_colours[item_type.blood];
        cell.colour = merge_colour(c_black, global.item_colours[item_type.blood], colour_blend_amount);
        /*
        if (cell.char == " ")
        {
            cell.char = '.';
        }
        */
        //if a turn is happening, get less bloody
        if ( oGame.turn == true )
        {
            bloody_timer -= 1;
            if (bloody_timer < 1)
            {
                abilities = abilities ^ int_to_bin(item_type.blood);
                bloody_timer = choose(4, 11, 12);
                if (hp > 1)
                {
                    hp--;
                }
            }
        }
    }
    
    if ( (abilities & int_to_bin(item_type.wait)) == int_to_bin(item_type.wait) )
    {
        if (object_index == oEnemy)
        {
            if (oGame.turn == true)
            {
                if (irandom(10) < 1)
                {
                    zap = true;
                }
            }
        }
    }
    
    //sets actor's colour to the colour of highest value ability
    for (var a = 0; a < array_length_1d(global.item_colours); a++) //loop through abilities
    {
        if ( (abilities & int_to_bin(a)) == int_to_bin(a) ) //if you have an ability
        {
            colour = global.item_colours[a];    //your colour = that ability's colour
        }
    }
}
else
{
    colour = colour_init;   //if yuou have no abilities, set actor to default colour
}

if (zap == true)
{
    abilities = abilities ^ int_to_bin(item_type.wait);
    audio_play_sound_at(sndZap, x, y, 0, 1, 2, 0.5, false, 1);
    var target = oGame.map_update[x - 1, y];
    with (target)
    {
        hp -= 2;
        do_dead(hp);
    }
    create_creature(x - 1, y, "zap");
    
    target = oGame.map_update[x + 1, y];
    with (target)
    {
        hp -= 2;
        do_dead(hp);
    }
    create_creature(x + 1, y, "zap");
    
    target = oGame.map_update[x, y - 1];
    with (target)
    {
        hp -= 2;
        do_dead(hp);
    }
    create_creature(x, y - 1, "zap");
    
    target = oGame.map_update[x, y + 1];
    with (target)
    {
        hp -= 2;
        do_dead(hp);
    }
    create_creature(x, y + 1, "zap");

    zap = false;
}
