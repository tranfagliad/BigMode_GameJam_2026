
// Fade out
audio_emitter_gain(freezer_emitter, 0, 300);

audio_stop_sound(freezer_loop);

// Clean up the technical bits
audio_emitter_free(freezer_emitter);
