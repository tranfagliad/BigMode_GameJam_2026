
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



// Reset color
draw_set_color(c_white);