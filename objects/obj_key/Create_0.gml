
sprite_index = key_sprite;



// Note Logic
sprite_index = key_sprite;
is_reading = false;
anim_state = "hidden";
anim_y = display_get_gui_height() + 500;
target_y = display_get_gui_height();



close_button_x = 0;
close_button_y = 0;



if (array_contains(global.inventory, key_id)) {
    instance_destroy();
}
