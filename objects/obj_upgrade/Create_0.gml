image_xscale			= 2;
image_yscale			= 2;

grav					= 1;
vsp						= 0;
hsp						= 0;

player_proximity		= 32;
hover_lerp				= 0;

// Different in every child object.
text					= "Upgrade Description";
function upgrade() {
	
	// Example of an upgrade.
	if(obj_player.fire_timer_max > 1) {
		obj_player.fire_timer_max -= 1;
	}

}

global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");
global.clock.VariableInterpolate("image_angle", "iota_image_angle");

function run_upgrade_step() {
	
	if(distance_to_object(obj_player) < player_proximity) {
		
		hover_lerp = lerp(hover_lerp, 1, 0.1);
		
		obj_sun.react_lerp = 0.25;
		
		if(input_check_pressed("select")) {
			
			upgrade();
			
			with(obj_upgrade) {
				instance_destroy();
			}
			
			obj_sun.image_index = 0;
			
			audio_play_sound(snd_upgrade, 0, false, 1, 0, 1);
			
			// Next wave
			obj_world.start_wave();
			
		}	

	} else {	
	
		hover_lerp = lerp(hover_lerp, 0, 0.1);
		
	}
	
	y += sin(current_time/500)/4;
	
}


repeat(5) instance_create_layer(x, y, "Instances", obj_fx_dust);