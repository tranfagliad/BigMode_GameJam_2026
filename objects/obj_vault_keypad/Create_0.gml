
global.keypad_active = true;



gui_w = display_get_gui_width();
gui_h = display_get_gui_height();



ui_scale = 3;
ui_x = gui_w / 2;
ui_y = gui_h / 2;



input_string = "";
correct_code = "5924";
max_digits = 4;



var _sw = sprite_get_width(spr_vault_keypad_UI) * ui_scale;
var _sh = sprite_get_height(spr_vault_keypad_UI) * ui_scale;
var _grid_w = _sw * 0.8; 
var _sp = _grid_w / 3;
var _btn_sz = _sp * 0.8;



// Number Buttons
var _start_x = -(_sp); 
var _start_y = -(_sh * 0.2);
var _vals = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "Clear", "0", "Enter"];
buttons = [];
for (var i = 0; i < array_length(_vals); i++) {
    var _row = floor(i / 3);
    var _col = i % 3;
    var _bx = _start_x + (_col * _sp);
    var _by = _start_y + (_row * _sp);
    array_push(buttons, {
        val: _vals[i],
        x1: _bx - (_btn_sz/2),
        y1: _by - (_btn_sz/2),
        x2: _bx + (_btn_sz/2),
        y2: _by + (_btn_sz/2)
    });
}



// X Button
array_push(buttons, {
    val: "X",
    x1: (_sw/2) - 40, y1: -(_sh/2),
    x2: (_sw/2),      y2: -(_sh/2) + 40
});
