//lets creatures pick up items

var picked_up = false;
var creature = instance_nearest(x, y, oCreature);

//gives ability of an item to the actor picking it up
with(creature)
{
    if ((x == other.x) and (y == other.y))  //if actor is on the item
    {
        if (other.item_type == item_type.blood) //if it is blood, only lower item's hp if actor is NOT bloody
        {
            if ( (abilities & int_to_bin(other.item_type)) !=  int_to_bin(other.item_type))
            {
                hp++;
                other.hp--;
                create_splash();
                var sound = choose(splat1, splat2, splat3, splat4, splat5);
                if (!audio_is_playing(sound))
                {
                    //sound = audio_play_sound(sound, 1, false);
                    sound = audio_play_sound_at(sound, x, y, 0, 1, 2, 1, false, 1);
                }
            }
        }
        else if (other.item_type != item_type.rubble)   //for non-blood items, just lower hp by 1
        {
            other.hp--;
            audio_play_sound(other.dead_sound, 1, false);
        }
        abilities = abilities | int_to_bin(other.item_type);    //gives actor item's ability
        colour = global.item_colours[other.item_type];  //changes actor's colour to item's colour
        picked_up = true;
    }
}

switch(item_type)
{
    case item_type.smash:
        if (picked_up == true)
        {
            if (creature.object_index == oPlayer)
            {
                oPlayer.smashes += 1;
            }
        }
        break;
    case item_type.blood:
        //makes adjacent tiles turn red randomly
        if random(100) < 1
        {
            oGame.map[x + choose(-1, 0, 1), y + choose(-1, 0, 1)].colour = global.item_colours[item_type];
        }
        //if blood has been picked up enough times, it disappears
        //unless the player is dead. then it never disappears
        if (hp <= 0)
        {
            if !(instance_exists(oPlayer))
            {
                hp = 1;
            }
        }
        break;
}

//make used up items disappear
if (hp <= 0)
{
    create_object(x, y, drop);
    instance_destroy();
    //NOTE: kind of hacky but easiest way to get rid of instance_create and dependance on oObjects
    oGame.map_update[x, y] = creature;
}
