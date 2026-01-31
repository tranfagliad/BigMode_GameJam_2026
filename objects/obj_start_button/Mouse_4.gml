
with (obj_transition_manager) {
    if (transition_state == Transition.Idle) {
        target_room = destination;
        
        zoom_level = 1.0;
        zoom_speed = 0; 
        
        zoom_anchor_x = camera_get_view_x(view_camera[0]) + (base_w / 2);
        zoom_anchor_y = camera_get_view_y(view_camera[0]) + (base_h / 2);
        
        zoom_start_x = camera_get_view_x(view_camera[0]);
        zoom_start_y = camera_get_view_y(view_camera[0]);
        
        transition_state = Transition.Fading_Out;
    }
}
