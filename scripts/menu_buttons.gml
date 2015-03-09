//draws menu with top button at argument0's position, with each next button argument1's distance under last button
for (var j = 0; j < buttonamount; j += 1)
{
    draw_text_colour(room_width/2, argument0 + argument1*(j), button_text[j], argument2, argument2, argument2, argument2, button_alpha[j]);
}