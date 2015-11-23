//kills an object when it has 0 HP, creating its drop item, and exiting its event immediately
//argument0 = oObject index to create
//argument1 = item_type to create. (input is usually dead_type)

if (hp <= 0)
{
    var drop = create_item(x, y, argument0, global.item_char[argument1], global.item_colours[argument1], 1, oRoad, sndPickup, argument1);
    if (!audio_is_playing(dead_sound))
    {
        audio_play_sound(dead_sound, 1, false);
    }
    instance_destroy();
    exit;
}
