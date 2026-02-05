
var _blocked = false;
if (global.phone_blocking_input || (instance_exists(obj_phone) && obj_phone.is_hovered) || (instance_exists(obj_wallet) && obj_wallet.is_hovered)) {
    _blocked = true;
}
if (_blocked) {
	exit;
}



if (!variable_global_exists("door_states")) {
	global.door_states = {};
}




if (door_id != "" && struct_exists(global.door_states, door_id)) {
    is_locked = false;
}



// Locked / Unlock door
if (is_locked)
{
    if (key_needed != "" && array_contains(global.inventory, key_needed))
	{
        is_locked = false;   
        audio_play_sound(snd_door_unlock_click, 10, false); 
        
        if (door_id != "") {
			struct_set(global.door_states, door_id, true);
		}
        
        show_debug_message("SUCCESS: Door unlocked with key. Click again to enter.");
        exit; 
    } else {
        show_debug_message("FAIL: Still locked. Key needed: " + string(key_needed));
        exit; 
    }
}



// Transition to the next room
if (target_room != noone)
{
    global.target_door_id = target_door_id; 

    var _door_x = x;
    var _door_y = y;
    var _final_destination = target_room;
    
    var _sound_to_use = (door_sound != noone) ? door_sound : snd_door_default;

    // IMPORTANT: Win Condition
    if (room == rm_Office && target_room == rm_CommonArea) {
        if (array_contains(global.inventory, "vault_secret_document")) {
            _final_destination = rm_Victory; 
        }
    }

    with (obj_transition_manager)
    {
        if (transition_state == Transition.Idle)
        {
            var _foot_steps_sound = audio_play_sound(snd_foot_steps, 10, false);
            audio_sound_gain(_foot_steps_sound, 0.5, 0);
            audio_sound_gain(_foot_steps_sound, 0, 1500);
            
            var _ts = time_source_create(time_source_game, 0.6, time_source_units_seconds, function(_val) {
                audio_play_sound(_val, 11, false);
            }, [_sound_to_use]);
            
            time_source_start(_ts);

            target_room = _final_destination; 
            zoom_anchor_x = _door_x; 
            zoom_anchor_y = _door_y;
            zoom_start_x = camera_get_view_x(view_camera[0]);
            zoom_start_y = camera_get_view_y(view_camera[0]);
            zoom_speed = 0.005;
            transition_state = Transition.Fading_Out;
        }
    }
}
