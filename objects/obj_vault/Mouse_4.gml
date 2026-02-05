
if (global.phone_blocking_input) {
	exit;
}



// Vault is already open, don't enter the keypad again
if (global.vault_unlocked) {
	exit;
}



// Enter the keypad
if (!is_open) {
    instance_create_depth(0, 0, -10000, obj_vault_keypad);
    //audio_play_sound(snd_keypad_open, 10, false);
}
