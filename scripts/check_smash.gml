if ((argument0.object_index == oSmash) and (object_index == oPlayer))
{
    oGame.smashes += 2;
    audio_play_sound(sndPickup, 1, false);
    with (argument0)
    {
        instance_destroy();
    }
}
else if ((argument0.object_index == oSmash) and (object_index != oPlayer))
{
    audio_play_sound(sndAlert, 1, false);
    colour = c_blue;
    with (argument0)
    {
        instance_destroy();
    }
}
