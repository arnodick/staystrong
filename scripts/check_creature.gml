var cell_current = oGame.map[x, y];

if (cell_current.object_index == oGrass)
{
    /*
    if (cell_current.char == '/')
    {
        audio_play_sound(sndSwish, 1, false);
        cell_current.char = '-';
    }
    */
    audio_play_sound(sndSwish, 1, false);
    oGame.map[x, y] = instance_create(x, y, oStamped);
    with (cell_current)
    {
        instance_destroy();
    }
    cell_current = oGame.map[x, y];
}
if (cell_current.object_index == oBlood)
{
    if bloody == false
    {
        cell_current.amount -= 1;
    }
    bloody = true;
}
bloody_check();
check_smash();
