
// Fade the text in
if (text_alpha < 1) {
    text_alpha += text_fade_speed;
}



// Wait a few seconds then go back to Main Menu
if (display_timer > 0) {
    display_timer--;
}
else {
    room_goto(rm_MainMenu);
}
