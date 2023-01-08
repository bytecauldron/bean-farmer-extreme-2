if(current_menu == MENU.MAIN) {

	scribble("LDJ52")
		.align(fa_center,fa_center)
		.draw(SW/2,SH/4);

	scribble("[c_black]"+text)
		.align(fa_center,fa_center)
		.draw(SW/2+random_range(-shake_lerp, shake_lerp)-6,SH/2+random_range(-shake_lerp, shake_lerp)+6);
	scribble("[rainbow]"+text)
		.align(fa_center,fa_center)
		.draw(SW/2+random_range(-shake_lerp, shake_lerp),SH/2+random_range(-shake_lerp, shake_lerp));

	scribble("[font_press_start][blink]Press [c_orange]E[/c] to bean.")
		.align(fa_center,fa_center)
		.draw(SW/2+random_range(-shake_lerp, shake_lerp),SH/1.3+random_range(-shake_lerp, shake_lerp));

	scribble("[c_orange]C[/c]redits - [c_orange]H[/c]ow to Play")
		.align(fa_center,fa_center)
		.draw(SW/2,SH/1.1);

} else if(current_menu == MENU.CREDITS) {
	
	draw_set_alpha(0.5);
	draw_rectangle_color(SW/2-SW/3.25,0,SW/2+SW/3.25,SH,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	
	scribble("[scale,3]Credits")
		.align(fa_center,fa_center)
		.draw(SW/2,SH/3);
	
	scribble(
			"Programming/Art - @bytecauldron\n" + 
			"Music - Craig Alan Carroll (@CraigAlanNoise)\n\n" +
			"Tools:\nMade in GameMaker 2022\nLibraries: Iota, Input, Scribble\nAseprite for sprites. Bfxr/freesound.org for sounds.\nCrow image by Mike B on Pexels.com\n\n\n" +
			"Press [c_orange]ESC[/c] to go back."
			)
		.align(fa_center,fa_center)
		.draw(SW/2,SH/1.5);
	
}  else if(current_menu == MENU.HOW) {

	draw_set_alpha(0.5);
	draw_rectangle_color(SW/2-SW/3.25,0,SW/2+SW/3.25,SH,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	
	scribble("[scale,3]How to Play")
		.align(fa_center,fa_center)
		.draw(SW/2,SH/3);
	
	scribble(
			"WASD - Move\nSpace - Fire\nE - Select\n\n" +
			"1. Don't let any crows get through.\n\n2. Use beanstalks to defend.\n\n3. Don't get hit.\n\n\n" +
			"Press [c_orange]ESC[/c] to go back.\n\n[shake]CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW CAW[/shake]"
			)
		.align(fa_center,fa_center)
		.draw(SW/2,SH/1.5);
	
	
}