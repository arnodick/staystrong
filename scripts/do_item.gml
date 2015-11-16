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
                items = items | int_to_bin(other.item_type);
                colour = other.colour;
                audio_play_sound(sndPickup, 1, false);  //TODO: make sound a variable of item
                destroy = true; 
            }
        }
        break;
    case item_type.bloody:
        break;
}
if (destroy == true)
{
    instance_destroy();
}
