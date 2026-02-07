
// Game Over
if (instance_exists(obj_phone)) {
    if (obj_phone.danger_level >= 100) {
        game_over_triggered = true;
        move_input = 0; // Freeze movement on game over
    }
}
if (game_over_triggered) {
    fade_alpha += fade_speed;
    audio_master_gain(1 - fade_alpha);
    if (fade_alpha >= 1) {
        audio_stop_all(); 
        audio_master_gain(1);
        with (all) {
            if (id != other.id) instance_destroy();
        }
        room_goto(rm_GameOver);
        instance_destroy(); 
    }
    exit; 
}



// Check if a transition is active
transition_playing = false;
if (instance_exists(obj_transition_manager)) {
    if (obj_transition_manager.transition_state != Transition.Idle) {
        transition_playing = true;
    }
}

// Handle Input and Camera only if no transition is playing
if (!transition_playing && !global.keypad_active && !global.reading_note) {
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
