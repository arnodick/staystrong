with(oThing)                                                    // destroys all the oThings in the room except the player
{
    if (object_index != oPlayer)
    {
        instance_destroy();
    }
}

var enemy_count = 2;
if (smashes > 0)
{
    enemy_count = irandom_range(3, 5);
}
if room_count == 0
{
    enemy_count = 1;
}
for (var i = 0; i < enemy_count; i++)
{
    for (var j = 0; j < 2; j++)
    {
        if (j == 0)
        {
            enemy_pos[i, j] = irandom_range(2, r_width - 3);
        }
        else if (j == 1)
        {
            enemy_pos[i, j] = irandom_range(2, r_height - 3);
        }
    }
}
var smashes_count = 0;
if smashes == 0
{
    smashes_count += (irandom(1) + 1);
}
if room_count mod 3 == 0
{
    smashes_count += (irandom(1) + 2);
}
if room_count mod 5 == 0
{
    smashes_count += (irandom(2) + 2);
}
for (var p = 0; p < smashes_count; p++)
{
    for (var t = 0; t < 2; t++)
    {
        if (t == 0)
        {
            smashes_pos[p, t] = irandom_range(2, r_width - 3);
        }
        else if (t == 1)
        {
            smashes_pos[p, t] = irandom_range(2, r_height - 3);
        }
    }
}

for (var a = 0; a < r_width; a++)                               // loops through each cell of the map array
{
    for (var b = 0; b < r_height; b++)
    {
        map_update[a, b] = 0;
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
        else                                                    // assigns proc objects to each cell
        {
            switch(room_count)                                      // specific actions for each room
            {
                case -1:
                    if      ( a == ( floor(r_width/2) - 2 ) )
                    {
                        map[a, b] =  instance_create(a, b, oSpace);
                    }
                    else if ( a == (floor(r_width/2) - 1) )
                    {
                        map[a, b] =  instance_create(a, b, oRoad);
                    }
                    else if ( a == (floor(r_width/2)    ) )
                    {
                        map[a, b] =  instance_create(a, b, oSpace);
                    }
                    else if ( b == ( floor(r_height/2) - 2 ) )
                    {
                        map[a, b] =  instance_create(a, b, oSpace);
                    }
                    else if ( b == (floor(r_height/2) - 1) )
                    {
                        map[a, b] =  instance_create(a, b, oRoad);
                    }
                    else if ( b == (floor(r_height/2)    ) )
                    {
                        map[a, b] =  instance_create(a, b, oSpace);
                    }
                    else if ( (a == 3 and b == 3) or (a == 3 and b == 4) or (a == 4 and b == 3) or (a == (r_width - 4) and b == (r_height - 4)) or (a == (r_width - 4) and b == (r_height - 5)) or (a == (r_width - 5) and b == (r_height - 4)) )
                    {
                        //map[a, b] = instance_create(a, b, oWall);
                        map[a, b] = room_generate_terrain(a, b, oWall, 'X', c_dkgray, oRubble);
                    }
                    else
                    {
                        map[a, b] = instance_create(a, b, ground[irandom(2)]);
                    }
                    if (a == enemy_pos[0, 0] and b == enemy_pos[0, 1])
                    {
                        create_creature(a, b, oEnemy, '$', c_maroon, oBlood);
                    }
                    break;
                case 0:                                             // room 0
                    if      ( a == ( floor(r_width/2) - 2 ) )
                    {
                        map[a, b] =  instance_create(a, b, oSpace);
                    }
                    else if ( a == (floor(r_width/2) - 1) )
                    {
                        map[a, b] =  instance_create(a, b, oRoad);
                    }
                    else if ( a == (floor(r_width/2)    ) )
                    {
                        map[a, b] =  instance_create(a, b, oSpace);
                    }
                    else if ( b == ( floor(r_height/2) - 2 ) )
                    {
                        map[a, b] =  instance_create(a, b, oSpace);
                    }
                    else if ( b == (floor(r_height/2) - 1) )
                    {
                        map[a, b] =  instance_create(a, b, oRoad);
                    }
                    else if ( b == (floor(r_height/2)    ) )
                    {
                        map[a, b] =  instance_create(a, b, oSpace);
                    }
                    else if ( (a == 3 and b == 3) or (a == 3 and b == 4) or (a == 4 and b == 3) or (a == (r_width - 4) and b == (r_height - 4)) or (a == (r_width - 4) and b == (r_height - 5)) or (a == (r_width - 5) and b == (r_height - 4)) )
                    {
                        //map[a, b] = instance_create(a, b, oWall);
                        map[a, b] = room_generate_terrain(a, b, oWall, 'I', c_dkgray, oRubble);
                    }
                    else
                    {
                        map[a, b] = instance_create(a, b, ground[irandom(2)]);
                    }

                    break;
                default:                                            // room 1
                    map[a, b] = instance_create(a, b, wall[irandom(2)]);
                    
                    break;
            }
            for(var k = 0; k < enemy_count; k++)
                    {
                        if (a == enemy_pos[k, 0] and b == enemy_pos[k, 1])
                        {
                            create_creature(a, b, oEnemy, '$', c_maroon, oBlood);
                        }
                    }
                    for(var q = 0; q < smashes_count; q++)
                    {
                        if (a == smashes_pos[q, 0] and b == smashes_pos[q, 1])
                        {
                            create_thing(a, b, oSmash, '!', c_blue, oRoad);
                        }
                    }
        }
        if (map_update[a, b] == 0)
        {
            map_update[a, b] = map[a, b];
        }
    }
}
if instance_exists(oTree)
{
    for (var v = 0; v < smashed; v += 1)
    {
        for (var z = 0; z < instance_number(oTree); z += 1)
        {
            tree[z] = instance_find(oTree, z);
        }
        var tree_rand = floor(random(instance_number(oTree))); // needed to do this bc it was finding old trees from past rooms that no longer exists. TODO: maybe just reinitialize tree[] every room?
        var temp_tree = tree[tree_rand];
        var tree_x = temp_tree.x, tree_y = temp_tree.y;
        map[tree_x, tree_y] = instance_create(tree_x, tree_y, oRubble);
        map_update[tree_x, tree_y] = map[tree_x, tree_y];
        //  BUG: this causes the game to crash when it randomly selects a tree that's already been destroyed
        with(tree[tree_rand])
        {
            instance_destroy();
        }
        tree[tree_rand] = map[tree_x, tree_y];
        
    }
}
generate = false;                                               // set generate to false, so room doesn't keep regenerating
room_count += 1;                                                // increment room count (this is 1 higher than actual CURRENT room?)
                                                                // NOTE: will have to figure out a way to DECREMENT this when returning to old room, once array saving is figured out
                                                                
//map_update = map;                                              // sets the display array to the map array, so that terrain is redrawn, instead of leaving paths of the player character's symbol
//TODO: here is where you can put in creatures!
//have list of possible objects
//  0 = nothing
//  1 = player
//  2 = npc etc.
// array init to 0
// put creatures in cell ie: [a,b] = npc
// loop through each cell
// if 0 then map_update[a,b] = map[a,b]
// else map_update[a,b] = instance_create npc (2)
