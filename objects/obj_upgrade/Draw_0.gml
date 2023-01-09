draw_sprite_ext(sprite_index, -1, iotaX, iotaY, image_xscale, image_yscale, 0, c_white, 1);

draw_sprite_ext(spr_arrow, -1, iotaX, iotaY - 32*hover_lerp, image_xscale, image_yscale, 0, c_white, hover_lerp);

scribble("[wave]"+string(text))
	.align(fa_center, fa_center)
	.blend(c_white, hover_lerp)
	.draw(x, y - 48*hover_lerp);