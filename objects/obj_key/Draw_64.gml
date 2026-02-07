
if (anim_state != "hidden" && reading_sprite != noone)
{
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();

    // Background Dimming
    var _fade = clamp((_gh + 200 - anim_y) / 200, 0, 1);
    draw_set_alpha(_fade * 0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gw, _gh, false);
    draw_set_alpha(1.0);
	
    // Draw the Note
    var _n_scale = 0.5; 
    draw_sprite_ext(reading_sprite, 0, _gw / 2, anim_y, _n_scale, _n_scale, 0, c_white, 1);

    // Draw Red X
    if (anim_state == "reading" || anim_state == "closing") {
        var _btn_scale = 0.6;
        draw_sprite_ext(spr_red_x, 0, close_button_x, close_button_y, _btn_scale, _btn_scale, 0, c_white, _fade);
    }
}
