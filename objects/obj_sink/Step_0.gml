
if (global.phone_blocking_input || global.wallet_blocking_input) {
    exit;
}



if (is_on) 
{
    image_index += anim_speed;
    if (image_index >= 8) {
		image_index = 4;
	}

    if (instance_exists(obj_phone)) 
    {
        with(obj_phone)
		{
            current_noise = clamp(current_noise + 5.0, 0, 30);
            danger_level = clamp(danger_level + 0.8, 0, 100);
        }
    }

    var _water_x1 = x - 20;
    var _water_x2 = x + 20;
    var _water_y1 = y + 10;
    var _water_y2 = y + 80; 

    if (point_in_rectangle(mouse_x, mouse_y, _water_x1, _water_y1, _water_x2, _water_y2)) 
    {
        if (global.id_details.slickness_level > 0) 
        {
            global.id_details.slickness_level -= 0.1; 
        }
    }
} 
else 
{
    image_index = 0;
}