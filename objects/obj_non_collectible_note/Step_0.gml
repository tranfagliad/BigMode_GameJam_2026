
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _gh = display_get_gui_height();
var _gw = display_get_gui_width();



// Clicking the Overworld Sprite
if (anim_state == "hidden" && !global.reading_note && mouse_check_button_pressed(mb_left))
{
    var _w = sprite_get_width(overworld_sprite);
    var _h = sprite_get_height(overworld_sprite);
    if (point_in_rectangle(mouse_x, mouse_y, x - _w/2, y - _h/2, x + _w/2, y + _h/2))
    {
        anim_state = "opening";
        is_reading = true;
        global.reading_note = true;
        audio_play_sound(snd_note, 10, false);
    }
}



// Animation
if (anim_state == "opening")
{
    anim_y = lerp(anim_y, target_y, lerp_speed);
    if (abs(anim_y - target_y) < 1) {
        anim_y = target_y;
        anim_state = "reading";
    }
} 
else if (anim_state == "closing")
{
    anim_y = lerp(anim_y, _gh + 800, lerp_speed);
    if (anim_y > _gh + 750) {
        anim_state = "hidden";
        is_reading = false;
        global.reading_note = false;
    }
}



// Red X
if (anim_state != "hidden")
{
    if (anim_state != "hidden")
	{
	    var _x_scale = 0.6;
	    var _note_x = _gw * gui_target_x_percent; 
	    var _sw = sprite_get_width(reading_sprite) * note_scale_gui;
	    var _sh = sprite_get_height(reading_sprite) * note_scale_gui;
    
	    close_button_size = sprite_get_width(spr_red_x) * _x_scale;
	    close_button_x = _note_x + (_sw / 2) - close_button_size;
	    close_button_y = anim_y - _sh + 20;

	    if (anim_state == "reading" && mouse_check_button_pressed(mb_left))
	    {
	        var _p = 20;
	        if (point_in_rectangle(_mx, _my, close_button_x - _p, close_button_y - _p, 
	                               close_button_x + close_button_size + _p, 
	                               close_button_y + close_button_size + _p))
	        {
	            anim_state = "closing";
	            var _snd = audio_play_sound(snd_note, 10, false);
	            audio_sound_pitch(_snd, 0.5);
	        }
	    }
	}
}
