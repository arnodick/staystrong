for (var j = 0; j < global.gamepadCount; j += 1) //loops through each gamepad
{
    if gamepad_button_check_pressed(j, gp_start) or gamepad_button_check_pressed(j, gp_face1) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)
    {
        return true;
    }
}
return false;