
// Check if the phone is blocking input first
if (instance_exists(obj_phone))
{
    if (global.phone_blocking_input) {
        exit; // Don't trigger the door
    }
}



// Go through the door
if (target_room != noone)
{
    global.target_door_id = target_door_id; 

    with (obj_transition_manager) {
        if (transition_state == Transition.Idle) {
            target_room = other.target_room;
            zoom_anchor_x = other.x; 
            zoom_anchor_y = other.y;
            zoom_start_x = camera_get_view_x(view_camera[0]);
            zoom_start_y = camera_get_view_y(view_camera[0]);
            zoom_speed = 0.005;
            transition_state = Transition.Fading_Out;
        }
    }
}
