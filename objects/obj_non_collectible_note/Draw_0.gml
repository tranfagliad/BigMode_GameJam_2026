
if (overworld_sprite != noone) {
    draw_sprite_ext(overworld_sprite, 0, x, y, 0.5, 0.5, note_angle, c_white, 1);
} else {
    draw_self();
}
