//sets a direciton based on key pressed. returns an array with x and y direction
//argument0[0] = x direction
//argument0[1] = y direction

argument0[0] = 0;
argument0[1] = 0;

//if (key_arrows_check_pressed() == true)
//{
    switch(keyboard_key)
    {
    case vk_left:
        argument0[0] = -move_distance;
        break;
    case vk_right:
        argument0[0] = move_distance;
        break;
    case vk_up:
        argument0[1] = -move_distance;
        break;
    case vk_down:
        argument0[1] = move_distance;
        break;
    }
//}
return argument0;

/*
if (key_arrows_check_pressed() == true)
{
    var x_pos = x, y_pos = y;
    
    switch(keyboard_key)
    {
    case vk_left:
        x_pos -= move_distance;
        break;
    case vk_right:
        x_pos += move_distance;
        break;
    case vk_up:
        y_pos -= move_distance;
        break;
    case vk_down:
        y_pos += move_distance;
        break;
    }
    move_collision(x_pos, y_pos);
}
oGame.map_creatures[x, y] = oPlayer;
*/

/*
//returns an array which is set by keyboard input
//the values returned are a move direction
//argument0 = move_dir array. [0] = hor, [1] = vert

var a = argument0;

if (key_arrows_check_pressed() == true)
{
    switch(keyboard_key)
    {
    case vk_left:
        a[0] = -move_distance;
        break;
    case vk_right:
        a[0] = move_distance;
        break;
    case vk_up:
        a[1] = -move_distance;
        break;
    case vk_down:
        a[1] = move_distance;
        break;
    }
}
return a;
*/
