//sets a direction towards a target. returns an array with x and y direction
//argument0[0] = x direction
//argument0[1] = y direction

//TODO: take input of abilities and check destination
//if can kill it, return destination direction
//if can't, then check to in another direciton. if still can't move, return random direciton

/*
//otherwise, if you don't have smashes, move vertically? as long as you are not in the same vertical column as target
//ie: move around obstacles if you aren't already in line with target
else if (y_pos != obj_y)
{
    argument0[1] = y_dist / (abs(y_dist));
    //y_pos += y_dist / (abs(y_dist));
}

else if (x_pos != obj_x)
{
    argument0[0] = x_dist / (abs(x_dist));
    //x_pos += x_dist / (abs(x_dist));
}
*/

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
    
    //if target is vertically close, move left or right
    //TODO: this conditional is causing problems. have to get rid of it, either by using the direction
    //method (one vector output instead of array for direction) or do some clever math.
    //try clever math first. if that doesn't work, do whole direction vector thing with lengthdirs
    if ( abs(x_dist) > abs(y_dist) )
    {
        argument0[0] = x_dist / (abs(x_dist));
    }
    //if target is horizontally close, move up or down
    else if ( abs(y_dist) > abs(x_dist) )
    {
        argument0[1] = y_dist / (abs(y_dist));
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
    if (move_collision(x + argument0[0], y + argument0[1]))
    {
        move_dir = move_rand(move_dir);
        return move_dir;
    }
}
return argument0;
