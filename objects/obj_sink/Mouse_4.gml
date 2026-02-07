
is_on = !is_on;



// Handle the animation and sound
if (is_on) {
    image_speed = 1;
    
    if (variable_instance_exists(id, "running_sound") && running_sound != noone) {
        audio_play_sound(running_sound, 10, true);
    }
} else {
    image_speed = 0; // Stop animation
    image_index = 0; // Return to the "Dry" frame
    
    // Stop the specific sound
    if (variable_instance_exists(id, "running_sound")) {
        audio_stop_sound(running_sound);
    }
}

show_debug_message("Sink is now: " + (is_on ? "ON" : "OFF"));
