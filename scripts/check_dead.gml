//kills an object when it has 0 HP, creating its drop item, and exiting its event immediately
//argument0 = item_type to create. (input is usually dead_type)
if (hp <= 0)
{
    create_item(x, y, oBlood, global.item_char[argument0], global.item_colours[argument0], oRoad, argument0);
    if (!audio_is_playing(dead_sound))
    {
        audio_play_sound(dead_sound, 1, false);
    }
    instance_destroy();
    exit;
}
