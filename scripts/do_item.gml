//lets creatures pick up smashes
//argument0 = the instance in the cell item is colliding with

//var destroy = false;    //TODO: make HP do this instead
var picked_up = false;
var creature = instance_nearest(x, y, oCreature);

with(creature)
{
    if ((x == other.x) and (y == other.y))
    {
        if (other.item_type == item_type.blood)
        {
            if ( (abilities & int_to_bin(other.item_type)) !=  int_to_bin(other.item_type))
            {
                other.amount -= 1;
            }
        }
        else
        {
            other.amount--;
        }
        abilities = abilities | int_to_bin(other.item_type);
        colour = global.item_colours[other.item_type];
        picked_up = true;
    }
}

switch(item_type)
{
    case item_type.smash:
        if (picked_up == true)
        {
            audio_play_sound(sndPickup, 1, false);  //TODO: make sound a variable of item
            //destroy = true; 
            if (creature.object_index == oPlayer)
            {
                oPlayer.smashes += 1;
            }
        }
        break;
    case item_type.blood:
        //makes creatures that step on it become bloody
        /*
        if (picked_up == true)
        {
            with (creature)
            {
                if ( (abilities & int_to_bin(other.item_type)) !=  int_to_bin(other.item_type))
                {
                    other.amount -= 1;
                }
            }
        }
        */
        //makes adjacent tiles turn red randomly
        if random(100) < 1
        {
            oGame.map[x + choose(-1, 0, 1), y + choose(-1, 0, 1)].colour = global.item_colours[item_type];
        }
        //if blood has been picked up enough times, it disappears
        //unless the player is dead. then it never disappears
        if (amount <= 0)
        {
            /*
            if instance_exists(oPlayer)
            {
                oGame.map[x, y] = instance_create(x, y, oRoad);
                //oGame.map_update[x, y] = oGame.map[x, y];
                instance_destroy();
            }
            else
            {
                amount = 1;
            }
            */
            if !(instance_exists(oPlayer))
            {
                amount = 1;
            }
        }
        break;
}

if (amount <= 0)
{
    //TODO: figure out why this is needed
    if (item_type == item_type.blood)
    {
        oGame.map[x, y] = instance_create(x, y, oRoad);
    }
    instance_destroy();
}
