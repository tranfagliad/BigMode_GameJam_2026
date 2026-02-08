
var _gh = display_get_gui_height();
var _gw = display_get_gui_width();
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);



image_xscale = lerp(image_xscale, target_scale, pop_speed);
image_yscale = lerp(image_yscale, target_scale, pop_speed);

if (anim_state == "hidden") {
    y += sin(get_timer() * 0.000005) * 0.2;
}



if (anim_state == "opening")
{
    var _note_target = _gh - 50;  
    anim_y = lerp(anim_y, _note_target, lerp_speed);
    
    if (abs(anim_y - _note_target) < 1) {
        anim_y = _note_target;
        anim_state = "reading";
    }
} 
else if (anim_state == "closing")
{
    anim_y = lerp(anim_y, _gh + 800, lerp_speed);
    if (anim_y > _gh + 750) {
        instance_destroy();
    }
}



if (anim_state != "hidden") {
    var _x_scale = 0.6;
    close_button_size = sprite_get_width(spr_red_x) * _x_scale;
    close_button_x = (_gw / 2) - (close_button_size / 2); 
    close_button_y = anim_y - 20; 
    
    // Click detection
    if (anim_state == "reading" && mouse_check_button_pressed(mb_left)) {
        if (!global.phone_blocking_input && !global.wallet_blocking_input) {
            var _p = 20; 
            if (point_in_rectangle(_mx, _my, close_button_x - _p, close_button_y - _p, 
                                           close_button_x + close_button_size + _p, 
                                           close_button_y + close_button_size + _p)) {
                anim_state = "closing";
                global.reading_note = false;
                var _snd = audio_play_sound(snd_note, 10, false);
                audio_sound_pitch(_snd, 0.5);
                receive_message_once("recipe_collected", "get the heck outta there! we're goin shopping");
            }
        }
    }
}
