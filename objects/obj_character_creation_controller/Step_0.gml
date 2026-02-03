
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Slider Interaction
var _sep = slick_bar_width / 2;
var _left = slick_bar_x - _sep;

for (var i = 0; i < 3; i++) {
    var _dot_x = _left + (_sep * i);
    
    if (mouse_check_button_pressed(mb_left)) {
        if (point_in_circle(_mx, _my, _dot_x, slick_bar_y, 25)) {
            slickness_level = i;
            // audio_play_sound(snd_click, 10, false);
        }
    }
}
