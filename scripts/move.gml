//function chooses a type of movement from input, then executes collision and relocation of instance
//argument0 = you movin?
//argument1 = the type of movement
//argument2 = object to move towards, if applicable (if not, just put -1 or something)

//TODO make this function take a variable amount of variables, so you only put a 2nd variable in when you are chasing an object
if (oGame.turn == true)
{
    if (argument0 == true)
    {
        switch(argument1)
        {
            case 0: // keyboard controls
                move_dir = move_key(move_dir);
                break;
            case 1: // random movement
                move_dir = move_rand(move_dir);
                break;
            case 2: // move towards object
                move_dir = move_object(move_dir, argument2);
                break;
        }
        var cant_move = move_collision(x + move_dir[0], y + move_dir[1]);
        if (cant_move == true)
        {
            move_collided(x + move_dir[0], y + move_dir[1]);
        }
        else
        {
            move_moved(x + move_dir[0], y + move_dir[1]);
        }
    }
}
