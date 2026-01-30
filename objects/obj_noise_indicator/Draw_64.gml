var center_x = display_get_gui_width() - 150;
var center_y = display_get_gui_height() - 100;
var segments = 15;
var spacing = 6;

draw_set_color(c_black);

var last_x = center_x - (segments * spacing / 2);
var last_y = center_y;

var color_start = #00FF00;
var color_end   = #FF0000;
var intensity = clamp(current_noise / 20, 0, 1);
var wave_color = merge_color(color_start, color_end, intensity);
draw_set_color(wave_color);

for (var i = 0; i < segments; i++) {
    var angle = wave_timer + (i * 0.8);
    var y_offset = sin(angle) * current_noise;
    
    var this_x = last_x + spacing;
    var this_y = center_y + y_offset;

    draw_line_width(last_x, last_y, this_x, this_y, 2);

    last_x = this_x;
    last_y = this_y;
}
