
if (room == rm_MainMenu) {
    fade_alpha = 0;
    transition_state = Transition.Idle;
    exit;
}

transition_state = Transition.Fading_In;
fade_alpha = 1;

zoom_level = 1.0;
var _cam = view_camera[0];
camera_set_view_size(_cam, base_w, base_h);