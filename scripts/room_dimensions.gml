room_width = argument0;
room_height = argument1;

r_width = room_width / map.tile_size;   // the width/height of each room array is just the width/height of the actual room divided by the size of the cells
r_height = room_height / map.tile_size;

map_objects[r_width, r_height] = 0;         // the somewhat static map of the level
map_creatures[r_width, r_height] = 0;  // the array of instances that will actually be drawn (NOTE: should this be in a screen object at the end of the list?)

view_xview[0] = map.tile_size;
view_yview[0] = map.tile_size;
view_wview[0] = room_width - (map.tile_size * 2);
view_hview[0] = room_height - (map.tile_size * 2);
