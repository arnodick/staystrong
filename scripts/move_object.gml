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
    //TODO: this conditional is causing problems. have to get rid of it, either by using the direction
    //method (one vector output instead of array for direction) or do some clever math.
    //try clever math first. if that doesn't work, do whole direction vector thing with lengthdirs
    if ( abs(x_dist) > abs(y_dist) )
    {
        //if cell in horizontal dir towards target is solid
        if ( move_collision(x_pos + x_dist / (abs(x_dist)), y_pos) == true )
        {
            //and if that cell is also player
            if ( move_collision_check(x_pos + x_dist / (abs(x_dist)), y_pos).object_index == oPlayer )
            {
                if global.debug == false
                {
                    //then kill player
                    argument0[0] = x_dist / (abs(x_dist));
                }
            }
            //if cell in horizontal dir towards target is not player and you have smashes
            else if ( (abilities & int_to_bin(item_type.smash)) ==  int_to_bin(item_type.smash) )
            {
                argument0[0] = x_dist / (abs(x_dist));
            }
            //otherwise, if you don't have smashes, move vertically? as long as you are not in the same vertical column as target
            //ie: move around obstacles if you aren't already in line with target
            else if (y_pos != obj_y)
            {
                argument0[1] = y_dist / (abs(y_dist));
                if ( move_collision(x_pos + argument0[0], y_pos + argument0[1]) == true )
                {
                    argument0 = move_rand(argument0);
                }
            }
            else if ( move_collision(x_pos + argument0[0], y_pos + argument0[1]) == true )
            {
                argument0 = move_rand(argument0);
            }
            
        }
        //if next cell is not solid, just move horizontally
        else
        {
            argument0[0] = x_dist / (abs(x_dist));
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
                    //kill player
                    argument0[1] = y_dist / (abs(y_dist));
                }
            }
            else if ( (abilities & int_to_bin(item_type.smash)) ==  int_to_bin(item_type.smash) )
            {
                argument0[1] = y_dist / (abs(y_dist));
            }
            else if (x_pos != obj_x)
            {
                argument0[0] = x_dist / (abs(x_dist));
                if ( move_collision(x_pos + argument0[0], y_pos + argument0[1]) == true )
                {
                    argument0 = move_rand(argument0);
                }
            }
            else if ( move_collision(x_pos + argument0[0], y_pos + argument0[1]) == true )
            {
                argument0 = move_rand(argument0);
            }
        }
        else
        {
            argument0[1] = y_dist / (abs(y_dist));
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
    //TODO: put checks for solid and palyer here
    //if solid and can't smash or kill, go other direction
    //if still solid, go random
}

/*
if ( move_collision_check(x + argument0[0], y + argument0[1]).solid == true )
//if move_collision(x + argument0[0], y + argument0[1]) == true
{
    argument0 = move_rand(argument0);
}
else */ if instance_exists(oPlayer)
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
