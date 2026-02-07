
var _gh = display_get_gui_height();
var _gw = display_get_gui_width();
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);



// Animation
if (anim_state == "opening") {
    var _note_target = _gh;
    anim_y = lerp(anim_y, _note_target, 0.15);
    
    if (abs(anim_y - _note_target) < 1) {
        anim_y = _note_target;
        anim_state = "reading";
    }
} 
else if (anim_state == "closing") {
    anim_y = lerp(anim_y, _gh + 600, 0.15);
    if (anim_y > _gh + 550) {
        instance_destroy();
    }
}



// Red X Logic
if (anim_state != "hidden")
{
    var _n_scale = 1.0; 
    var _n_w = sprite_get_width(reading_sprite) * _n_scale;
    var _btn_sz = sprite_get_width(spr_red_x) * 0.6;
    

    close_button_x = (_gw / 2) + (_n_w / 2) - _btn_sz;
    if (anim_state == "opening" || anim_state == "reading") {
        close_button_y = 60;
    } else {
        close_button_y = anim_y - _gh + 60;
    }

    if (anim_state == "reading" && mouse_check_button_pressed(mb_left)) {
        if (point_in_rectangle(_mx, _my, close_button_x-20, close_button_y-20, close_button_x+_btn_sz+20, close_button_y+_btn_sz+20)) {
            anim_state = "closing";
            global.reading_note = false;
        }
    }
}
