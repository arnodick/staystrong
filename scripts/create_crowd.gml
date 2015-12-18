//argument0[0] = string of attack creature to create
//argument0[1] = x pos of first zap
//argument0[2] = y pos of first zap
//argument0[3] = x pos of 2nd zap
//argument0[4] = y pos of 2nd zap
//...
//var spot = choose(-1, 0, 1);
//var target = oGame.map_creatures[x + spot, y];

//argument0 = x position/range
//argument1 = y position/range
//argument2 = string of creature to create
//argument3 = amount of creatures to create
//argument4 = true = random placement

for (i = 0; i < argument3; i++)
{
    var x_pos = x;
    var y_pos = y;
    var target = -1;
    if (argument4 == true)
    {
        x_pos = x + irandom_range(-argument0, argument0);
        y_pos = y + irandom_range(-argument1, argument1);
        target = oGame.map_creatures[x_pos, y_pos];
        while (target.object_index == oZap)
        {
            x_pos = x + irandom_range(-argument0, argument0);
            y_pos = y + irandom_range(-argument1, argument1);
            target = oGame.map_creatures[x_pos, y_pos];
        }
    }
    else
    {
        x_pos = x + argument0;
        y_pos = y + argument1;
        target = oGame.map_creatures[x_pos, y_pos];
        while (target.object_index == oZap)
        {
            x_pos = x + choose(-argument0, argument0);
            y_pos = y + choose(-argument1, argument1);
            target = oGame.map_creatures[x_pos, y_pos];
        }
    }
    
    with (target)
    {
        hp -= 2;
        do_dead(hp);
    }
    var creature = create_creature(x_pos, y_pos, argument2);
    with (creature)
    {
        //TODO: implement action noises for creatures, use that instead of dead_sound here
        audio_play_sound_at(dead_sound, x, y, 0, 1, 2, 0.5, false, 1);
    }
}

/*
for (var i = 1; i < argument_count; i++)
{
    var x_pos = argument[i];
    i++;
    var y_pos = argument[i];
    if (check_OOB(x_pos, y_pos, 1, 1, oGame.r_width - 2, oGame.r_height - 2) == -1)
    {
        var target = oGame.map_creatures[x_pos, y_pos];
        while (target.object_index == oZap)
        {
            x_pos = x + irandom_range(-2, 2); 
            y_pos = y + irandom_range(-2, 2);
            target = oGame.map_creatures[x_pos, y_pos];
        }
        
        //if (target.object_index != oZap)
        //{
            with (target)
            {
                hp -= 2;
                do_dead(hp);
            }
            var creature = create_creature(x_pos, y_pos, argument[0]);
            with (creature)
            {
                //TODO: implement action noises for creatures, use that instead of dead_sound here
                audio_play_sound_at(dead_sound, x, y, 0, 1, 2, 0.5, false, 1);
            }
        //}
        
    }
}
*/
