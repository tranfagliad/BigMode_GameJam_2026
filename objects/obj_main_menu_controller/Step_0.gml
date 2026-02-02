
// Fade In
if (alpha > 0) {
    alpha -= fade_speed;
}



// Start Button
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _x1 = btn_x - (btn_w / 2);
var _y1 = btn_y - (btn_h / 2);
var _x2 = btn_x + (btn_w / 2);
var _y2 = btn_y + (btn_h / 2);

btn_hovered = point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);
if (btn_hovered && mouse_check_button_pressed(mb_left)) {
    show_debug_message("Start Game!");
}



// Music Transition to Loop
if (!intro_played)
{
    if (!audio_is_playing(music_instance))
    {
        music_instance = audio_play_sound(snd_main_menu_loop, 100, true);
        audio_sound_gain(music_instance, music_volume, 0); 
        intro_played = true;
    }
}
