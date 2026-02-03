
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();
wallet_scale = 3; 

wallet_width = sprite_get_width(spr_wallet) * wallet_scale;
wallet_height = sprite_get_height(spr_wallet) * wallet_scale;

wallet_x = gui_w - (wallet_width / 2) - 40; 



// Sliding Up/Down
y_hidden = gui_h - (wallet_height * 0.25);   
y_showing = gui_h - (wallet_height * 0.9); 
current_y = y_hidden;
lerp_speed = 0.15;
is_hovered = false;



// Side-to-Side Sway
sway_x = 0;
sway_lerp = 0.1;
sway_intensity = 1.5;



is_open = false;



// Fake ID Details
dl_number_prompt = "DL:";
dl_number = global.id_details.dl_number;
dob_prompt = "DOB:";
dob = global.id_details.dob;
class_prompt = "Class:";
class = global.id_details.class;
expire_prompt = "Exp:";
expire = global.id_details.expire;
last_name = "SMITH";
first_middle_name = global.id_details.first_middle_name;
sex_prompt = "Sex:";
sex = global.id_details.sex;
hair_prompt = "Hair:";
hair = global.id_details.hair;
eyes_prompt = "Eyes:";
eyes = global.id_details.eyes;
height_prompt = "HGT:";
height = global.id_details.height;
weight_prompt = "WGT:";
weight = global.id_details.weight;




// Note System
notes = [];

// Add the first note: Mom's Note
array_push(notes, {
    sprite: spr_white_note,
    offset_x: 145,
    offset_y: 150,
    x_scale: 2.5,
    y_scale: 0.5,
    frame: 0,
    anim_speed: 0.5,
    w: sprite_get_width(spr_white_note) * 2.5,
    h: sprite_get_height(spr_white_note) * 0.5
});
