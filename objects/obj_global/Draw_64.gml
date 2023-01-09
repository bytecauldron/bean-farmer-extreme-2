if(global.clock.GetPause()) {

	draw_set_alpha(0.5);
	draw_rectangle_color(0,0,SW,SH,false,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	
	scribble("PAUSED")
	.align(fa_center,fa_center)
	.draw(SW/2,SH/2);
	
	
}