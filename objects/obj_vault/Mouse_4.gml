
if (global.phone_blocking_input || global.keypad_active) {
	exit;
}



// Cannot click the vault if the painting is on top
if (instance_exists(obj_vault_painting)) {
    exit;
}



// Prevent click-through when the painting is removed
if (instance_exists(obj_vault_painting) || just_revealed_timer > 0) {
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
