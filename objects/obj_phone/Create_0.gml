
gui_h = display_get_gui_height();
phone_scale = 3;

phone_width  = sprite_get_width(spr_phone) * phone_scale;
phone_height = sprite_get_height(spr_phone) * phone_scale;
phone_x = 30;

screen_center = phone_x + (phone_width / 2);

y_hidden  = gui_h - 120;
y_showing = gui_h - (phone_height - 20);

current_y = y_hidden;
lerp_speed = 0.15;
is_hovered = false;




current_noise = 0;
decay_rate = 0.98;
wave_timer = 0;
segments = 21;
spacing = 4 * phone_scale;
green = #00FF00;
red = #FF0000;

intensity_multiplier = 0.05;
intensity_min = 0;
intensity_max = 1;


wave_center_x_offset = phone_width / 2; 
wave_center_y_offset = 90;
