room_width = argument0;
room_height = argument1;

r_width = room_width / tile_size;   // the width/height of each room array is just the width/height of the actual room divided by the size of the cells
r_height = room_height / tile_size;

map[r_width, r_height] = 0;         // the somewhat static map of the level
map_update[r_width, r_height] = 0;  // the array of instances that will actually be drawn (NOTE: should this be in a screen object at the end of the list?)

view_xview[0] = tile_size;
view_yview[0] = tile_size;
view_wview[0] = room_width - (tile_size * 2);
view_hview[0] = room_height - (tile_size * 2);
