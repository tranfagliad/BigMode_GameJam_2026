
if (instance_exists(obj_controller))
{
    if (obj_controller.game_over_triggered) {
        exit; 
    }
}



var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left))
{
    for (var i = 0; i < array_length(buttons); i++)
	{
        var _b = buttons[i];
		
        var _x1 = ui_x + _b.x1;
        var _y1 = ui_y + _b.y1;
        var _x2 = ui_x + _b.x2;
        var _y2 = ui_y + _b.y2;

        if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
            var _val = _b.val;
            
            if (_val == "X") {
                instance_destroy();
            } else if (_val == "Clear") {
                input_string = "";
                //audio_play_sound(snd_keypad_beep, 10, false);
            } else if (_val == "Enter") {
                if (input_string == correct_code)
				{
					global.vault_unlocked = true;
					with(obj_vault)
					{ 
						is_open = true; 
						image_index = 1; 
						if (!instance_exists(obj_vault_note)) {
							var _cx = x + (sprite_width / 2);
							var _cy = y + (sprite_height / 2);
							instance_create_depth(_cx, _cy, depth - 100, obj_vault_note);
						}
					}
        
					// audio_play_sound(snd_vault_open, 10, false);
					instance_destroy();
				} else {
					input_string = "";   // Wrong code
				}
			} else { // Numbers
                if (string_length(input_string) < max_digits) {
                    input_string += _val;
                    //audio_play_sound(snd_keypad_beep, 10, false);
                }
            }
            break;
        }
    }
}
