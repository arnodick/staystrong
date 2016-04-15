//sets a direction randomly. returns an array with x and y direction
//argument0[0] = x direction
//argument0[1] = y direction

argument0[0] = 0;
argument0[1] = 0;

var dir = irandom(1); // sets the direction of us to 1 of 4 directions          

switch(dir) // sets the position to checked based on our direction
{
case 0:
    argument0[0] = -move_distance;
    break;
case 1:
    argument0[0] = move_distance;
    break;
case 2:
    argument0[1] = -move_distance;
    break;
case 1:
    argument0[1] = move_distance;
    break;
}

return argument0;
