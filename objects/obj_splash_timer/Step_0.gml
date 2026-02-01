timer++;

// Trigger transition once time is up
if (timer >= wait_time && !triggered) {
    triggered = true;
    
    if (instance_exists(obj_transition_manager)) {
        with (obj_transition_manager) {
            target_room = other.target_room;
            transition_state = Transition.Fading_Out;
            
            // Reset zoom for splash screens to ensure the logo is visible
            zoom_level = 1.0;
            var _cam = view_camera[0];
            camera_set_view_size(_cam, base_w, base_h);
        }
    } else {
        // Fallback if manager is missing
        room_goto(target_room);
    }
}
