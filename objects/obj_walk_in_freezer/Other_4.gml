
// Create an emitter and link it to the freezer bus
freezer_emitter = audio_emitter_create();
audio_emitter_bus(freezer_emitter, freezer_bus);

// Play the sound on the emitter
freezer_loop = audio_play_sound_on(freezer_emitter, snd_freezer_bgr, true, 10);

// Fade in
audio_emitter_gain(freezer_emitter, 0);
audio_emitter_gain(freezer_emitter, 1.5, 1500);
