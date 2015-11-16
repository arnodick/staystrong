//move an actor to another place

oGame.map_update[x, y] = oGame.map[x, y];
x = argument0;
y = argument1;
//BUG: is line below causing crashes?
oGame.map_update[x, y] = id;    // NOW it updates the active cell with you, whether you moved or not

//TODO: just put this in the oGame code? or somewhere
if (bloody == true)
{
    bloody_timer -= 1;
}
