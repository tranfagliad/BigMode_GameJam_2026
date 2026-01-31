var _cam = view_camera[0];
var _cam_w = camera_get_view_width(_cam);
var _found_door = false;


with (obj_door) {
    if (door_id == global.target_door_id) {
        other.target_x = x - (_cam_w / 2);
        _found_door = true;
    }
}


if (!_found_door) {
    var _room_id = string(room);
    if (variable_struct_exists(room_camera_positions, _room_id)) {
        target_x = room_camera_positions[$ _room_id];
    } else {
        target_x = 0;
    }
}


target_x = clamp(target_x, 0, room_width - _cam_w);

current_x = target_x;
new_x = target_x;

camera_set_view_pos(_cam, target_x, 0);