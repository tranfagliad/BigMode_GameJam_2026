
// Fade the text in
if (text_alpha < 1) {
    text_alpha += text_fade_speed;
}



// Wait, then return to the main menu
if (display_timer > 0) {
    display_timer--;
} else {
    room_goto(rm_MainMenu);
}
