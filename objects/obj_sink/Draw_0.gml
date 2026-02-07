
draw_self();



if (is_on) {
    draw_set_color(c_aqua);
    draw_set_alpha(0.3);
    draw_rectangle(x - 20, y + 10, x + 20, y + 60, false);
    draw_set_alpha(1.0);
}
