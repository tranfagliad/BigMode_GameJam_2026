
// Music and City settings for each room

switch (room) {
    case rm_CommonArea:
        target_vol = 0.5;
        target_cutoff = 1200;
        target_echo = 0.2;
        target_city_vol = 0.12;
        break;
        
    case rm_Office:
        target_vol = 1.5;
        target_cutoff = 20000;
        target_echo = 0.0;
        target_city_vol = 0;
        break;
        
    case rm_Kitchen:
        target_vol = 0.2;
        target_cutoff = 600;
        target_echo = 0.3;
        target_city_vol = 0;
        break;
        
    case rm_WalkInFreezer:
        target_vol = 0;
        target_cutoff = 200;
        target_echo = 0;
        target_city_vol = 0;
        break;
}



// Smoothly transition everything
music_bus.gain = lerp(music_bus.gain, target_vol, lerp_speed);
muffle_effect.cutoff = lerp(muffle_effect.cutoff, target_cutoff, lerp_speed);
echo_effect.mix = lerp(echo_effect.mix, target_echo, lerp_speed);
outside_bus.gain = lerp(outside_bus.gain, target_city_vol, lerp_speed);
