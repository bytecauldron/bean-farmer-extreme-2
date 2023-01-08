scribble(text)
	.align(fa_center,fa_center)
	.draw(SW/2+random_range(-shake_lerp, shake_lerp),SH/2+random_range(-shake_lerp, shake_lerp));
	
scribble("[font_press_start][scale,2]FINAL SCORE: " + string(obj_world.current_score))
	.align(fa_center,fa_center)
	.draw(SW/2+random_range(-shake_lerp, shake_lerp),SH/1.5+random_range(-shake_lerp, shake_lerp));

scribble("[font_press_start]Press [c_orange]E[/c] to bean again.\n\nPress [c_orange]ESC[/c] to go back.")
	.align(fa_center,fa_center)
	.draw(SW/2+random_range(-shake_lerp, shake_lerp),SH/1.25+random_range(-shake_lerp, shake_lerp));