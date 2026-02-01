
if (room == rm_MainMenu) {
	exit;
}



var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);



// Dynamic Left Boundary
var _x1 = is_open ? (wallet_x - (wallet_width / 2)) : wallet_x; 
var _x2 = wallet_x + (wallet_width / 2);
var _y1 = current_y; 
var _y2 = gui_h; 

is_hovered = point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);



// Only open the wallet on click
if (is_hovered && mouse_check_button_pressed(mb_left)) {
    is_open = true; 
}

// Close the wallet only when the mouse leaves the area
if (!is_hovered) {
    is_open = false;
}



// Slide up
var _target_y = is_hovered ? y_showing : y_hidden;
current_y = lerp(current_y, _target_y, lerp_speed);



// Side-to-Side Sway
var _move_amount = 0;
if (instance_exists(obj_controller)) {
    _move_amount = obj_controller.new_x - obj_controller.current_x;
}
var _target_sway_x = _move_amount * sway_intensity;
sway_x = lerp(sway_x, _target_sway_x, sway_lerp);



// Prevents going through a door if it is clicked through the phone screen
global.phone_blocking_input = is_hovered;
