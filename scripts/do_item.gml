//lets creatures pick up smashes
//argument0 = the instance in the cell item is colliding with

var destroy = false;    //TODO: make HP do this instead
switch(item_type)
{
    case item_type.smash:
        with(instance_nearest(x, y, oCreature)) //could this instance_nearest cause problems?
        {
            if ((x == other.x) and (y == other.y))
            {
                if (object_index == oPlayer)
                {
                    smashes += 1;
                }
                abilities = abilities | int_to_bin(other.item_type);
                colour = global.item_colours[other.item_type];
                audio_play_sound(sndPickup, 1, false);  //TODO: make sound a variable of item
                destroy = true; 
            }
        }
        break;
    case item_type.blood:
        //makes creatures that step on it become bloody
        with (instance_nearest(x, y, oCreature))
        {
            if ( (x == other.x) and (y == other.y) )
            {
                if ( (abilities & int_to_bin(other.item_type)) !=  int_to_bin(other.item_type))
                {
                    other.amount -= 1;
                }
                abilities = abilities | int_to_bin(other.item_type);
                colour = global.item_colours[other.item_type];
            }
        }
        //makes adjacent tiles turn red randomly
        if random(100) < 1
        {
            oGame.map[x + choose(-1, 0, 1), y + choose(-1, 0, 1)].colour = global.item_colours[item_type];
        }
        //if blood has been picked up enough times, it disappears
        //unless the player is dead. then it never disappears
        if (amount <= 0)
        {
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
        }
        break;
}
if (destroy == true)
{
    instance_destroy();
}
