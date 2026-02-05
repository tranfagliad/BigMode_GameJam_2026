
if (room == rm_MainMenu) {
    exit;
}



var _draw_x = wallet_x - sway_x;
var _frame = is_open ? 1 : 0;



// Draw the wallet
draw_sprite_ext(spr_wallet, _frame, _draw_x, current_y, wallet_scale, wallet_scale, 0, c_white, 1);



if (is_open)
{
    // Draw the notes peeking out
    for (var i = 0; i < array_length(notes); i++) {
        var _n = notes[i];
        draw_sprite_ext(_n.sprite, floor(_n.frame), _draw_x + _n.offset_x, current_y + _n.offset_y, _n.x_scale, _n.y_scale, 0, c_white, 1);
    }
	
	// Draw the kitchen key if the player has it
	if (array_contains(global.inventory, "kitchen_key")) {
		draw_sprite_ext(spr_kitchen_key, 0, _draw_x, current_y, 2, 2, 0, c_white, 1);
	}
    
	// Draw the ID mugshot
	draw_sprite_ext(spr_character_mugshot, slickness_level, _draw_x-180, current_y+252, 1, 1, 0, c_white, 1);
	
    // ID Text Details
    draw_set_colour(c_black);
    draw_set_font(fnt_id_name);
    draw_text(_draw_x - 215, current_y + 290, last_name);
    draw_text(_draw_x - 215, current_y + 305, first_middle_name);
    
    draw_set_font(fnt_id_smol);
    draw_text(_draw_x - 140, current_y + 215, dl_number_prompt);
    draw_text(_draw_x - 140, current_y + 230, dob_prompt);
    draw_text(_draw_x - 140, current_y + 245, class_prompt);
    draw_text(_draw_x - 140, current_y + 260, expire_prompt);
    draw_text(_draw_x - 215, current_y + 330, sex_prompt);
    draw_text(_draw_x - 215, current_y + 345, hair_prompt);
    draw_text(_draw_x - 215, current_y + 360, eyes_prompt);
    draw_text(_draw_x - 215, current_y + 375, height_prompt);
    draw_text(_draw_x - 215, current_y + 390, weight_prompt);
    
    draw_set_font(fnt_id_smol_bold);
    draw_text(_draw_x - 115, current_y + 215, dl_number);
    draw_text(_draw_x - 115, current_y + 230, dob);
    draw_text(_draw_x - 115, current_y + 245, class);
    draw_text(_draw_x - 115, current_y + 260, expire);
    
    draw_text(_draw_x - 192, current_y + 330, sex);
    draw_text(_draw_x - 192, current_y + 345, hair);
    draw_text(_draw_x - 192, current_y + 360, eyes);
    draw_text(_draw_x - 192, current_y + 375, height);
    draw_text(_draw_x - 192, current_y + 390, weight);
    
    draw_sprite_ext(spr_id_donor_heart, 0, _draw_x - 110, current_y + 375, 0.5, 0.5, 0, c_white, 1);
    draw_set_font(fnt_id_donor);
    draw_set_colour(c_white);
    draw_text(_draw_x - 109, current_y + 383, "DONOR");
	
	// Reset font
	draw_set_font(-1);
}



// Full Screen Note
if (reading_y < gui_h + 500)
{
    var _alpha = clamp(1 - (reading_y / gui_h), 0, 0.7);
    draw_set_alpha(_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1.0);

    var _center_x = gui_w / 2;
    var _note_scale = 6;
    
	// Draw the handwritten note on top
    if (reading_overlay != noone) {
        draw_sprite_ext(reading_overlay, reading_frame, _center_x, reading_y+100, 0.27, 0.27, 0, c_white, 1);
    }

    var _note_w = sprite_get_width(reading_sprite) * _note_scale;
    var _note_h = sprite_get_height(reading_sprite) * _note_scale;
    
    close_x = _center_x + (_note_w / 2) - 30;
    close_y = reading_y+70;
    
	//draw_circle(close_x, close_y, close_radius, false);
    draw_sprite_ext(spr_red_x, 0, close_x, close_y, 0.7, 0.7, 0, c_white, 1);
}



// Reset color
draw_set_colour(c_white);
