
array_push(global.inventory, note_id);

audio_play_sound(snd_note, 10, false);

// Debug message to show note got in inventory
//show_debug_message(global.inventory);
instance_destroy();
