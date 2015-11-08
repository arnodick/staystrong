// draws characters offset by shake value
// NOTE: not used yet. need to work out temp var thing in draw even of oGame
// NOTE: YOU NEED THE screen_shake_check FUNCTION IN YOUR GAME'S STEP EVENT FOR THIS TO WORK
if shaking == true
{
    draw_text_colour ( a * tile_size - shake, b * tile_size, cell.char, cell.colour, cell.colour, cell.colour, cell.colour, 0.2);
                            // draws a faint double in the opposite direciton of the opaque characters
}
