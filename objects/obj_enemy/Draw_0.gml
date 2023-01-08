draw_sprite_ext(sprite_index, -1, iotaX, iotaY, image_xscale, image_yscale, iota_image_angle, enemy_color, 1);

gpu_set_fog(true, c_white, 0, 1);
draw_sprite_ext(sprite_index, -1, iotaX, iotaY, image_xscale, image_yscale, iota_image_angle, enemy_color, flash_lerp);
gpu_set_fog(false, c_white, 0, 1);