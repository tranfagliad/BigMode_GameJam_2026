
// Create a dedicated bus for the freezer hum
freezer_bus = audio_bus_create();
freezer_muffle = audio_effect_create(AudioEffectType.LPF2);
freezer_muffle.cutoff = 500; 
freezer_muffle.q = 1.0;
freezer_bus.effects[0] = freezer_muffle;



alarm[0] = game_get_speed(gamespeed_fps) * 5;
alarm[1] = game_get_speed(gamespeed_fps) * 10;
