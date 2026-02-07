if (anim_state != "hidden")
{
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();

    var _fade_progress = clamp((_gh + 200 - anim_y) / 200, 0, 1);
    draw_set_alpha(_fade_progress * 0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gw, _gh, false);
    draw_set_alpha(1.0);

    var _note_scale = 0.25; 
    draw_sprite_ext(reading_sprite, 0, _gw / 2, anim_y, _note_scale, _note_scale, 0, c_white, 1);
	
    var _x_scale = 0.6;
    draw_sprite_ext(spr_red_x, 0, close_button_x, close_button_y, _x_scale, _x_scale, 0, c_white, 1);
}