move_halt(move_timer_max);  //conceptually comes after actual movement, but needs to be here bc of breaks in swithc below

var x_pos = x, y_pos = y, dir = irandom(4); // sets the direction of us to 1 of 4 directions
            // TODO: make this more direct, less variables            

switch(dir) // sets the position to checked based on our direction
{
case 0:
    x_pos = x - move_distance;
    break;
case 1:
    x_pos = x + move_distance;
    break;
case 2:
    y_pos = y - move_distance;
    break;
case 3:
    y_pos = y + move_distance;
    break;
}

move_collision(x_pos, y_pos);
