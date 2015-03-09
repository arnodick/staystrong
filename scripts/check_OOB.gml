//check to see if the object is out of bounds of the map
// if OOB, return # corresponding to side
// if still in bounds, return -1
// TODO: MAKE THIS ADAPT TO ACTUAL ROOM'S ACTUALY DIMENSIONS
var side = -1;
if argument0 < 1
{
    side = 0;               // left side
}
else if argument0 > (argument2)
{
    side = 1;               // right side
}
if argument1 < 1
{
    side = 2;               // top side
}
else if argument1 > (argument3)
{
    side = 3;               // bottom side
}
return side;