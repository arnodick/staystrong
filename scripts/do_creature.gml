move(move_type, move_target);

var cell_current = oGame.map[x, y];
//TODO: put all these into respective oObjects
if (cell_current.object_index == oGrass)
{
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
check_bloody();
