//lets creatures pick up smashes
//argument0 = the instance in the cell you are colliding with
//if (argument0.object_index == oSmash)
var actor = id;
with(oItem)
{
    //if (instance_exists(oPlayer))
    //{
    if ((x == actor.x) and (y == actor.y))
    {
        oPlayer.items = oPlayer.items | item_type;
        oPlayer.smashes += 1;
        audio_play_sound(sndPickup, 1, false);
        instance_destroy();
    }
    //}
}
if ((argument0.object_index == oSmash) and (object_index != oPlayer))
{
    audio_play_sound(sndAlert, 1, false);
    colour = c_blue;
    with (argument0)
    {
        instance_destroy();
    }
}
