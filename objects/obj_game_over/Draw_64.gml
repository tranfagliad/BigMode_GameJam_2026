


// Draw the text
draw_set_alpha(text_alpha);
draw_set_font(fnt_game_over);
draw_set_color(c_red);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(gui_w / 2, gui_h / 2, "YOU WERE CAUGHT", 2, 2, 0);

// Reset for safety
draw_set_alpha(1.0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
