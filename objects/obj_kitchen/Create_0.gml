
// Dedicated bus for the Kitchen's version of the freezer hum
kitchen_freezer_bus = audio_bus_create();
kitchen_muffle = audio_effect_create(AudioEffectType.LPF2);
kitchen_muffle.cutoff = 400;
kitchen_muffle.q = 2.0; 
kitchen_freezer_bus.effects[0] = kitchen_muffle;
kitchen_freezer_bus.gain = 1.2;



alarm[0] = game_get_speed(gamespeed_fps) * 2;
