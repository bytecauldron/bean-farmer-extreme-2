///Step Event of the controller object
global.clock.Tick();

if(keyboard_check_pressed(vk_f12)) room_restart();

if(room == rm_game && instance_exists(obj_world) && !instance_exists(obj_ui_gameover)) {
	
	if(input_check_pressed("back")) {
		
		var _pause = global.clock.GetPause();
		global.clock.SetPause(!_pause);
		
		
		if(!_pause) {
			audio_pause_all();
			audio_play_sound(snd_pause, 0, false);
		} else {
			audio_resume_all();
			audio_play_sound(snd_pause, 0, false);
		}

	}
	
}