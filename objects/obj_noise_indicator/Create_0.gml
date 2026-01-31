
current_noise = 0;
decay_rate = 0.98;  // The closer to 1 this is, the slower the decay rate
wave_timer = 0;

segments = 15;   // Draw the wave line segments from left to right
spacing = 6;



green = #00FF00;
red = #FF0000;

intensity = 0;
intensity_multiplier = 0.05;
intensity_min = 0;
intensity_max = 1;
wave_color = 0;



center_x = display_get_gui_width() - 150;
center_y = display_get_gui_height() - 100;

last_x = 0;
last_y = 0;
this_x = 0;
this_y = 0;

angle = 0;
y_offset = 0;

angle_multiplier = 0.8;

