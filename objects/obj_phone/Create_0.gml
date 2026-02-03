
gui_h = display_get_gui_height();
phone_scale = 3; 

phone_width = sprite_get_width(spr_phone) * phone_scale;
phone_height = sprite_get_height(spr_phone) * phone_scale;

phone_x = 180; 



// Sliding Up/Down
y_hidden = gui_h - 120;
y_showing = gui_h - 450;
current_y = y_hidden;
lerp_speed = 0.15;
is_hovered = false;



// Side-to-Side Sway
sway_x = 0;
sway_lerp = 0.1;
sway_intensity = 1.5;



// Clock Logic
clock_x_offset = -35;
clock_y_offset = 8;



// Flashlight
flashlight_on = false;
flashlight_btn_x_offset = 21;
flashlight_btn_y_offset = 6;
flashlight_radius = 160;



// Battery Position
battery_x_offset = 33;
battery_y_offset = 6;



// Noise Indication
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

// Vertical offset to place wave on the phone screen
wave_center_y_offset = 18;



// Danger Meter
danger_level = 0;   // 0 to 100, starting at 0
danger_decay = 0.25;
game_over_triggered = false;

danger_bar_width = 70 * phone_scale; 
danger_bar_height = 3 * phone_scale;
danger_x_offset = 15;
danger_y_offset = 25;



// Slickness Meter
slickness_level = 0;   // 0 to 100, TODO: set this to the slickness level from the character creator
slick_x_offset = 15;
slickness_y_offset = 33;
