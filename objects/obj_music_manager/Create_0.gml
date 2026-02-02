
if (instance_number(obj_music_manager) > 1) {
    instance_destroy();
    exit;
}

//Create the Bus and Effect
music_bus = audio_bus_create();
muffle_effect = audio_effect_create(AudioEffectType.LPF2);
muffle_effect.cutoff = 20000;
music_bus.effects[0] = muffle_effect;

// Create an emitter and link it to the Bus
music_emitter = audio_emitter_create();
audio_emitter_bus(music_emitter, music_bus); 

// Play the sound ON the emitter
if (!audio_is_playing(snd_bgr_music)) {
    music_instance = audio_play_sound_on(music_emitter, snd_bgr_music, true, 100);
}

target_vol = 1.0;
target_cutoff = 20000;
lerp_speed = 0.1;
