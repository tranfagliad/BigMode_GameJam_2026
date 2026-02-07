
if (anim_state != "hidden" && reading_sprite != noone)
{
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();

    var _fade = clamp((_gh + 200 - anim_y) / 200, 0, 1);
    draw_set_alpha(_fade * 0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gw, _gh, false);
    draw_set_alpha(1.0);
	
	if (reading_sprite != noone) {
		draw_sprite_ext(reading_sprite, 0, _gw / 2, anim_y, 0.65, 0.65, 0, c_white, 1);
	}

    draw_sprite_ext(spr_red_x, 0, close_button_x, close_button_y, 0.6, 0.6, 0, c_white, 1);
}
