
// Ensure surface exists
if (!surface_exists(darkness_surface)) {
    darkness_surface = surface_create(room_width, room_height);
}

// Start drawing to the surface, not the screen
surface_set_target(darkness_surface);

// Draw the darkness
draw_clear_alpha(c_black, darkness_alpha);
	
// Flashlight
if (instance_exists(obj_phone)) {
    if (obj_phone.flashlight_on) {
        gpu_set_blendmode(bm_subtract);
            
        // Draw a circle to erase the black
        draw_circle_color(mouse_x, mouse_y, obj_phone.flashlight_radius, c_white, c_black, false);
        gpu_set_blendmode(bm_normal);
    }
}

surface_reset_target();

// Draw the actual surface to the screen
draw_surface(darkness_surface, 0, 0);
