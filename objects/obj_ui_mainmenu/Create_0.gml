text = "[font_press_start][scale,4]BEAN FARMER\nEXTREME 2";

shake_lerp	= 25;
crow_timer  = 60;

enum MENU {
	
	MAIN,
	HOW,
	CREDITS

}
current_menu = MENU.MAIN;

// Audio
audio_play_sound(snd_title, 0, false);
audio_play_sound(mu_menu, 0, true);

// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");

global.clock.AddCycleMethod(function()
{
	
	if(current_menu == MENU.MAIN) {
		
		if(shake_lerp != 0) shake_lerp = lerp(shake_lerp, 0, 0.05);
	
		if(input_check_pressed("select")) {
			audio_stop_sound(mu_menu);
			audio_play_sound(snd_title, 0, false);
			room_goto(rm_game);
		}
		
		if(input_check_pressed("credits")) {
			
			current_menu = MENU.CREDITS;
			
		}
		
		if(input_check_pressed("how")) {
			
			current_menu = MENU.HOW;
			
		}
		
		if(input_check_pressed("back")) {
			game_end();
		}
		
	} else if(current_menu == MENU.CREDITS) {
		
		if(input_check_pressed("back")) {
			current_menu = MENU.MAIN;
		}
			
	} else if(current_menu == MENU.HOW) {
		
		if(input_check_pressed("back")) {
			current_menu = MENU.MAIN;
		}
		
	}
	
	if(crow_timer < 0)  {
		instance_create_layer(SW+64,random_range(64,SH-64),"Instances",obj_menu_crow);
		crow_timer = 60;
	} else {
		crow_timer--;
	}
	
});