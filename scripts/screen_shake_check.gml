// checks if screen is set to shake. if so, sets shake values
// NOTE: THIS NEEDS screen_shake_draw IN THE GAME'S DRAW EVENT TO WORK
// NOTE: IGNORE ABOVE LINE. That function isn't working yet, but when it does, above line will be the case

// shake code, preprocessed before drawing, to avoid putting a load of calcs on the draw event
if shaking == true                          
{
    if shake_count > 0                      // if there is still time to screen shake, then shake away!
    {
                                            // NOTE: make shake decrement with time? divide it by shake_count/shake_count_max?
        shake = random(shake_intensity);    // assigns the actual shake value to a random number within a shake range.
        shake_count -= 1;                   // decrement shake count
    }
    else                                    // if we're out of shake time, stop shaking, reset shake values
    {
        shake = 0;                          // sets the shake offset back to 0, so screen doesn't get stuck drawing off to one side
        shaking = false;                    // turns of shaking, gets us out of this shake field
        shake_intensity = 0;                // sets shake intensity back to 0. this is reset to something above 0 by player.
        shake_count = shake_count_max_bump; // resets the shake timer to a generic max.
    }
}