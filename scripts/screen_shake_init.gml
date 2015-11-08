// screen shake settings
// YOU NEED THIS TO USE screen_shake functions!
shake_count_max_bump = 17;              // the amount of time to shake when WALKING into solid object
shake_count_max_crash = 60;             // the amount of time to shake when RUNNING into solid object 
//shake_count_max = shake_count_max_bump; // generic shake time maximum, in case nothing is set (NOTE: necessary?)
shake_count = 0;                        // the actual screen shake timer
shake_intensity = 0;                    // the range of distance the shake can move the screen drawing
shake = 0;                              // the actual amount of shake drawn on a specific step
shaking = false;                        // needs to be on for shaking to happen
