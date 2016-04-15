//sets a direction towards a target. returns an array with x and y direction
//argument0[0] = x direction
//argument0[1] = y direction
//argument1 = target object type

argument0[0] = 0;
argument0[1] = 0;

var x_pos = x, y_pos = y;
if instance_exists(argument1)
{
    var nearest_object = instance_nearest(x, y, argument1), 
        obj_x = nearest_object.x, 
        obj_y = nearest_object.y, 
        x_dist = obj_x - x, 
        y_dist = obj_y - y;
    
    //if target is horizontally far, prepare to move horizontally
    if ( abs(x_dist) > abs(y_dist) )
    {
        argument0[0] = x_dist / (abs(x_dist));
    }
    //if target is vertically far, prepare to move vertically
    else if ( abs(y_dist) > abs(x_dist) )
    {
        argument0[1] = y_dist / (abs(y_dist));
    }
    //if x and y distance are equal, choose randomly which way to go, while still going towards enemy
    else
    {
        if ( (irandom(1)) < 1 )
        {
            if (x_pos != obj_x)
            {
                argument0[0] = x_dist / (abs(x_dist));
            }
        }
        else
        {
            if (y_pos != obj_y)
            {
                argument0[1] = y_dist / (abs(y_dist));
            }
        }
    }

    //if the destination chosen is solid
    if ( move_collision( x_pos + argument0[0], y_pos + argument0[1]) == true )
    {
        //and it can't be smashed/killed
        if ( (oGame.map_creatures[x_pos + argument0[0], y_pos + argument0[1]].object_index != oPlayer) and ((abilities & int_to_bin(item_type.smash)) !=  int_to_bin(item_type.smash)) )
        {
            //then if perfectly diagonal to target (ie: enemy is following player only 1 step behind) then move randomly
            //NOTE: this gives you the chance to escape from enemies that are "stuck" to you, by making them bump into walls when following 1 step behind you
            if (abs(x_dist) == abs(y_dist))
            {
                argument0 = move_rand(argument0);
            }
            //otherwise, if you should be moving hor, then move vert towards target
            else if (argument0[0] != 0)
            {
                if (y_pos != obj_y)
                {
                    argument0[0] = 0;
                    argument0[1] = y_dist / (abs(y_dist));
                }
            }
            //otherwise, if you should moving vert, then move hor towards target
            else
            {
                if (x_pos != obj_x)
                {
                    argument0[0] = x_dist / (abs(x_dist));;
                    argument0[1] = 0;
                }
            }
            //finally, if can't move hor or vert towards target, then just choose randomly
            if ( move_collision(x_pos + argument0[0], y_pos + argument0[1]) == true )
            {
                argument0 = move_rand(argument0);
            }
        }
    }
}
//if target doesn't exist, move randomly (this should never happen?)
else
{
    argument0 = move_rand(argument0);
}

//TODO: put this elsewhere
if instance_exists(oPlayer)
{
    if (point_distance(x, y, oPlayer.x, oPlayer.y) <= 6)
    {
        if ( irandom(20) <= 1 )
        {
            //audio_play_sound_at(sndAlert, x, y, 0, 1, 6, 1, false, 1);
            audio_play_sound_at(sndAlert, x, y, 0, 1, 2, 1, false, 1);
        }
    }
}

return argument0;
