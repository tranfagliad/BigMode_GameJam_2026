if (room == rm_MainMenu) {
    exit;
}



var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);



// Wallet Boundaries
var _x1 = is_open ? (wallet_x - (wallet_width / 2)) : wallet_x; 
var _x2 = wallet_x + (wallet_width / 2);
var _y1 = current_y; 
var _y2 = gui_h; 

is_hovered = point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);



// Input Handling
if (is_hovered && mouse_check_button_pressed(mb_left)) {
    is_open = true; 
}

if (!is_hovered) {
    is_open = false;
}



// Motion
var _target_y = is_hovered ? y_showing : y_hidden;
current_y = lerp(current_y, _target_y, lerp_speed);

var _move_amount = 0;
if (instance_exists(obj_controller)) {
    _move_amount = obj_controller.new_x - obj_controller.current_x;
}
var _target_sway_x = _move_amount * sway_intensity;
sway_x = lerp(sway_x, _target_sway_x, sway_lerp);



// Note Hover & Click
if (is_open) {
    var _draw_x = wallet_x - sway_x;

    for (var i = 0; i < array_length(notes); i++)
	{
        var _n = notes[i];
        
        var _height_percent = lerp(0.5, 1.0, _n.frame / 2);
        var _active_h = _n.h * _height_percent;

        var _nx1 = _draw_x + _n.offset_x - (_n.w / 2);
        var _ny2 = current_y + _n.offset_y;
        var _ny1 = _ny2 - _active_h;
        var _nx2 = _nx1 + _n.w;

        if (point_in_rectangle(_mx, _my, _nx1, _ny1, _nx2, _ny2)) {
            _n.frame = min(_n.frame + _n.anim_speed, 2); 
            
            if (mouse_check_button_pressed(mb_left))
			{
                show_debug_message("Note Clicked!");
            }
        } else {
            _n.frame = max(_n.frame - _n.anim_speed, 0);
        }
    }
}



// Prevent clicking through the wallet on a door
global.phone_blocking_input = is_hovered;
