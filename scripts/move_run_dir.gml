if (key_arrows_check() == true)
{
    var x_pos = x, y_pos = y;
    
    if keyboard_check(vk_left)
    {
        x_pos -= move_distance;
    }
    else if keyboard_check(vk_right)
    {
        x_pos += move_distance;
    }
    if keyboard_check(vk_up)
    {
        y_pos -= move_distance;
    }
    else if keyboard_check(vk_down)
    {
        y_pos += move_distance;
    }
    move_run_start();
    move_coll_run(x_pos, y_pos);
}
else
{
    move_stop();
}