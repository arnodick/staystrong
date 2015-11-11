//lets creatures pick up smashes
//argument0 = the instance in the cell you are colliding with

with(instance_nearest(x, y, oItem)) //could this instance_nearest cause problems?
{
    if ((x == other.x) and (y == other.y))
    {
        if (other.object_index == oPlayer)
        {
            other.smashes += 1;
        }
        other.items = other.items | int_to_bin(item_type);
        other.colour = colour;
        audio_play_sound(sndPickup, 1, false);
        instance_destroy();
    }
}
/*
if ((argument0.object_index == oSmash) and (object_index != oPlayer))
{
    audio_play_sound(sndAlert, 1, false);
    colour = c_blue;
    with (argument0)
    {
        instance_destroy();
    }
}
*/
