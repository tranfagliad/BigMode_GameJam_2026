
// Create the emitter
kitchen_freezer_emitter = audio_emitter_create();
audio_emitter_bus(kitchen_freezer_emitter, kitchen_freezer_bus);
kitchen_freezer_loop = audio_play_sound_on(kitchen_freezer_emitter, snd_freezer_bgr, true, 10);
audio_emitter_gain(kitchen_freezer_emitter, 0.08);
