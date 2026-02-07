
// Draw ID
draw_sprite_ext(char_sprite, char_index, char_x, char_y, id_scale, id_scale, 0, c_white, 1);

// Draw Mugshot
draw_sprite_ext(spr_character_mugshot, slickness_level, mug_x, mug_y, mug_scale, mug_scale, 0, c_white, 1);


// Draw Slickness Slider
var _sep = slick_bar_width / 2;
var _left = slick_bar_x - _sep;
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Draw the Bar
draw_set_color(c_dkgray);
draw_line_width(_left, slick_bar_y, _left + slick_bar_width, slick_bar_y, 4);

// Draw the Selection Levels
for (var i = 0; i < 3; i++) {
    var _dot_x = _left + (_sep * i);
    var _is_hovered = point_in_circle(_mx, _my, _dot_x, slick_bar_y, 25);
    if (slickness_level == i) {
        draw_set_color(c_white);
        draw_circle(_dot_x, slick_bar_y, 12, false); 
    } else {
        draw_set_color(_is_hovered ? c_white : c_gray);
        draw_circle(_dot_x, slick_bar_y, 8, false);
    }
}

draw_set_halign(fa_center);
draw_set_color(c_white);

if (slickness_level == 0) {
	draw_set_font(fnt_character_creator_1)
} else if (slickness_level == 1) {
	draw_set_font(fnt_character_creator_2)
} else {
	draw_set_font(fnt_character_creator_3);
}
draw_text(slick_bar_x, slick_bar_y - 80, "Slickness Level");



// Draw the Header Details Block
draw_set_halign(fa_left);
draw_set_color(c_black);

var _h_labels = ["DL NO", "DOB", "CLASS", "EXP"];
var _h_vals = [
    global.id_details.dl_number,
    global.id_details.dob,
    global.id_details.class,
    global.id_details.expire
];

for (var i = 0; i < array_length(_h_labels); i++) {
    var _hyy = header_y + (i * header_line_height);
    draw_set_font(fnt_id_text);
    draw_text(header_x, _hyy, _h_labels[i] + ":");
    draw_set_font(fnt_id_text_bold);
    draw_text(header_x + header_column_offset, _hyy, _h_vals[i]);
}



// Draw the ID Details Block
var _current_data = preset_id_details[slickness_level];
draw_set_halign(fa_left);
draw_set_color(c_black);

draw_set_font(fnt_id_name_big);
draw_text(details_x, details_y - 40, _current_data.last_name);
draw_text(details_x, details_y, _current_data.first_middle_name);

var _vals = [
    _current_data.last_name, 
    _current_data.first_middle_name, 
    _current_data.sex, 
    _current_data.hair, 
    _current_data.eyes, 
    _current_data.height, 
    _current_data.weight
];

for (var i = 2; i < array_length(details_labels); i++) {
    var _yy = details_y + (i * details_line_height);
    
	draw_set_font(fnt_id_text);
    draw_text(details_x, _yy, details_labels[i] + ":");
	
	draw_set_font(fnt_id_text_bold);
    draw_text(details_x + details_column_offset, _yy, _vals[i]);
}

draw_sprite_ext(spr_id_donor_heart, 0, donor_x, donor_y, 1, 1, 0, c_white, 1);
draw_set_color(c_white);
draw_set_font(fnt_id_donor_big);
draw_text(donor_x + 1, donor_y + 15, "DONOR");



// Draw Submit Button
draw_sprite_ext(spr_submit_button, submit_hover, submit_x, submit_y, 1, 1, 0, c_white, 1);



// Fade In
if (alpha > 0) {
    draw_set_alpha(alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
