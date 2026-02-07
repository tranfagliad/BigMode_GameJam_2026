
if (overworld_sprite != noone) {
    draw_sprite_ext(overworld_sprite, 0, x, y, 1, 1, note_angle, c_white, 1);
} else {
    draw_self();
}
