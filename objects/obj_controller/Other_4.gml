var _room_id = string(room);

if (variable_struct_exists(room_camera_positions, _room_id)) {
    target_x = room_camera_positions[$ _room_id];
} else {
    target_x = 0;
}

current_x = target_x;
new_x = target_x;

camera_set_view_pos(view_camera[0], new_x, 0);
