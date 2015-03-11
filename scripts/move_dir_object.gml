// TODO: rename this to move_at_object? or just generalize to move_coord and input x, y instead of object
//move_halt(move_timer_max);  //conceptually comes after actual movement, but needs to be here bc of breaks in swithc below
var x_pos = x, y_pos = y;
if instance_exists(argument0)
{
    var nearest_object = instance_nearest(x, y, argument0), 
        obj_x = nearest_object.x, 
        obj_y = nearest_object.y, 
        x_dist = obj_x - x, 
        y_dist = obj_y - y;

    if ( abs(x_dist) > abs(y_dist) )
    {
        if move_collision_check(x_pos + x_dist / (abs(x_dist)), y_pos).solid == true
        {
            if move_collision_check(x_pos + x_dist / (abs(x_dist)), y_pos).object_index == oPlayer
            {
                oGame.map[x_pos + x_dist / (abs(x_dist)), y_pos] = instance_create(x_pos + x_dist / (abs(x_dist)), y_pos, oPlayer.dead);
                oGame.map_update[x_pos + x_dist / (abs(x_dist)), y_pos] = oGame.map[x_pos + x_dist / (abs(x_dist)), y_pos]; // TODO: this code makes the game crash when you kill yourself for some reason?
                audio_play_sound(oPlayer.dead_sound, 1, false);
                with (oPlayer)
                {
                   instance_destroy();
                }
            }
            else if (y_pos != obj_y)
            {
                y_pos += y_dist / (abs(y_dist));
            }
        }
        else
        {
            x_pos += x_dist / (abs(x_dist));
        }
    }
    else if ( abs(y_dist) > abs(x_dist) )
    {
        if move_collision_check(x_pos, y_pos + y_dist / (abs(y_dist))).solid == true
        {
            if move_collision_check(x_pos, y_pos + y_dist / (abs(y_dist))).object_index == oPlayer
            {
                oGame.map[x_pos, y_pos + y_dist / (abs(y_dist))] = instance_create(x_pos, y_pos + y_dist / (abs(y_dist)), oPlayer.dead);
                oGame.map_update[x_pos, y_pos + y_dist / (abs(y_dist))] = oGame.map[x_pos, y_pos + y_dist / (abs(y_dist))]; // TODO: this code makes the game crash when you kill yourself for some reason?
                audio_play_sound(oPlayer.dead_sound, 1, false);
                with (oPlayer)
                {
                   instance_destroy();
                }
            }
            else if (x_pos != obj_x)
            {
                x_pos += x_dist / (abs(x_dist));
            }
        }
        else
        {
            y_pos += y_dist / (abs(y_dist));
        }
    }
    else
    {
        if ( (irandom(1)) < 1 )
        {
            if (x_pos != obj_x)
            {
                x_pos += x_dist / (abs(x_dist));
            }
        }
        else
        {
            if (y_pos != obj_y)
            {
                y_pos += y_dist / (abs(y_dist));
            }
        }
    }
}

if move_collision(x_pos, y_pos) == true
{
    move_rand();
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
