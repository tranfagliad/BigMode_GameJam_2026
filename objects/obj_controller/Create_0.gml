//window_set_showborder(false);

camera = view_camera[0];
camera_move_speed = 5;
camera_smooth_factor = 0.1;

move_input = 0;
target_x = 0;
current_x = 0;
new_x = 0;

transition_playing = false;

room_camera_positions = {};


global.target_door_id = "";
global.phone_blocking_input = false;


// Keep track of which rooms we entered for the first time
global.sent_messages = {};
