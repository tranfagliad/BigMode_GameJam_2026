
if (room == rm_MainMenu) {
	exit;
}



var _draw_x = wallet_x - sway_x;
var _frame = is_open ? 1 : 0;
draw_sprite_ext(spr_wallet, _frame, _draw_x, current_y, wallet_scale, wallet_scale, 0, c_white, 1);
