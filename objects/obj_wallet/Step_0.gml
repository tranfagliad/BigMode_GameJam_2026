
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);



// Hover & Blocking Logic
var _x1 = is_open ? (wallet_x - (wallet_width / 2)) : wallet_x; 
var _x2 = wallet_x + (wallet_width / 2);
var _y1 = current_y; 
var _y2 = gui_h; 
is_hovered = point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);



// Update global toggles
global.wallet_blocking_input = is_hovered;
global.phone_blocking_input = is_hovered || global.phone_blocking_input; 



// Big Note / Red X
reading_y = lerp(reading_y, reading_target_y, reading_lerp);
if (is_reading)
{
    var _center_x = gui_w / 2;
    var _note_w = sprite_get_width(reading_sprite) * 6;
    
    // Red X
    close_x = _center_x + (_note_w / 2) - 140;
    close_y = reading_y + 70;
    var _dist = point_distance(_mx, _my, close_x, close_y);
    if (mouse_check_button_pressed(mb_left) && _dist < close_radius) {
        is_reading = false;
        reading_target_y = gui_h + 600;
        var _snd = audio_play_sound(snd_note, 10, false);
        audio_sound_pitch(_snd, 0.5);
    }
    exit; 
}



// Hover
var _x1 = is_open ? (wallet_x - (wallet_width / 2)) : wallet_x; 
var _x2 = wallet_x + (wallet_width / 2);
var _y1 = current_y; 
var _y2 = gui_h; 
is_hovered = point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);



// Prevent opening the wallet and triggering the note in 1 click
var _just_opened = false;
if (is_hovered && mouse_check_button_pressed(mb_left)) {
    if (!is_open) {
        is_open = true;
        _just_opened = true;
    }
}



// Slide Up/Down
if (!is_hovered) {
    is_open = false;
}

var _target_y = is_hovered ? y_showing : y_hidden;
current_y = lerp(current_y, _target_y, lerp_speed);

var _move_amount = 0;
if (instance_exists(obj_controller)) {
    _move_amount = obj_controller.new_x - obj_controller.current_x;
}
var _target_sway_x = _move_amount * sway_intensity;
sway_x = lerp(sway_x, _target_sway_x, sway_lerp);



// Note Hover & Click
if (is_open && !_just_opened)
{
    var _draw_x = wallet_x - sway_x;
    for (var i = 0; i < array_length(notes); i++)
	{
        var _n = notes[i];
		var _this_note_x = _draw_x + _n.offset_x;
		var _this_note_y = current_y + _n.offset_y;
        var _real_w = (sprite_get_width(_n.sprite) * _n.x_scale);
        var _height_percent = lerp(0.5, 1.0, _n.frame / 2);
        var _real_h = (sprite_get_height(_n.sprite) * _n.y_scale) * _height_percent;
        var _nx1 = _this_note_x - (_n.w / 2);
		var _nx2 = _this_note_x + (_n.w / 2);
		var _ny2 = _this_note_y;
		var _ny1 = _this_note_y - _n.h;
        if (point_in_rectangle(_mx, _my, _nx1, _ny1, _nx2, _ny2))
		{
            _n.frame = min(_n.frame + _n.anim_speed, 2); 
            
            if (mouse_check_button_pressed(mb_left))
			{
			    is_reading = true;
			    reading_sprite = _n.sprite;
			    reading_overlay = _n.overlay;
				
			    reading_full_x_scale = _n.full_note_x_scale;
			    reading_full_y_scale = _n.full_note_y_scale;
    
			    reading_frame = sprite_get_number(_n.sprite) - 1;
			    reading_target_y = (gui_h / 2) + 200;
			    audio_play_sound(snd_note, 10, false);
			}
        } else {
            _n.frame = max(_n.frame - _n.anim_speed, 0);
        }
    }
}



// Prevent clicking through the wallet on a door
global.phone_blocking_input = is_hovered;
