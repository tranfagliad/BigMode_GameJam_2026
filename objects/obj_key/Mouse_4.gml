
if (global.phone_blocking_input || global.wallet_blocking_input || global.keypad_active) {
    exit;
}



if (!array_contains(global.inventory, key_id))
{
    array_push(global.inventory, key_id);
    
    if (collect_sound != noone) {
        audio_play_sound(collect_sound, 10, false);
    }
    
    if (has_note)
    {
        if (instance_exists(obj_wallet)) {
            array_push(obj_wallet.notes, {
                sprite: spr_white_note,
                overlay: reading_sprite,
                offset_x: -145,
                offset_y: 67, 
                x_scale: 2.5,
                y_scale: 0.5,
                full_note_x_scale: 0.45,
                full_note_y_scale: 0.45,
                frame: 0,
                anim_speed: 0.5,
                w: sprite_get_width(spr_white_note) * 2.5,
                h: sprite_get_height(spr_white_note) * 0.5
            });
        }

        anim_state = "opening";
        anim_y = display_get_gui_height() + 500; 
        is_reading = true;
        global.reading_note = true;
        x = -1000;
    } else {
        instance_destroy();
    }
}
