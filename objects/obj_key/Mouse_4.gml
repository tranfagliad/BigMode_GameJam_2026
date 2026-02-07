if (global.phone_blocking_input || global.keypad_active) {
    exit;
}

if (!array_contains(global.inventory, key_id))
{
    show_debug_message("Key clicked: " + string(key_id));
    show_debug_message("Has Note: " + string(has_note));
	
	array_push(global.inventory, key_id);
    
    if (has_note)
    {
        anim_state = "opening";
        // Start anim_y off-screen so it has somewhere to slide FROM
        anim_y = display_get_gui_height() + 500; 
        
        is_reading = true;
        global.reading_note = true;
        x = -1000; // Teleport the "world" object away
    } else {
        instance_destroy();
    }
}