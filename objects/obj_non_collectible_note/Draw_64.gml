
if (anim_state != "hidden")
{
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();
    var _dist = 1 - ((anim_y - target_y) / (_gh - target_y));
    var _bg_alpha = clamp(_dist * 0.7, 0, 0.7);

    draw_set_alpha(_bg_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gw, _gh, false);
    draw_set_alpha(1);
    
    var _note_scale = 0.65;
    var _note_x = _gw / 2;
    
    draw_sprite_ext(reading_sprite, 0, _note_x, anim_y, _note_scale, _note_scale, 0, c_white, 1);
    
    if (anim_state == "reading" || anim_state == "closing") {
        var _x_scale = 0.6;
        draw_sprite_ext(spr_red_x, 0, close_button_x, close_button_y, _x_scale, _x_scale, 0, c_white, 1);
    }
	
    if (anim_state == "opening" || anim_state == "reading" || anim_state == "closing") {
        var _x_scale = 0.6;
        draw_sprite_ext(spr_red_x, 0, close_button_x, close_button_y, _x_scale, _x_scale, 0, c_white, 1);
    }
}
