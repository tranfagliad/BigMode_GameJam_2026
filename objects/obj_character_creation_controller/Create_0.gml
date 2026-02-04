
// Fade In/Out
alpha = 1;
fade_speed = 0.02;
is_fading_out = false;



// Submit Button
submit_x = display_get_gui_width() - 150;
submit_y = display_get_gui_height() - 100;
submit_hover = 0;
sw = sprite_get_width(spr_submit_button);
sh = sprite_get_height(spr_submit_button);



// Character Settings
char_x = display_get_gui_width() / 2;
char_y = (display_get_gui_height() / 2) + 50; 
char_sprite = spr_character_id;
char_index = 0;



// Slickness Slider Settings
slickness_level = 0;
slick_bar_x = 640;
slick_bar_y = 140;
slick_bar_width = 300;



// ID
id_scale = 2;
mug_scale = 1.7;
mug_x = char_x - 84;
mug_y = char_y - 132;



// Selected Slickness ID Details
global.id_details = {
	slickness_level: 0,
	
	dl_number: "12345678",
	dob: "01/04/1989",
	class: "C",
	expire: "01/04/2027",
	
	last_name: "",
	first_middle_name: "",
	sex: "",
	hair: "",
	eyes: "",
	height: "",
	weight: ""
};

// Preset ID Details
preset_id_details = [
	{
		last_name: "DOE",
		first_middle_name: "JOHN ALAN",
		sex: "LMAO NO",
		hair: "Lame",
		eyes: "Blindfolded",
		height: "Short",
		weight: "Average"
	},
	{
		last_name: "WAKE",
		first_middle_name: "JOHN ALAN",
		sex: "MAYBE",
		hair: "Exists",
		eyes: "Has 2",
		height: "6' 7\"",
		weight: "Large"
	},
	{
		last_name: "SMITH",
		first_middle_name: "WILL SLICK",
		sex: "YES",
		hair: "Slickback",
		eyes: "20/20",
		height: "Tall",
		weight: "BIGMODE"
	}
];



// ID Details Positioning
header_x = mug_x + 75; 
header_y = mug_y - 40;
header_column_offset = 65;
header_line_height = 28;

details_x = mug_x - 60;
details_y = mug_y + 110;
details_column_offset = 60;
details_line_height = 28;

details_labels = ["LAST NAME", "FIRST/MID", "SEX", "HAIR", "EYES", "HGT", "WGT"];



// Donor Heart
donor_x = char_x + 80;
donor_y = char_y + 110;
