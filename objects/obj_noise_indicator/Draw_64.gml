
last_x = center_x - (segments * spacing / 2);
last_y = center_y;

intensity = clamp(current_noise * intensity_multiplier, intensity_min, intensity_max);
wave_color = merge_color(green, red, intensity);
draw_set_color(wave_color);

for (var i = 0; i < segments; i++)
{
    angle = wave_timer + (i * 0.8);
    y_offset = sin(angle) * current_noise;
    
    this_x = last_x + spacing;
    this_y = center_y + y_offset;

    draw_line_width(last_x, last_y, this_x, this_y, 2);

    last_x = this_x;
    last_y = this_y;
}
