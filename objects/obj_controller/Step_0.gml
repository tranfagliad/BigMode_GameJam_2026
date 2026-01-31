
transition_playing = false;

if (instance_exists(obj_transition_manager)) {
    if (obj_transition_manager.transition_state != Transition.Idle) {
        transition_playing = true;
    }
}


if (!transition_playing) {
    move_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
} else {
    move_input = 0;
}


target_x += move_input * camera_move_speed;
target_x = clamp(target_x, 0, room_width - 640);

current_x = camera_get_view_x(camera);
new_x = lerp(current_x, target_x, camera_smooth_factor);


if (!transition_playing) {
    camera_set_view_pos(camera, new_x, 0);
}
