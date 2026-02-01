
if (room == rm_MainMenu) {
	exit;
}



var _draw_x = wallet_x - sway_x;
var _frame = is_open ? 1 : 0;
draw_sprite_ext(spr_wallet, _frame, _draw_x, current_y, wallet_scale, wallet_scale, 0, c_white, 1);

if (is_open) {
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
}



// Reset color
draw_set_colour(c_white);
