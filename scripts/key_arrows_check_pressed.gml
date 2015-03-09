//if (keyboard_key == vk_left or keyboard_key == vk_right or keyboard_key == vk_up or keyboard_key == vk_down)
if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down))
{
    return true;
}
else
{
    return false;
}