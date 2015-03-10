if (argument0 == oSmash)
{
    oGame.smashes += 1;
    audio_play_sound(sndPickup, 1, false);
    with (argument0)
    {
        instance_destroy();
    }
}
