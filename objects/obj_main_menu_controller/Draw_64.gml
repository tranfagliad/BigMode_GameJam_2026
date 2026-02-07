
// Title
//draw_set_font(fnt_game_title);
//draw_text_transformed(gui_w / 2, title_y, "One Night at", 1.25, 1.25, 0);
//draw_text_transformed(gui_w / 2, title_y + 50, "Big Tony's", 2, 2, 0);
draw_sprite_ext(spr_game_title, 0, gui_w / 2, title_y, 0.9, 0.9, 0, c_white, 1);


// Draw the Start Button
var _img = btn_hovered ? 1 : 0;
if (is_exiting) {
	_img = 0;
}
draw_sprite_ext(spr_start_button, _img, btn_x, btn_y, 1.2, 1.2, 0, c_white, 1);



// Draw Credits
var _num_people = array_length(credits);

var _total_width = gui_w * 0.75; 
var _start_x = (gui_w - _total_width) / 2;
var _individual_slot = _total_width / (_num_people - 1);

draw_set_valign(fa_top);
draw_set_halign(fa_center);

for (var i = 0; i < _num_people; i++) {
    var _c = credits[i];
    
    var _cx = _start_x + (_individual_slot * i);
    
    draw_set_color(c_white);
    draw_set_font(-1);
    draw_text_transformed(_cx, credit_y, _c.name, 1.2, 1.2, 0);
    draw_text_transformed(_cx, credit_y + 30, _c.roles, 0.9, 0.9, 0);
}



// Draw the Fade
if (alpha > 0) {
    draw_set_alpha(alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_w, display_get_gui_height(), false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}



// Reset color
draw_set_color(c_white);
