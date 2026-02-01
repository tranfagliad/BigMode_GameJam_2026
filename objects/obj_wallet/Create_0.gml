
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
dl_number = "12345678";
dob_prompt = "DOB:";
dob = "01/04/1989";
class_prompt = "Class:";
class = "C";
expire_prompt = "Exp:";
expire = "01/04/2027";
last_name = "SMITH";
first_middle_name = "JOHN SLICK";
sex_prompt = "Sex:";
sex = "YES";
hair_prompt = "Hair:";
hair = "Slickback";
eyes_prompt = "Eyes:";
eyes = "HAS 2";
weight_prompt = "WGT:";
weight = "BIGMODE";
height_prompt = "HGT:";
height = "6'-7\"";
