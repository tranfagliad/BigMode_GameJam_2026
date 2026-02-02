
if (room == rm_MainMenu) {
    exit;
}



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

var _target_sway_x = _move_amount * sway_intensity;
sway_x = lerp(sway_x, _target_sway_x, sway_lerp);



// Noise Detection
if (mouse_check_button_pressed(mb_left)) {
    var _spike = 8;
    current_noise += _spike;
    
    var _multiplier = 1 + (current_noise * 0.08); 
    danger_level += (_spike * _multiplier); 
}

// Decay noise
current_noise = clamp(current_noise, 0, 25);
current_noise *= decay_rate;

// Update the current danger level
danger_level = clamp(danger_level - danger_decay, 0, 100);



// IMPORTANT: Game Over check
if (danger_level >= 100 && !game_over_triggered) {
    show_debug_message("GAME OVER");
    game_over_triggered = true;
}



// Wave speed scales with noise
wave_timer += (0.1 + (current_noise * 0.05));
