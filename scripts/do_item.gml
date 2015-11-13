//lets creatures pick up smashes
//argument0 = the instance in the cell you are colliding with

var destroy = false;    //TODO: make HP do this instead
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
if (destroy == true)
{
    instance_destroy();
}
