//initializes: counter that restricts movement, distance moved per step
//argument0 = actor to assign vars to
//argument1 = move_type

argument0.move_type = argument1;     //actor's type of movement
argument0.move_moving = true; //whether actor is moving this turn
argument0.move_target = -1;   //actor's movement target (if any)
argument0.move_distance = 1;  // how far it moves per step. could this be something other than 1, or just use timer?
argument0.move_dir[0] = 0;    //just arrays for hor and ver move direction
argument0.move_dir[1] = 0;

argument0.bloody_timer_init = 12;
argument0.bloody_timer = argument0.bloody_timer_init;
