
// Room Logic
switch (room) {
    case rm_Office:
		target_vol = 1.5;
		target_cutoff = 20000;
		break;
    
	case rm_CommonArea:
		target_vol = 0.6;
		target_cutoff = 1200;
		break;
		
    case rm_Kitchen:
		target_vol = 0.2;
		target_cutoff = 600;
		break;
		
    case rm_WalkInFreezer:
		target_vol = 0.0;
		target_cutoff = 200;
		break;
}



// Apply changes to the BUS
music_bus.gain = lerp(music_bus.gain, target_vol, lerp_speed);
muffle_effect.cutoff = lerp(muffle_effect.cutoff, target_cutoff, lerp_speed);
