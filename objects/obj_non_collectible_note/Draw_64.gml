
if (anim_state != "hidden")
{
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();
    
    var _dist = clamp((_gh - anim_y + 400) / 400, 0, 1);
    draw_set_alpha(_dist * 0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gw, _gh, false);
    draw_set_alpha(1);
    
    var _note_x = _gw * gui_target_x_percent;
    
    // Draw Note
    draw_sprite_ext(reading_sprite, 0, _note_x, anim_y, note_scale_gui, note_scale_gui, 0, c_white, 1);
    
    // Draw Red X
    var _x_scale = 0.6;
    draw_sprite_ext(spr_red_x, 0, close_button_x, close_button_y, _x_scale, _x_scale, 0, c_white, 1);
}
