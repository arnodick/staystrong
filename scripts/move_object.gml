//sets a direction towards a target. returns an array with x and y direction
//argument0[0] = x direction
//argument0[1] = y direction

argument0[0] = 0;
argument0[1] = 0;

// TODO: rename this to move_at_object? or just generalize to move_coord and input x, y instead of object
var x_pos = x, y_pos = y;
if instance_exists(argument1)
{
    var nearest_object = instance_nearest(x, y, argument1), 
        obj_x = nearest_object.x, 
        obj_y = nearest_object.y, 
        x_dist = obj_x - x, 
        y_dist = obj_y - y;
    
    //if target is vertically close, move left or right
    if ( abs(x_dist) > abs(y_dist) )
    {
        var cell_next = oGame.map[x_pos + x_dist / (abs(x_dist)),  y_pos];
        //if cell in horizontal dir towards target is solid
        if ( move_collision_check(x_pos + x_dist / (abs(x_dist)), y_pos).solid == true )
        {
            //and if that cell is also player
            if ( move_collision_check(x_pos + x_dist / (abs(x_dist)), y_pos).object_index == oPlayer )
            {
                if global.debug == false
                {
                    //then kill player
                    oGame.map[x_pos + x_dist / (abs(x_dist)), y_pos] = instance_create(x_pos + x_dist / (abs(x_dist)), y_pos, oPlayer.dead);
                    oGame.map_update[x_pos + x_dist / (abs(x_dist)), y_pos] = oGame.map[x_pos + x_dist / (abs(x_dist)), y_pos]; // TODO: this code makes the game crash when you kill yourself for some reason?
                    audio_play_sound(oPlayer.dead_sound, 1, false);
                    with (oPlayer)
                    {
                       instance_destroy();
                    }
                }
            }
            //if cell in horizontal dir towards target is not player and you have smashes
            else if ( (items & int_to_bin(item_type.smash)) ==  int_to_bin(item_type.smash) )
            {
                // then if it is not a superwall, smash it
                if (cell_next.object_index != oSuperwall)
                {
                    oGame.map[x_pos + x_dist / (abs(x_dist)), y_pos] = instance_create(x_pos + x_dist / (abs(x_dist)), y_pos, cell_next.dead);
                    oGame.map_update[x_pos + x_dist / (abs(x_dist)), y_pos] = oGame.map[x_pos + x_dist / (abs(x_dist)), y_pos];
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
            //otherwise, if you don't have smashes, move vertically? as long as you are not in the same vertical row as target
            //ie: move around obstacles if you aren't already in line with target
            else if (y_pos != obj_y)
            {
                argument0[1] = y_dist / (abs(y_dist));
                //y_pos += y_dist / (abs(y_dist));
            }
        }
        //if next cell is not solid, just move horizontally
        else
        {
            argument0[0] = x_dist / (abs(x_dist));
            //x_pos += x_dist / (abs(x_dist));
        }
    }
    //if target is horizontally close, move up or down
    else if ( abs(y_dist) > abs(x_dist) )
    {
        if move_collision_check(x_pos, y_pos + y_dist / (abs(y_dist))).solid == true
        {
            if (move_collision_check(x_pos, y_pos + y_dist / (abs(y_dist))).object_index == oPlayer)
            {
                if global.debug == false
                {
                    oGame.map[x_pos, y_pos + y_dist / (abs(y_dist))] = instance_create(x_pos, y_pos + y_dist / (abs(y_dist)), oPlayer.dead);
                    oGame.map_update[x_pos, y_pos + y_dist / (abs(y_dist))] = oGame.map[x_pos, y_pos + y_dist / (abs(y_dist))]; // TODO: this code makes the game crash when you kill yourself for some reason?
                    audio_play_sound(oPlayer.dead_sound, 1, false);
                    with (oPlayer)
                    {
                       instance_destroy();
                    }
                }
            }
            else if (colour == c_blue)
            {
                var cell_next = oGame.map[x_pos, y_pos + y_dist / (abs(y_dist))];
                if (cell_next.object_index != oSuperwall)
                {
                    oGame.map[x_pos, y_pos + y_dist / (abs(y_dist))] = instance_create(x_pos, y_pos + y_dist / (abs(y_dist)), cell_next.dead);
                    oGame.map_update[x_pos, y_pos + y_dist / (abs(y_dist))] = oGame.map[x_pos, y_pos + y_dist / (abs(y_dist))];
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
            else if (x_pos != obj_x)
            {
                argument0[0] = x_dist / (abs(x_dist));
                //x_pos += x_dist / (abs(x_dist));
            }
        }
        else
        {
            argument0[1] = y_dist / (abs(y_dist));
            //y_pos += y_dist / (abs(y_dist));
        }
    }
    //if x and y distance are equal, choose randomly which way to go
    else
    {
        if ( (irandom(1)) < 1 )
        {
            if (x_pos != obj_x)
            {
                argument0[0] = x_dist / (abs(x_dist));
                //x_pos += x_dist / (abs(x_dist));
            }
        }
        else
        {
            if (y_pos != obj_y)
            {
                argument0[1] = y_dist / (abs(y_dist));
                //y_pos += y_dist / (abs(y_dist));
            }
        }
    }
}

if ( move_collision_check(x + argument0[0], y + argument0[1]).solid == true )
//if move_collision(x + argument0[0], y + argument0[1]) == true
{
    argument0 = move_rand(argument0);
}
else if instance_exists(oPlayer)
{
    if (point_distance(x, y, oPlayer.x, oPlayer.y) <= 6)
    {
        if ( irandom(20) <= 1 )
        {
            audio_play_sound_at(sndAlert, x, y, 0, 3, 6, 1, false, 1);
        }
    }
}

return argument0;
