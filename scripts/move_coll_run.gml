// TODO: pressing < and > together makes you run into yourself and die!
//      keep this in as suicide?

var cell_next = oGame.map_update[argument0, argument1];

if cell_next.solid == false
{
    if step_count < 5
    {
        step_count += 1;
    }
    oGame.map_update[x, y] = oGame.map[x, y];
    x = argument0;
    y = argument1;
    audio_sound_pitch(sndBloop, step_count);
    audio_play_sound(sndBloop, 1, false);
    //oGame.map_update[x, y] = global.player;
}
else
{
    screen_shake(oGame.shake_count_max_crash, 4*step_count);
    move_timer = true;
    move_timer_count = oGame.shake_count_max_crash;
    if step_count > 4
    {
        //audio_play_sound(sndCrash, 1, false);
        //oGame.map_update[argument0, argument1].hp = 0;
        var cell_hit = oGame.map_update[argument0, argument1]
        oGame.map[argument0, argument1] = instance_create(argument0, argument1, cell_hit.dead);
        oGame.map_update[argument0, argument1] = oGame.map[argument0, argument1]; // TODO: this code makes the game crash when you kill yourself for some reason?
        audio_play_sound(cell_hit.dead_sound, 1, false);
        with (cell_hit)
        {
            instance_destroy();
        }
    }
    audio_play_sound(sndBump, 1, false);
    step_count = 0;
}