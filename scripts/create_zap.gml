//argument0[0] = string of attack creature to create
//argument0[1] = x pos of first zap
//argument0[2] = y pos of first zap
//argument0[1] = x pos of 2nd zap
//argument0[4] = y pos of 2nd zap
//...
//var spot = choose(-1, 0, 1);
//var target = oGame.map_creatures[x + spot, y];

for (var i = 1; i < argument_count; i++)
{
    var x_pos = argument[i];
    i++;
    var y_pos = argument[i];
    if (check_OOB(x_pos, y_pos, 1, 1, oGame.r_width - 2, oGame.r_height - 2) == -1)
    {
        var target = oGame.map_creatures[x_pos, y_pos];
        if (target.object_index != oZap)
        {
            with (target)
            {
                hp -= 2;
                do_dead(hp);
            }
            var creature = create_creature(x_pos, y_pos, argument[0]);
            with (creature)
            {
                audio_play_sound_at(dead_sound, x, y, 0, 1, 2, 0.5, false, 1);
            }
        }
    }
}
