with(oThing)                                                    // destroys all the oThings in the room except the player
{
    if (object_index != oPlayer)
    {
        instance_destroy();
    }
}

for (var a = 0; a < r_width; a++)                               // loops through each cell of the map array
{
    for (var b = 0; b < r_height; b++)
    {
        map_update[a, b] = 0;
        if          (a == 0 or a == r_width - 1 or b == 0 or b == r_height - 1)
        {
                    map[a, b] = instance_create(a, b, oSpace);
        }
        else if      (a == 1 or a == r_width - 2)
        {
            if (argument0 == 0 or argument0 == 1 or argument0 == -1)
            {
                map[a, b] = instance_create(a, b, oSpace);
            }
            else
            {
                map[a, b] = instance_create(a, b, oWall);
            }
        }
        else if     (b == 1 or b == r_height - 2)
        {
            if (argument0 == 2 or argument0 == 3 or argument0 == -1)
            {
                map[a, b] = instance_create(a, b, oSpace);
            }
            else
            {
                map[a, b] = instance_create(a, b, oWall);
            }
        }
        else                                                    // assigns proc objects to each cell
        {
            switch(room_count)                                      // specific actions for each room
            {
                case 0:                                             // room 0
                    if (a == r_width / 2 and b == r_height / 2)
                    {
                        //map[a, b].hp = 0;                         // figure out a way to make this properly destroy object at spot?
                        map[a, b] = instance_create(a, b, oSpace);  // puts a space where player will spawn
                                                                    // NOTE: old instance from this spot still, exists. will be destroyed when leaving room, but still could be cleaned up
                                                                    // NOTE: make this spot a proper variable, not a constant
                    }
                    if (a == 5 and b == 5)
                    {
                        map[a, b] = instance_create(a, b, oSpace);
                        // TODO: functions for creating terrain, to customize each piece, and remove create code from them
                        create_creature(a, b, oEnemy, '$', c_red, oBlood); // spawns NPC at middle of room
                    }
                    else
                    {
                        map[a, b] = instance_create(a, b, ground[irandom(2)]);
                    }
                    break;
                default:                                            // room 1
                    if (a == 5 and b == 5)
                    {
                        map[a, b] = instance_create(a, b, oSpace);
                        // TODO: functions for creating terrain, to customize each piece, and remove create code from them
                        create_creature(a, b, oEnemy, '$', c_red, oBlood);
                    }
                    else if (a == 8 and b == 3)
                    {
                        map[a, b] = instance_create(a, b, oSpace);
                        // TODO: functions for creating terrain, to customize each piece, and remove create code from them
                        create_creature(a, b, oEnemy, '$', c_red, oBlood);
                    }
                    else if (a == 9 and b == 2)
                    {
                        map[a, b] = instance_create(a, b, oSpace);
                        // TODO: functions for creating terrain, to customize each piece, and remove create code from them
                        create_creature(a, b, oEnemy, '$', c_red, oBlood);
                    }
                    else if (a == 5 and b == 7)
                    {
                        map[a, b] = instance_create(a, b, oSpace);
                        // TODO: functions for creating terrain, to customize each piece, and remove create code from them
                        create_creature(a, b, oEnemy, '$', c_red, oBlood);
                    }
                    else
                    {
                        map[a, b] = instance_create(a, b, wall[irandom(2)]);
                    }
                    break;
                    /*
                case 2:                                             // room 2
                    map[a, b] = instance_create(a, b, ground[irandom(2)]);
                    break;
                    
                default:                           
                    map[a, b] = instance_create(a, b, ground[irandom(2)]);
                    break;
                    */
            }
        }
        if (map_update[a, b] == 0)
        {
            map_update[a, b] = map[a, b];
        }
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
