
transition_playing = false;

// Check if a transition is active
if (instance_exists(obj_transition_manager)) {
    if (obj_transition_manager.transition_state != Transition.Idle) {
        transition_playing = true;
    }
}

// Handle Input and Camera only if no transition is playing
if (!transition_playing) {
    move_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    
    target_x += move_input * camera_move_speed;
    target_x = clamp(target_x, 0, room_width / 2);

    current_x = camera_get_view_x(camera);
    new_x = lerp(current_x, target_x, camera_smooth_factor);
    
    camera_set_view_pos(camera, new_x, 0);
}
else {
    move_input = 0;
}
