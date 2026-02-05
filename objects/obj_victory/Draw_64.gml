draw_set_alpha(text_alpha);
draw_set_font(fnt_game_over);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(gui_w / 2, (gui_h / 2) - 50, "MISSION ACCOMPLISHED", 1.5, 1.5, 0);

draw_set_font(fnt_victory_message);
draw_set_color(c_white);
draw_text(gui_w / 2, (gui_h / 2) + 50, "You escaped with the secret recipe");

// Reset for safety
draw_set_alpha(1.0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
