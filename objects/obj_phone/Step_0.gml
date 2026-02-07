
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _x1 = phone_x - (phone_width / 2);
var _x2 = phone_x + (phone_width / 2);
var _y1 = current_y;
var _y2 = gui_h;



// Hovered over the phone
is_hovered = point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);
global.phone_blocking_input = is_hovered;

var _target_y = is_hovered ? y_showing : y_hidden;
current_y = lerp(current_y, _target_y, lerp_speed);



// Side-to-Side Sway
var _move_amount = 0;
if (instance_exists(obj_controller)) {
    _move_amount = obj_controller.new_x - obj_controller.current_x;
}
var _target_sway_x = clamp(_move_amount * sway_intensity, -40, 40); 
sway_x = lerp(sway_x, _target_sway_x, sway_lerp);



// Flashlight Button
var _current_draw_x = phone_x - sway_x;
var _btn_w = sprite_get_width(spr_flashlight_button) * phone_scale;
var _btn_h = sprite_get_height(spr_flashlight_button) * phone_scale;
var _btn_x = _current_draw_x + (flashlight_btn_x_offset * phone_scale);
var _btn_y = current_y + (flashlight_btn_y_offset * phone_scale);

// Hitbox boundaries
var _bx1 = _btn_x - (_btn_w / 2);
var _by1 = _btn_y - (_btn_h / 2);
var _bx2 = _btn_x + (_btn_w / 2);
var _by2 = _btn_y + (_btn_h / 2);

// On/Off
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(_mx, _my, _bx1, _by1, _bx2, _by2)) {
        flashlight_on = !flashlight_on;
        // audio_play_sound(snd_flashlight_click, 10, false);
    }
}



// Flashlight Waving Danger, does NOT trigger in the Walk-In-Freezer
var _curr_mx = device_mouse_x_to_gui(0);
var _curr_my = device_mouse_y_to_gui(0);
if (flashlight_on && room != rm_WalkInFreezer)
{
    var _dist = point_distance(prev_mouse_x, prev_mouse_y, _curr_mx, _curr_my);
    if (_dist > 1) {
        danger_level += (_dist * flashlight_sensitivity);
    }
}
prev_mouse_x = _curr_mx;
prev_mouse_y = _curr_my;



// Movement-Based Danger
if (flashlight_on && instance_exists(obj_controller) && room != rm_WalkInFreezer)
{
    if (obj_controller.is_actually_moving)
	{
		var _turn_amount = abs(obj_controller.new_x - obj_controller.current_x);
		danger_level += (_turn_amount * 0.2);
	}
}



// Noise Detection
if (mouse_check_button_pressed(mb_left)) {
    var _spike = 8;
    current_noise += _spike;
    
    var _multiplier = 1 + (current_noise * 0.08); 
    danger_level += (_spike * _multiplier); 
}

// Decay noise
current_noise = clamp(current_noise, 0, 30);
current_noise *= decay_rate;

// Wave speed scales with noise
wave_timer += (0.1 + (current_noise * 0.05));



// Update the current danger level
if (instance_exists(obj_controller) && obj_controller.game_over_triggered) {
    danger_level = 100; // Force it to stay full at game over
} else {
    danger_level = clamp(danger_level - danger_decay, 0, 100);
}



// Reset "New" Message
if (current_y >= y_hidden - 2 && _target_y == y_hidden)
{
    if (variable_instance_exists(id, "phone_was_opened") && phone_was_opened) {
        has_new_messages = false;
        phone_was_opened = false;
    }
}
if (current_y <= y_showing + 5) {
    phone_was_opened = true;
}
