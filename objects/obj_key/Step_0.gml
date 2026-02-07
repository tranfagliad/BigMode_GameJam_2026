
var _gh = display_get_gui_height();
var _gw = display_get_gui_width();
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);



// Animation
if (anim_state == "opening") 
{
    var _note_target = _gh - 300; 
    anim_y = lerp(anim_y, _note_target, 0.15);
    if (abs(anim_y - _note_target) < 1) {
        anim_y = _note_target;
        anim_state = "reading";
    }
}
else if (anim_state == "closing")
{
    anim_y = lerp(anim_y, _gh + 600, 0.15);
    if (anim_y > _gh + 550) {
        instance_destroy();
    }
}



// Red X
if (anim_state != "hidden")
{
    var _btn_scale = 0.6;
    var _btn_sz = sprite_get_width(spr_red_x) * _btn_scale;

    close_button_x = (_gw / 2) - (_btn_sz / 2);
    close_button_y = _gh - _btn_sz - 30;
	
    if (anim_state == "reading" && mouse_check_button_pressed(mb_left)) {
        if (!global.phone_blocking_input && !global.wallet_blocking_input) {
            var _p = 20;
            if (point_in_rectangle(_mx, _my, close_button_x - _p, close_button_y - _p, close_button_x + _btn_sz + _p, close_button_y + _btn_sz + _p)) {
                anim_state = "closing";
                global.reading_note = false;
                
                var _snd = audio_play_sound(snd_note, 10, false);
                audio_sound_pitch(_snd, 0.5);
            }
        }
    }
}
