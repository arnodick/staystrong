//Generates a new room
//argument0 = side of room used to exit (0=left, 1=right, 2=top, 3=bottom)
with(oThing)    // destroys all the oThings in the room except the player
{
    if (object_index != oPlayer)
    {
        instance_destroy();
    }
}
with (oSprite)
{
    instance_destroy();
}

//sets amount of enemies
var enemy_count = 2;    //default 2 enemies
if (instance_exists(oPlayer))
{
    if (oPlayer.smashes > 0)    //if you have smashes, 3 - 5 enemies
    {
        enemy_count = irandom_range(3, 5);
    }
}
if (oGame.last_room_smashes == 0)   // if you had no smashes last room, 5 enemies
{
    enemy_count = 5;
}
if (oGame.room_count == 0)  //first room, just 1 enemy
{
    enemy_count = 1;
}
if (oGame.room_count == -1) //title screen(?), no enemies
{
    enemy_count = 0;
}
//sets enemies' coordinates TODO: must be a cleaner way to do this
//i = enemy #, j = x and y coords
for (var i = 0; i < enemy_count; i++)
{
    for (var j = 0; j < 2; j++)
    {
        if (j == 0)
        {
            enemy_pos[i, j] = irandom_range(2, r_width - 3);    //set enemy's x coord
        }
        else if (j == 1)
        {
            enemy_pos[i, j] = irandom_range(2, r_height - 3);   //set enemy's y coord
        }
    }
}

//sets amount of smashes
var smashes_count = 0;  //default no smashes
if (instance_exists(oPlayer))
{
    oGame.last_room_smashes = oPlayer.smashes;  //set last room's smashes to amount of smashes player has now
    if (oPlayer.smashes == 0)
    {
        smashes_count += (irandom(1) + 1);  // if out of smashes, get 1 or 2 smashes min
    }
}
if ( (oGame.room_count mod 3) == 0) // if in room divisble by 3, extra 2 or 3 smashes spawn
{
    smashes_count += (irandom(1) + 2);
}
if ( (oGame.room_count mod 5) == 0 )    // if in room div by 5, extra 2 - 4 smashes
{
    smashes_count += (irandom(2) + 2);
}
if ( (argument0 == 0) or (argument0 == 1) ) //if in horizontal room, 0 - 3 extra smashes
{
    smashes_count += irandom(3);
    oGame.room_horizontal = true;
}
//set smash coordinates
// p = smash #, t = x or y coord
for (var p = 0; p < smashes_count; p++)
{
    for (var t = 0; t < 2; t++)
    {
        if (t == 0)
        {
            smashes_pos[p, t] = irandom_range(2, r_width - 3);  //set smash's x coord
        }
        else if (t == 1)
        {
            smashes_pos[p, t] = irandom_range(2, r_height - 3); //set smash's y coord
        }
    }
}


//while !(instance_exists(oPlayer))

// generates the map terrain, enemies and pickups, puts them in map and map_update arrays
// TODO: will have to reverse a and b
for (var a = 0; a < r_width; a++)   // loops through each cell of the map array
{
    for (var b = 0; b < r_height; b++)
    {
        map_update[a, b] = 0;
        // deal with edges of map first (exits, super walls, etc.)
        if          (a == 0 or a == r_width - 1 or b == 0 or b == r_height - 1)
        {
            room_generate_OOB_edges(argument0, a, b);
        }
        else if      (a == 1 or a == r_width - 2)
        {
            room_generate_LR_edges(argument0, a, b);
        }
        else if     (b == 1 or b == r_height - 2)
        {
            room_generate_TB_edges(argument0, a, b);
        }
        else    // assigns proc objects to each cell
        {
            switch(oGame.room_count)    // specific actions for each room
            {
                case -1:    //winner's room (makes green grass everywhere)
                    create_object(a, b, "grass_green");
                    break;
                case 0: //first room TODO: make this load from map
                    if      ( a == ( floor(r_width/2) - 2 ) )
                    {
                        create_object(a, b, "space");
                    }
                    else if ( a == (floor(r_width/2) - 1) )
                    {
                        create_object(a, b, "road");
                    }
                    else if ( a == (floor(r_width/2)    ) )
                    {
                        create_object(a, b, "space");
                    }
                    else if ( b == ( floor(r_height/2) - 2 ) )
                    {
                        create_object(a, b, "space");
                    }
                    else if ( b == (floor(r_height/2) - 1) )
                    {
                        create_object(a, b, "road");
                    }
                    else if ( b == (floor(r_height/2)    ) )
                    {
                        create_object(a, b, "space");
                    }
                    else if ( (a == 3 and b == 3) or (a == 3 and b == 4) or (a == 4 and b == 3) or (a == (r_width - 4) and b == (r_height - 4)) or (a == (r_width - 4) and b == (r_height - 5)) or (a == (r_width - 5) and b == (r_height - 4)) )
                    {
                        create_object( a, b, "pillar");
                    }
                    else
                    {
                        create_object( a, b, choose("road", "grass_green", "space") );
                    }
                    break;
                default:    //any other room, generate trees like normal
                    create_object(a, b, choose("road", "tree", "space") );
                    break;
            }
            //place smashes in room TODO: do i need arrays for this?
            for(var q = 0; q < smashes_count; q++)
            {
                if (a == smashes_pos[q, 0] and b == smashes_pos[q, 1])
                {
                    create_object( a, b, "smash");
                }
            }
            //place enemies in map TODO: do i need arrays for this?
            for(var k = 0; k < enemy_count; k++)
            {
                if (a == enemy_pos[k, 0] and b == enemy_pos[k, 1])
                {
                    create_creature(a, b, "fly");
                }
            }
        }
        // copy map cells to map_update cells if map_update cell is empty
        if (map_update[a, b] == 0)
        {
            map_update[a, b] = map[a, b];
        }
    }
}

if !(instance_exists(oPlayer))
{
    create_creature(r_width/2, r_height/2, "player");
}
else
{
    map_update[oPlayer.x, oPlayer.y] = oPlayer;
}

//convert random trees into rubble for each tree that has been smashed
if instance_exists(oTree)
{
    for (var v = 0; v < smashed; v += 1)    //loop through each smashed tree
    {
        //dumps each existing tree into an array
        for (var z = 0; z < instance_number(oTree); z += 1)
        {
            tree[z] = instance_find(oTree, z);
        }
        //grab a random tree's index
        var tree_rand = floor(random(instance_number(oTree))); // needed to do this bc it was finding old trees from past rooms that no longer exists. TODO: maybe just reinitialize tree[] every room?
        //put it into a temp var
        var temp_tree = tree[tree_rand];
        //get x and y coords of tree we're going to replace w rubble
        var tree_x = temp_tree.x, tree_y = temp_tree.y;
        //put rubble in tree's position on map + map_update
        map[tree_x, tree_y] = create_object(tree_x, tree_y, "rubble");
        map_update[tree_x, tree_y] = map[tree_x, tree_y];
        //destroy the tree that was replaced
        with(tree[tree_rand])   //  BUG: this causes the game to crash when it randomly selects a tree that's already been destroyed
        {
            instance_destroy();
        }
        //set the spot in the array that formerly held a tree to hold the new rubble? maybe in case this spot is selected, since the tree is now destroyed. stops crashes
        tree[tree_rand] = map[tree_x, tree_y];
        
    }
}

generate = false;   // set generate to false, so room doesn't keep regenerating

if (oGame.room_count == -1) //if in win room, set win to true TODO: do this somewhere else?
{
    oGame.win = true;
}

oGame.room_count += 1;  // increment room count (this is 1 higher than actual CURRENT room?)
// NOTE: will have to figure out a way to DECREMENT this when returning to old room, once array saving is figured out
