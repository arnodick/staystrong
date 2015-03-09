//counts down the timer until it reaches zero, at which point you can move again
if move_timer_count > 0
{
    move_timer_count -= 1;
}
else
{
    move_timer = false;
    // put shift speed multipler here if shift is pressed! decrease move_timer_ma or it's equivalent
}