//function chooses a type of movement from input, then executes collision and relocation of instance
//argument0 = the type of movement
//argument1 = object to move towards, if applicable (if not, just put -1 or something)

//TODO make this function take a variable amount of variables, so you only put a 2nd variable in when you are chasing an object
if (oGame.turn == true)
{
    switch(argument0)
    {
        case 0: // keyboard controls
            move_dir = move_key(move_dir);
            move_collision(x + move_dir[0], y + move_dir[1]);
            oGame.map_update[x, y] = oPlayer;
            break;
        case 1: // random movement
            move_rand();
            break;
        case 2: // move towards object
            move_object(argument1);
            break;
    }
}
