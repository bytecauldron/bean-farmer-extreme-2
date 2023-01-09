text = "[font_press_start]It's a topsy-turvy world,[delay,500] and maybe the problems\nof two people don't amount to a hill of beans;[delay,500]\nbut this is our hill.[delay,500].[delay,500]. [delay,1000]and these are our [c_green]beans![/c][delay,1000][scale,1]\n\n-Lt. Frank Drebin";

typist = scribble_typist();
typist.sound([snd_text], 10, 1, 1);
typist.in(0.35, 0.5);

timer = 120;
alpha_lerp = 1;

global.clock.AddCycleMethod(function()
{
	
	if(typist.get_state() == 1) {
		
		timer--;
		if(timer < 0) {
			alpha_lerp = lerp(alpha_lerp, 0, 0.1);
			if(alpha_lerp < 0.01) {
				instance_destroy();
				room_goto(rm_menu);
			}
		}
	}
	
	if(input_check_pressed("select")) {
		room_goto(rm_menu);
	}
	
	
});