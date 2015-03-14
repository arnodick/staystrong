// this script checks if the player is out of bounds of the map
// if they are, it transposes them to the other side of the screen and generates a new map
// NOTE: this function does not yet allow for transportation between diff sized rooms
//      if you leave the room on x axis, it doesn't change your y pos, so you can end up "off the grid" so to speak
if instance_exists(oPlayer)
{
    var side = check_OOB(oPlayer.x, oPlayer.y, r_width - 2, r_height - 2);
    switch(side)
    {
        case -2:
            generate = false;
            with(oThing)
            {
                instance_destroy();
            }
            room_goto(rEnd);
            break;
        case -1:                // not OOB, do nothing
        {
            //generate = false;
            break;
        }
        case 0:                 // exited left side
        {
            generate = true;
            oPlayer.x = r_width - 2;
            break;
        }
        case 1:                 // exited right side
        {
            generate = true;
            oPlayer.x = 1;
            break;
        }
        case 2:                 // exited top side
        {
            generate = true;
            oPlayer.y = r_height - 2;
            break;
        }
        case 3:                 // exited bottom side
        {
            generate = true;
            oPlayer.y = 1;
            break;
        }
    }
}

if generate == true
{
    room_generate(side);
}
