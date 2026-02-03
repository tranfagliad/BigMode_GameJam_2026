
// Fade In
alpha = 1;
fade_speed = 0.015;

// Fade Out
is_exiting = false;
target_room = rm_CommonArea;


// Music
music_started = false;
intro_played = false;
music_instance = -1;
music_volume = 0.6;

// Start the intro immediately
music_instance = audio_play_sound(snd_main_menu_intro, 100, false);
audio_sound_gain(music_instance, music_volume, 0);



// Button Settings
btn_x = display_get_gui_width() / 2;
btn_y = display_get_gui_height() / 2 + 50;
btn_w = sprite_get_width(spr_start_button);
btn_h = sprite_get_height(spr_start_button);
btn_hovered = false;



// Credits System
credits = [
    { name: "extonjunior", roles: "- Game Concept & Lore\n- Playtesting & QA" },
    { name: "rocket176", roles: "- Programming\n- HUD & Menu Design" },
    { name: "JoanofSnark", roles: "- Music / SFX\n- Game Mechanics Design" },
    { name: "Ash", roles: "- Artwork\n- Backgrounds" },
    { name: "Mikerio", roles: "- Artwork\n- Backgrounds" }
];

credit_y = display_get_gui_height() - 80;
