// --- MOVE THIS TO THE STEP EVENT ---
var _gh = display_get_gui_height();
var _gw = display_get_gui_width();
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (anim_state == "opening") {
    var _note_target = _gh;
    // We use target_y as the starting point in Create, so anim_y needs to move
    anim_y = lerp(anim_y, _note_target, 0.15);
    
    if (abs(anim_y - _note_target) < 1) {
        anim_y = _note_target;
        anim_state = "reading";
    }
} 
else if (anim_state == "closing") {
    anim_y = lerp(anim_y, _gh + 800, 0.15);
    if (anim_y > _gh + 750) {
        instance_destroy();
    }
}

if (anim_state != "hidden")
{
    var _x_scale = 0.6;
    var _btn_sz = sprite_get_width(spr_red_x) * _x_scale;
    
    close_button_x = _gw - 300;
    
    if (anim_state == "opening" || anim_state == "reading") {
        close_button_y = 80;
    } else {
        close_button_y = anim_y - _gh;
    }

    if (anim_state == "reading" && mouse_check_button_pressed(mb_left)) {
        if (point_in_rectangle(_mx, _my, close_button_x-20, close_button_y-20, close_button_x+_btn_sz+20, close_button_y+_btn_sz+20)) {
            anim_state = "closing";
            global.reading_note = false;
        }
    }
}
