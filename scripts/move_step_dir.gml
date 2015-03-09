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
else
{
    move_stop();
}