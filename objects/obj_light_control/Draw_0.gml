// Get Camera Properties
var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
var _cam_w = camera_get_view_width(_cam);
var _cam_h = camera_get_view_height(_cam);

// 2. Ensure surface exists
if (!surface_exists(darkness_surface)) {
    darkness_surface = surface_create(_cam_w, _cam_h);
}

surface_set_target(darkness_surface);

    // Draw the darkness
    draw_clear_alpha(c_black, darkness_alpha);
    
    // Flashlight Punch-through
    if (instance_exists(obj_phone)) {
        if (obj_phone.flashlight_on) {
            gpu_set_blendmode(bm_subtract);
            var _lx = mouse_x - _cam_x;
            var _ly = mouse_y - _cam_y;
            draw_circle_color(_lx, _ly, obj_phone.flashlight_radius, c_white, c_black, false);
            gpu_set_blendmode(bm_normal);
        }
    }

surface_reset_target();
draw_surface(darkness_surface, _cam_x, _cam_y);
