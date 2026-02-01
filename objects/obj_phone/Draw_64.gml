
if (room == rm_MainMenu) {
	exit;
}

var _draw_x = phone_x - sway_x; 



// Draw the Phone
draw_sprite_ext(spr_phone, 0, _draw_x, current_y, phone_scale, phone_scale, 0, c_white, 1);



// Draw the noise wave
var _cx = _draw_x; 
var _cy = current_y + (wave_center_y_offset * phone_scale);

var _lx = _cx - (segments * spacing / 2);
var _ly = _cy;

var _intensity = clamp(current_noise * intensity_multiplier, intensity_min, intensity_max);
var _w_color = merge_color(green, red, _intensity);
draw_set_color(_w_color);

for (var i = 0; i < segments; i++) {
    var _angle = wave_timer + (i * 0.8);
    var _y_off = sin(_angle) * current_noise;
    
    var _tx = _lx + spacing;
    var _ty = _cy + _y_off;

    draw_line_width(_lx, _ly, _tx, _ty, 2 * phone_scale);

    _lx = _tx;
    _ly = _ty;
}



// Danger Meter
var _bar_x_offset = 20;
var _db_x = (_draw_x - _bar_x_offset) - (danger_bar_width / 2);
var _db_y = current_y + (danger_y_offset * phone_scale);

draw_set_color(c_dkgray);
draw_rectangle(_db_x, _db_y, _db_x + danger_bar_width, _db_y + danger_bar_height, false);

var _fill_w = (danger_level / 100) * danger_bar_width;
draw_set_color(c_yellow);
draw_rectangle(_db_x, _db_y, _db_x + _fill_w, _db_y + danger_bar_height, false);

draw_set_color(c_white);
draw_rectangle(_db_x, _db_y, _db_x + danger_bar_width, _db_y + danger_bar_height, true);

draw_sprite_ext(spr_danger_icon, 0, _db_x + danger_bar_width + 10, _db_y - 6, 0.5, 0.5, 0, c_white, 1);



// Slickness Meter
var _slick_x_offset = 20;
var _sb_x = (_draw_x - _slick_x_offset) - (danger_bar_width / 2);
var _sb_y = current_y + (slickness_y_offset * phone_scale);

draw_set_color(c_dkgray);
draw_rectangle(_sb_x, _sb_y, _sb_x + danger_bar_width, _sb_y + danger_bar_height, false);

var _s_fill_w = (slickness_level / 100) * danger_bar_width;
draw_set_color(c_yellow); 
draw_rectangle(_sb_x, _sb_y, _sb_x + _s_fill_w, _sb_y + danger_bar_height, false);

draw_set_color(c_white);
draw_rectangle(_sb_x, _sb_y, _sb_x + danger_bar_width, _sb_y + danger_bar_height, true);

draw_sprite_ext(spr_slickness_icon, 0, _sb_x + danger_bar_width + 10, _sb_y - 6, 0.5, 0.5, 0, c_white, 1);



 // Always reset color
draw_set_color(c_white);
