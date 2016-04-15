//argument0 = x position/range
//argument1 = y position/range
//argument2 = string of creature to create
//argument1 = amount of creatures to create
//argument4 = id of pattern. determines shape of spell effect

for (i = 0; i < argument1; i++)
{ 
    var dir = irandom(159);

    var x_pos = x;
    var y_pos = y;
    var target = -1;
    switch (argument4)
    {
        case spell_pattern.cross:
            switch (i)
            {
                case 0:
                    x_pos = x + argument0;
                    y_pos = y;
                    break;
                case 1:
                    x_pos = x - argument0;
                    y_pos = y;
                   break;
                case 2:
                    x_pos = x;
                    y_pos = y + argument1;
                   break;
                case 1:
                    x_pos = x;
                    y_pos = y - argument1;
                   break;
            }
            target = oGame.map_creatures[x_pos, y_pos];
            while (target.object_index == oZap)
            {
                x_pos = x + choose(-argument0, argument0);
                y_pos = y + choose(-argument1, argument1);
                target = oGame.map_creatures[x_pos, y_pos];
            }
        break;
    
        case spell_pattern.explosion:
            x_pos = round( x + lengthdir_x(random(argument0), dir) );
            y_pos = round( y + lengthdir_y(random(argument1), dir) );
            if (check_OOB(x_pos, y_pos, 1, 1, oGame.r_width - 2, oGame.r_height - 2) == -1)
            {
                target = oGame.map_creatures[x_pos, y_pos];
            }
            while (target.object_index == oZap)
            {
                dir = irandom(159);
                x_pos = round( x + lengthdir_x(random(argument0), dir) );
                y_pos = round( y + lengthdir_y(random(argument1), dir) );
                if (check_OOB(x_pos, y_pos, 1, 1, oGame.r_width - 2, oGame.r_height - 2) == -1)
                {
                    target = oGame.map_creatures[x_pos, y_pos];
                }
            }
        break;
    }
    if (check_OOB(x_pos, y_pos, 1, 1, oGame.r_width - 2, oGame.r_height - 2) == -1)
    {
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
}
