// Check if ANY UI element is blocking input
var _blocked = false;



if (global.phone_blocking_input) {
	_blocked = true;
}



// Direct safety check for Phone
if (instance_exists(obj_phone)) {
    if (obj_phone.is_hovered) {
		_blocked = true;
	}
}



// Direct safety check for Wallet
if (instance_exists(obj_wallet)) {
    if (obj_wallet.is_hovered) {
		_blocked = true;
	}
}



// If blocked, stop here
if (_blocked) {
	exit;
}



// Go through the door
if (target_room != noone)
{
    global.target_door_id = target_door_id; 

    with (obj_transition_manager) {
        if (transition_state == Transition.Idle) {
			var _foot_steps_sound = audio_play_sound(snd_foot_steps, 10, false);
			audio_sound_gain(_foot_steps_sound, 0.5, 0);
			audio_sound_gain(_foot_steps_sound, 0, 1500);
			
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
