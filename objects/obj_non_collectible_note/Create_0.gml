
// See Variable Definitions
// overworld_sprite (The sprite on the wall/desk)
// reading_sprite   (The high-detail version of the note)



is_reading = false;
close_button_x = 0;
close_button_y = 0;
close_button_size = sprite_get_width(spr_red_x);



// Animation Variables
anim_y = display_get_gui_height();
target_y = 65;
anim_state = "hidden";
lerp_speed = 0.15;
