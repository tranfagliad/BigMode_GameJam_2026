
image_xscale = lerp(image_xscale, target_scale, pop_speed);
image_yscale = lerp(image_yscale, target_scale, pop_speed);

y += sin(get_timer() * 0.000005) * 0.2;
