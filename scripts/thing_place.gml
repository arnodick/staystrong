//thing_place(cell to place instance, object to place)
var cell_selected = oGame.map[argument0.x, argument0.y];
var x_pos = cell_selected.x;
var y_pos = cell_selected.y;

oGame.map[x_pos, y_pos] = instance_create(x_pos, y_pos, argument1);
oGame.map_update[x_pos, y_pos] = oGame.map[x_pos, y_pos];
with (cell_selected)
{
    instance_destroy();
}