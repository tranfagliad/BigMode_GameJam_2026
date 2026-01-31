
if (room == rm_MainMenu) {
	exit;
}

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _x1 = phone_x;
var _y1 = current_y;
var _x2 = phone_x + phone_width;
var _y2 = gui_h;

is_hovered = point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);

var _target_y = is_hovered ? y_showing : y_hidden;
current_y = lerp(current_y, _target_y, lerp_speed);




// Noise Indicator
if (mouse_check_button_pressed(mb_left))
{
    current_noise += 8;
}

current_noise = clamp(current_noise, 0, 25);
current_noise *= decay_rate;

wave_timer += (0.1 + (current_noise * 0.05));
