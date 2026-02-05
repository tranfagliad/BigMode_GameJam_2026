
if (sprite_exists(sprite_index)) {
    draw_self(); 
} else {
    // This draws a red box so you can see where the door is during debugging
    // if the sprite is missing!
    //draw_set_color(c_red);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    draw_set_color(c_white);
}
