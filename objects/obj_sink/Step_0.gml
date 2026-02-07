
if (global.phone_blocking_input || global.wallet_blocking_input) {
    exit;
}



// Animation
if (is_on) {
    image_index += anim_speed;
    if (image_index >= 8) { 
        image_index = 4;
    }
} else {
    image_index = 0;
}

// 3. Noise Mechanic (As we discussed earlier)
//if (is_on) {
    // Adding noise over time while running
//    global.current_noise = clamp(global.current_noise + 0.05, 0, 30);
//}