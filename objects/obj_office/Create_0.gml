
// Bus and Muffle Effect
office_bus = audio_bus_create();
snore_muffle = audio_effect_create(AudioEffectType.LPF2);
snore_muffle.cutoff = 800;
snore_muffle.q = 1.0;
office_bus.effects[0] = snore_muffle;

// Setup an emitter
office_emitter = audio_emitter_create();
audio_emitter_bus(office_emitter, office_bus);

// Loop the snore
audio_emitter_position(office_emitter, x, y, 0); 
snore_loop = audio_play_sound_on(office_emitter, snd_snore, true, 100);



alarm[0] = game_get_speed(gamespeed_fps) * 2;
alarm[1] = game_get_speed(gamespeed_fps) * 6;
alarm[2] = game_get_speed(gamespeed_fps) * 15;
