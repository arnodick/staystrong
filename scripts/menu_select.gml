//if left stick is pushed up, move selection up, and vice versa
for (var j = 0; j < global.gamepadCount; j += 1) //loops through each gamepad
{
    if gamepad_axis_value(j, gp_axislv) != 0 and lastturn[j] == 0 //if left stick is pushed vertically, and wasn't pushed last step, increment or decrement the menu selection
    {
        direction = point_direction( 0, 0, 0, gamepad_axis_value(j, gp_axislv) ); //gets only vertical direciton of left stick (is it bad the the oMenu has a direciton? could it fly out of bounds?)
        if direction < 180
        {
            selection -= 1; //if left stick pushed up, move selected button up
        }
        else
        {
            selection += 1; //if left stick pushed down, move selected buttond own
        }
        //makes sure the selection doesn't go out of bounds (is there a simpler way to do this?)
        if selection >= buttonamount
        {
            selection = 0;
        }
        else if selection < 0
        {
            selection = buttonamount - 1;
        }
        audio_play_sound(sndSelect, 1, false); //play the seleciton change noise
    }
    lastturn[j] = gamepad_axis_value(j, gp_axislv); // saves the position of the left stick this step, for use next step
}
if keyboard_check_pressed(vk_up)
{
    selection -= 1; //if left stick pushed up, move selected button up
    audio_play_sound(sndSelect, 1, false); //play the seleciton change noise
    //makes sure the selection doesn't go out of bounds (is there a simpler way to do this?)
    if selection >= buttonamount
    {
        selection = 0;
    }
    else if selection < 0
    {
        selection = buttonamount - 1;
    }
}
else if keyboard_check_pressed(vk_down)
{
    selection += 1; //if left stick pushed down, move selected buttond own
    audio_play_sound(sndSelect, 1, false); //play the seleciton change noise
    //makes sure the selection doesn't go out of bounds (is there a simpler way to do this?)
    if selection >= buttonamount
    {
        selection = 0;
    }
    else if selection < 0
    {
        selection = buttonamount - 1;
    }
}

//loops through all the buttons and checks if they are selected
for (var i = 0; i < buttonamount; i++)
{
    if selection == i
    {
        button_alpha[i] = selected_alpha; //if a button is selected, set it's alpha to opaque
    }
    else
    {
        button_alpha[i] = unselected_alpha; //if a button isn't selected, set it's alpha to almost transparent
    }
}
