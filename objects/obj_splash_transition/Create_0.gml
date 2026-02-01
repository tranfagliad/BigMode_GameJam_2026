
fade_alpha = 1;   // Start with a black screen
fade_speed = 0.01;   
wait_time = 120;
timer = 0;

state = Transition.Fading_In;



target_room = noone;   // OVERRIDE THIS IN THE ROOM EDITOR



gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
