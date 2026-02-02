
if (alpha > 0)
{
    draw_set_alpha(alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}



var _img = btn_hovered ? 1 : 0;
draw_sprite(spr_start_button, _img, btn_x, btn_y);
