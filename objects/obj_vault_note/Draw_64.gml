
if (is_reading)
{
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1.0);

    draw_sprite_ext(spr_recipe, 0, gui_w / 2, gui_h / 2, 4, 4, 0, c_white, 1);

    // 3. Draw the Red X Sprite
    var _x_btn_x = (gui_w / 2) + 200;
    var _x_btn_y = (gui_h / 2) - 250;
    draw_sprite_ext(spr_red_x, 0, _x_btn_x, _x_btn_y, 2, 2, 0, c_white, 1);
} else {
	draw_self();   // Only draw the note in the vault if we aren't reading it
}
