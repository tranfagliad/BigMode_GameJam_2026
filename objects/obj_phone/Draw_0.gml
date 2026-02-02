
if (flashlight_on)
{
    gpu_set_blendmode(bm_add); 
    draw_set_alpha(0.3);
    draw_circle_color(mouse_x, mouse_y, flashlight_radius, c_white, c_black, false);
    draw_set_alpha(1.0);
    gpu_set_blendmode(bm_normal);
}
