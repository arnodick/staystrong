//kills an object when it has 0 HP, creating its drop item, and exiting its event immediately
//argument0 = hp
//argument1 = string of object ot load from ini file

if (argument0 <= 0)
{
    var dropped = create_object(x, y, drop);
    if (!audio_is_playing(dead_sound))
    {
        //audio_play_sound(dead_sound, 1, false);
        sound = audio_play_sound_at(dead_sound, x, y, 0, 1, 2, 0.5, false, 1);
    }
    if (object_index == oPlayer)
    {
        //bit of a hack, but this should work.
        //TODO: get rid of this when switching to oGame running all the withs
        oGame.alarm[0] = room_speed * choose(7, 10, 12);
    }
    instance_destroy();
    exit;
}
