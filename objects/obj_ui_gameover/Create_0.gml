text = "[font_press_start][scale,4]BEANED";

shake_lerp	= 25;
//init_delay	= 100;

// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");

global.clock.AddCycleMethod(function()
{
	if(shake_lerp != 0) shake_lerp = lerp(shake_lerp, 0, 0.05);
	
	if(input_check_pressed("select")) {
		room_restart();	
	}
	
	if(input_check_pressed("back")) {
		audio_stop_all();
		room_goto(rm_menu);
	}

});