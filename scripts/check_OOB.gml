//check to see if the object is out of bounds of the map
// if OOB, return # corresponding to side
// if still in bounds, return -1
// TODO: MAKE THIS ADAPT TO ACTUAL ROOM'S ACTUALY DIMENSIONS
//TODO: GIVE THIS LEFT AND TOP SIDE DIMENSION INPUTS
var side = -1;
if (argument0 < argument2)
{
    side = 0;               // left side
    if oGame.win == true
    {
        side = -2;
    }
}
else if ( argument0 > argument4 )
{
    side = 1;               // right side
    if oGame.win == true
    {
        side = -2;
    }
}
if (argument1 < argument3)
{
    side = 2;               // top side
    if oGame.win == true
    {
        side = -2;
    }
}
else if (argument1 > argument5)
{
    side = 3;               // bottom side
    if oGame.win == true
    {
        side = -2;
    }
}
return side;
