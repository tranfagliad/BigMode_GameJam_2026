
if (global.phone_blocking_input || global.wallet_blocking_input || global.keypad_active) {
    exit;
}



click_count += 1;
shake_amount = 5;



var _snd = audio_play_sound(snd_painting_click, 10, false); 
audio_sound_pitch(_snd, 0.8 + (click_count * 0.2)); 



image_angle += 2;
if (click_count >= max_clicks)
{
    global.vault_painting_removed = true;
    audio_play_sound(snd_painting_remove, 11, false);
    
    if (instance_exists(obj_vault)) {
        obj_vault.just_revealed_timer = 5;
    }
    
    instance_destroy();
}
