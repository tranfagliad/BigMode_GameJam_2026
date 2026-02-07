
image_speed = 0;
note_id = "vault_secret_document";
reading_sprite = spr_moms_note;   // TODO: Replace with recipe note sprite



image_xscale = 0.5;
image_yscale = 0.5;
target_scale = 1.0;
pop_speed = 0.1;



is_reading = false;
anim_state = "hidden";
anim_y = display_get_gui_height();
target_y = 65;
lerp_speed = 0.15;

close_button_x = 0;
close_button_y = 0;
close_button_size = sprite_get_width(spr_red_x);
