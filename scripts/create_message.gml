//prints a message in a box
//argument0 = x pos
//argument1 = y pos
//argument2 = string to print
mess = instance_create(argument0, argument1, oMessage);
mess.message_string = argument2;

mess.message_length = string_length(mess.message_string);
mess.window_length = (mess.message_length * mess.font_size);
mess.window_left = mess.window_centre[0] - mess.window_length;
mess.window_right = mess.window_centre[0] + mess.window_length;
