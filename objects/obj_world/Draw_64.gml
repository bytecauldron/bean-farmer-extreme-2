if(!instance_exists(obj_ui_gameover)) {
	scribble("[font_press_start][scale,2]"+string(current_score)).align(fa_center, fa_center).draw(SW/2+score_lerp*random_range(-5,5),32+score_lerp*random_range(-5,5));
	scribble("[font_press_start]Wave: " + string(current_wave) + " - Remaining: " + string(instance_number(obj_enemy))).align(fa_center, fa_center).draw(SW/2,64);
}