
if (mouse_check_button_pressed(mb_left)) {
    current_noise += 5;
}

current_noise = clamp(current_noise, 0, 50);
current_noise *= decay_rate;

wave_timer += (0.1 + (current_noise * 0.05));
