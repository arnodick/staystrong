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
                //TODO: input abilites to move object to check if actor can smash or kill
                break;
        }
        var cant_move = move_collision(x + move_dir[0], y + move_dir[1]);
        
        //if can kill, then kill, otherwise set cant_move to false
        //TODO: have to implement abilities vs vulnerabilities for this
        if (cant_move == true)
        {
            move_collided(x + move_dir[0], y + move_dir[1]);
        }
        else
        {
            move_moved(x + move_dir[0], y + move_dir[1]);
        }
                
                //if can't kill move
                //TODO: put navigating around walls here
                /*
                else
                {
                    if (move_dir[0] != 0)
                    {
                        move_dir[0]  = 0;
                        move_dir[1]  = choose(-1, 1);
                    }
                    else
                    {
                        move_dir[1] = 0;
                        move_dir[0] = choose(-1, 1);
                    }
                    if (move_collision(x + move_dir[0], y + move_dir[1]) == false)
                    {
                        move_moved(x + move_dir[0], y + move_dir[1]);
                    }
                    else
                    {
                        move_moved(x + move_dir[0], y + move_dir[1]);
                    }
                }
                */
    }
}

