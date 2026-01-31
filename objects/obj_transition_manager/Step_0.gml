var _cam = view_camera[0];

switch (transition_state) {
    case Transition.Fading_Out:
    fade_alpha += fade_speed;
    zoom_level -= zoom_speed; 
    
    zoom_progress = fade_alpha; 

    var _new_w = base_w * zoom_level;
    var _new_h = base_h * zoom_level;
    camera_set_view_size(_cam, _new_w, _new_h);

    var _goal_x = zoom_anchor_x - (_new_w / 2);
    var _goal_y = zoom_anchor_y - (_new_h / 2);
    
    _goal_x = clamp(_goal_x, 0, room_width - _new_w);
    _goal_y = clamp(_goal_y, 0, room_height - _new_h);
    
    var _final_x = lerp(zoom_start_x, _goal_x, zoom_progress);
    var _final_y = lerp(zoom_start_y, _goal_y, zoom_progress);
    
    camera_set_view_pos(_cam, _final_x, _final_y);

    if (fade_alpha >= 1) {
        fade_alpha = 1;
        if (room_exists(target_room)) room_goto(target_room);
        transition_state = Transition.Fading_In;
    }
    break;
	
    case Transition.Fading_In:
        fade_alpha -= fade_speed;
        
        zoom_level = 1.0;
        camera_set_view_size(_cam, base_w, base_h);
        
        if (fade_alpha <= 0) {
            fade_alpha = 0;
            transition_state = Transition.Idle;
        }
        break;
}
