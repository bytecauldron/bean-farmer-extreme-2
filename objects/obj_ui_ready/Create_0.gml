text			= "[font_press_start][scale,4][shake]GET READY";
shake_lerp		= 120;
timer			= 245;
loopable_music_delay = 165; // This has to be less than the normal timer.

// Play Intro Music
audio_play_sound(mu_ready, 0, false);

// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");


global.clock.AddCycleMethod(function()
{
	
	timer--;
	if(timer < 0) {
		
		obj_world.wave_active = true;
		instance_destroy();

	}
	
	if(loopable_music_delay == 0) {
		
		obj_world.music = audio_play_sound(mu_wave_intro, 0, false);
		obj_world.music_countdown_to_loop = true;
		loopable_music_delay = -1;
		
	} else {
		loopable_music_delay--;
	}

});
