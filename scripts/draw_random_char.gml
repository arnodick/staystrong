with (oThing)
{
    char = char_rand[irandom(9)];
    if !audio_is_playing(sndCrash)
    {
        audio_play_sound(sndCrash, 10, false);
    }
}