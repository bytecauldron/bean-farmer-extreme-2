current_score	= 0;
score_lerp		= 0;

// Wave System
wave_active = false;
current_wave = 1;

enemy_types = [obj_enemy_crow];
enemy_count_max = 50;
enemy_count = enemy_count_max;

point_multiplier = 1;

// Upgrades
upgrades = [obj_upgrade_firerate,
			obj_upgrade_speed,
			obj_upgrade_beanstalk,
			obj_upgrade_trishot,
			obj_upgrade_crow];

// Audio
music = undefined;
music_countdown_to_loop = false;
//music_wave_loop_timer = 11280;
music_wave_loop_timer = 11330;

// Rails
rail_anchor		= SH/1.5;
rail_count		= 5;
rail_distance	= 32;

// Player
instance_create_layer(SW/2,rail_anchor+floor(rail_count/2)*rail_distance,"Instances",obj_player);

// Bean Stalks
stalks		   = rail_count;
stalk_xoffset  = 240;
stalk_xpadding = 72;

for (var i = 0; i < rail_count; i++) {
	with(instance_create_layer(stalk_xoffset+stalk_xpadding*2-(i*stalk_xpadding),rail_anchor+i*rail_distance,"Instances",obj_beanstalk)) {
		current_rail = i;
	}
}

emeny_timer_max = 10;
enemy_timer = emeny_timer_max;
enemy_spawn_xoffset = 32;
randomize();

global.clock.AddCycleMethod(function()
{
	if(wave_active) {
		if(enemy_count <= 0) {
			// Wait until last enemies are gone.
			if(!instance_exists(obj_enemy) && !instance_exists(obj_ui_gameover)) {
				break_time();
			}
		} else {
			if(enemy_timer < 0) {
				chosen_rail = irandom_range(0,rail_count-1);
				
				with(instance_create_layer(SW+enemy_spawn_xoffset,rail_anchor+chosen_rail*rail_distance,"Instances",enemy_types[0])) {
					current_rail = other.chosen_rail;
				}
				
				if(irandom(400-current_wave) == 1) {
				
					with(instance_create_layer(SW+enemy_spawn_xoffset,rail_anchor+chosen_rail*rail_distance,"Instances",obj_enemy_mega)) {
						current_rail = other.chosen_rail;
					}

				}
				
				enemy_timer = emeny_timer_max;
				enemy_count--;
			} else {
				enemy_timer--;
			}		
		}
	}
	
	score_lerp = lerp(score_lerp, 0, 0.2);
	
	if(music_countdown_to_loop) {
		if(music_wave_loop_timer <= 0) {
			music = audio_play_sound(mu_wave_loop, 0, true, 1, 0, 1);
			if(!wave_active) {
				audio_sound_gain(music, 0.5, 0);	
			}
			music_countdown_to_loop = false;
		} else {
			music_wave_loop_timer--;
		}
		//show_debug_message(string(music_wave_loop_timer))	
	}
	
});

function game_over() {
	audio_play_sound(mu_gameover, 0, false, 1, 0, 1);
	audio_stop_sound(music);
	instance_create_layer(x, y, "Instances", obj_ui_gameover);
	
	// Sun
	with(obj_sun) {
		
		image_index = 1;
		react_lerp = 1;
		
	}
	
}

function break_time() {
	
	//if(music != undefined) audio_stop_sound(music);
	//if(amb != undefined) audio_stop_sound(amb);
	audio_sound_gain(music, 0.5, 1000);

	audio_play_sound(snd_victory, 0, false);

	wave_active = false;
	var _upgrade_xpadding = 128;
	
	//show_debug_message("Break started.");
	
	// Spawn Upgrades
	for (var i = 0; i < 3; i++) {

		instance_create_layer(SW/2.52+i*_upgrade_xpadding, SH/1.75, "Instances", upgrades[irandom(array_length(upgrades) - 1)]);
		
	}
	
	
}

function start_wave() {
	
	current_wave++;
	
	enemy_types = [obj_enemy_crow];
	enemy_count_max += 25;
	enemy_count = enemy_count_max;
	wave_active = true;

	audio_sound_gain(music, 1, 1000);

}

// Start First Wave
instance_create_layer(x, y, "Instances", obj_ui_ready);
