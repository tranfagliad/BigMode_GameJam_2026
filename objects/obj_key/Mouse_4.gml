
if (global.phone_blocking_input || global.keypad_active) {
	exit;
}



// Add this specific key to inventory
if (!array_contains(global.inventory, key_id))
{
    array_push(global.inventory, key_id);
    
    //audio_play_sound(snd_collect_sound, 10, false); 
    
    // Debugging
	show_debug_message(global.inventory);
    
    instance_destroy();
}
