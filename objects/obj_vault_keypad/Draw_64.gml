
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1.0);



// Draw Keypad Sprite
draw_sprite_ext(spr_vault_keypad_UI, 0, ui_x, ui_y, ui_scale, ui_scale, 0, c_white, 1);



// Draw LCD Text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_lime);
var _lcd_y = ui_y - (sprite_get_height(spr_vault_keypad_UI) * ui_scale * 0.35);
draw_text_transformed(ui_x, _lcd_y, input_string, 2, 2, 0);



for (var i = 0; i < array_length(buttons); i++)
{
    var _b = buttons[i];
    
    var _bx1 = ui_x + _b.x1;
    var _by1 = ui_y + _b.y1;
    var _bx2 = ui_x + _b.x2;
    var _by2 = ui_y + _b.y2;
    var _tx = (_bx1 + _bx2) / 2;
    var _ty = (_by1 + _by2) / 2;

    if (_b.val != "X") {
        var _is_hovering = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _bx1, _by1, _bx2, _by2);
        draw_set_color(_is_hovering ? c_white : c_ltgray);
        draw_rectangle(_bx1, _by1, _bx2, _by2, false); 
        draw_set_color(c_black);
        draw_text_transformed(_tx, _ty, _b.val, 1.2, 1.2, 0);
    } else {
        draw_set_color(c_red);
        draw_rectangle(_bx1-1, _by1+2, _bx2-1, _by2+2, true); // 'true' makes it an outline
        draw_text(_tx-1, _ty-1, "X");
		draw_set_color(c_white);
    }
}
