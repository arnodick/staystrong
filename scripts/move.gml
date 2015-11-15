//function chooses a type of movement from input, then executes collision and relocation of instance
//argument0 = the type of movement
//argument1 = object to move towards, if applicable (if not, just put -1 or something)
//argument2 = you movin?

//TODO make this function take a variable amount of variables, so you only put a 2nd variable in when you are chasing an object
if (oGame.turn == true)
{
    if (argument2 == true)
    {
        switch(argument0)
        {
            case 0: // keyboard controls
                move_dir = move_key(move_dir);
                break;
            case 1: // random movement
                move_dir = move_rand(move_dir);
                break;
            case 2: // move towards object
                move_dir = move_object(move_dir, argument1);
                break;
        }
        move_collision(x + move_dir[0], y + move_dir[1]);
    }
}
