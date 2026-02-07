
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _gh = display_get_gui_height(); 

var _x1 = phone_x - (phone_width / 2);
var _x2 = phone_x + (phone_width / 2);
var _y1 = current_y;
var _y2 = _gh;

is_hovered = point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);
global.phone_blocking_input = is_hovered;
