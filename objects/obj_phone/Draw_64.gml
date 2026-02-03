
if (room == rm_MainMenu) {
    exit;
}



// Draw the Phone Sprite
var _draw_x = phone_x - sway_x; 
draw_sprite_ext(spr_phone, 0, _draw_x, current_y, phone_scale, phone_scale, 0, c_white, 1);




// Draw the Digital Clock
var _total_seconds = floor(get_timer() / 1000000); 
var _minutes_passed = floor(_total_seconds / 60);

var _display_hour = 12;
var _display_min = _minutes_passed % 60;

// Format the time string
var _min_str = (_display_min < 10) ? "0" + string(_display_min) : string(_display_min);
var _time_string = string(_display_hour) + ":" + _min_str;

// 4. Draw the text
var _clock_x = _draw_x + (clock_x_offset * phone_scale);
var _clock_y = current_y + (clock_y_offset * phone_scale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(fnt_phone_clock);
draw_text_transformed(_clock_x, _clock_y, _time_string, phone_scale * 0.3, phone_scale * 0.3, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);



// Draw Flashlight Button
var _fb_x = _draw_x + (flashlight_btn_x_offset * phone_scale);
var _fb_y = current_y + (flashlight_btn_y_offset * phone_scale);
var _btn_frame = flashlight_on ? 1 : 0; 
draw_sprite_ext(spr_flashlight_button, _btn_frame, _fb_x, _fb_y, 1.5, 1.5, 0, c_white, 1);



// Draw the Battery
var _bat_x = _draw_x + (battery_x_offset * phone_scale);
var _bat_y = current_y + (battery_y_offset * phone_scale);
draw_sprite_ext(spr_battery, 0, _bat_x, _bat_y, 2, 2, 0, c_white, 1);



// Draw the noise wave
var _cx = _draw_x; 
var _cy = current_y + (wave_center_y_offset * phone_scale);

var _lx = _cx - (segments * spacing / 2);
var _ly = _cy;

var _intensity = clamp(current_noise * intensity_multiplier, intensity_min, intensity_max);
var _w_color = merge_color(green, red, _intensity);
draw_set_color(_w_color);

var _wave_height_squish = 0.4;

for (var i = 0; i < segments; i++) {
    var _angle = wave_timer + (i * 0.8);
    
    var _y_off = sin(_angle) * (current_noise * _wave_height_squish);
    
    var _tx = _lx + spacing;
    var _ty = _cy + _y_off;

    draw_line_width(_lx, _ly, _tx, _ty, 1 * phone_scale);

    _lx = _tx;
    _ly = _ty;
}



// Danger Meter
var _db_x = (_draw_x - danger_x_offset) - (danger_bar_width / 2);
var _db_y = current_y + (danger_y_offset * phone_scale);

// Background
draw_set_color(c_dkgray);
draw_rectangle(_db_x, _db_y, _db_x + danger_bar_width, _db_y + danger_bar_height, false);

// Fill
var _fill_w = (danger_level / 100) * danger_bar_width;
draw_set_color(c_yellow);
draw_rectangle(_db_x, _db_y, _db_x + _fill_w, _db_y + danger_bar_height, false);

// Outline
draw_set_color(c_white);
draw_rectangle(_db_x, _db_y, _db_x + danger_bar_width, _db_y + danger_bar_height, true);

// Icon
draw_sprite_ext(spr_danger_icon, 0, _db_x + danger_bar_width + 10, _db_y - (2 * phone_scale), 0.3, 0.3, 0, c_white, 1);



// Slickness Meter
var _sb_x = (_draw_x - slick_x_offset) - (danger_bar_width / 2);
var _sb_y = current_y + (slickness_y_offset * phone_scale);

// Background
draw_set_color(c_dkgray);
draw_rectangle(_sb_x, _sb_y, _sb_x + danger_bar_width, _sb_y + danger_bar_height, false);

// Fill
var _s_fill_w = (slickness_level / 100) * danger_bar_width;
draw_set_color(c_yellow); 
draw_rectangle(_sb_x, _sb_y, _sb_x + _s_fill_w, _sb_y + danger_bar_height, false);

// Outline
draw_set_color(c_white);
draw_rectangle(_sb_x, _sb_y, _sb_x + danger_bar_width, _sb_y + danger_bar_height, true);

// Icon
draw_sprite_ext(spr_slickness_icon, 0, _sb_x + danger_bar_width + 10, _sb_y - (2 * phone_scale), 0.3, 0.3, 0, c_white, 1);



// Reset color
draw_set_color(c_white);
