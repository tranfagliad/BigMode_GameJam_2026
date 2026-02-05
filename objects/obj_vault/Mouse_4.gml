
if (global.phone_blocking_input) {
	exit;
}



if (!is_open) {
    instance_create_depth(0, 0, -10000, obj_vault_keypad);
    //audio_play_sound(snd_keypad_open, 10, false);
} else {
    room_goto(rm_Victory);
}
