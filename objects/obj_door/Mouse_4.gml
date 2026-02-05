
var _blocked = false;
if (global.phone_blocking_input) {
    _blocked = true;
}
if (instance_exists(obj_phone) && obj_phone.is_hovered) {
    _blocked = true;
}
if (instance_exists(obj_wallet) && obj_wallet.is_hovered) {
    _blocked = true;
}

if (_blocked) {
    exit;
}



// Lock / Unlock
if (is_locked)
{
    if (key_needed != "" && array_contains(global.inventory, key_needed)) {
        is_locked = false;   // Unlock the door
        audio_play_sound(snd_door_unlock_click, 10, false); 
    } else {
        if (!audio_is_playing(snd_door_locked_rattle)) {
            audio_play_sound(snd_door_locked_rattle, 10, false);
        }
        exit; // Don't go through the door
    }
}



if (target_room != noone)
{
    // Win Condition
    // If leaving Office for Common Area with the recipe, the player Wins!
    var _final_destination = target_room;
    
    if (room == rm_Office && target_room == rm_CommonArea) {
        if (array_contains(global.inventory, "vault_secret_document")) {
            _final_destination = rm_Victory; 
        }
    }
    
    global.target_door_id = target_door_id; 

    with (obj_transition_manager)
	{
        if (transition_state == Transition.Idle)
		{
            var _foot_steps_sound = audio_play_sound(snd_foot_steps, 10, false);
            audio_sound_gain(_foot_steps_sound, 0.5, 0);
            audio_sound_gain(_foot_steps_sound, 0, 1500);
            var _snd_to_play = (other.door_sound != noone) ? other.door_sound : snd_door_default;
            var _ts = time_source_create(time_source_game, 0.6, time_source_units_seconds, function(_val) {
                audio_play_sound(_val, 11, false);
            }, [_snd_to_play]);
            time_source_start(_ts);

            target_room = _final_destination; 
            
            zoom_anchor_x = other.x; 
            zoom_anchor_y = other.y;
            zoom_start_x = camera_get_view_x(view_camera[0]);
            zoom_start_y = camera_get_view_y(view_camera[0]);
            zoom_speed = 0.005;
            
            transition_state = Transition.Fading_Out;
        }
    }
}
