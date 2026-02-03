
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);



// Slider Interaction
var _sep = slick_bar_width / 2;
var _left = slick_bar_x - _sep;

for (var i = 0; i < 3; i++) {
    var _dot_x = _left + (_sep * i);
    
    if (mouse_check_button_pressed(mb_left)) {
        if (point_in_circle(_mx, _my, _dot_x, slick_bar_y, 25)) {
            slickness_level = i;
            // audio_play_sound(snd_click, 10, false);
        }
    }
}



// Hover and click the submit button
if (point_in_rectangle(_mx, _my, submit_x - sw/2, submit_y - sh/2, submit_x + sw/2, submit_y + sh/2)) {
    submit_hover = 1;
    if (mouse_check_button_pressed(mb_left)) {
		global.id_details.slickness_level = slickness_level;
		global.id_details.last_name = preset_id_details[slickness_level].last_name;
		global.id_details.first_middle_name = preset_id_details[slickness_level].first_middle_name;
		global.id_details.sex = preset_id_details[slickness_level].sex;
		global.id_details.hair = preset_id_details[slickness_level].hair;
		global.id_details.eyes = preset_id_details[slickness_level].eyes;
		global.id_details.height = preset_id_details[slickness_level].height;
		global.id_details.weight = preset_id_details[slickness_level].weight;
		
		is_fading_out = true;
		//show_debug_message(global.id_details);
    }
} else {
    submit_hover = 0;
}



// Fade Logic
if (is_fading_out) {
    alpha += fade_speed;
    if (alpha >= 1) {
        room_goto(rm_CommonArea);
    }
} else {
    if (alpha > 0) {
        alpha -= fade_speed;
    }
}
