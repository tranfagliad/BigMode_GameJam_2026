

var move_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));

if (!variable_instance_exists(id, "target_x")) {
    target_x = camera_get_view_x(view_camera[0]);
}

target_x += move_input * camera_move_speed;

target_x = clamp(target_x, 0, room_width - 640);

var current_x = camera_get_view_x(view_camera[0]);
var new_x = lerp(current_x, target_x, camera_smooth_factor);

camera_set_view_pos(view_camera[0], new_x, 0);
