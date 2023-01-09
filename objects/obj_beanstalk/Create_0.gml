init_lerp = 0;

current_rail = -1;
image_xscale = 2;
image_yscale = 2;

// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");

global.clock.AddCycleMethod(function()
{
	
	init_lerp = lerp(init_lerp, 1, 0.1);
	
	// Collision Check
	var _enemy = collision_circle(x,y,sprite_width/4,obj_enemy,false,true);
	if(_enemy && !_enemy.destroyed && current_rail == _enemy.current_rail) {
		audio_play_sound(snd_enemy_hurt, 0, false, 1, 0, 1);
		_enemy.destroyed = true;
		_enemy.flash_lerp = 1;
		
		// Perform Bean-related Consequences...
		obj_world.stalks--;
		/*
		if(obj_world.stalks <= 0 && !instance_exists(obj_ui_gameover)) {
			with(obj_player) {
				destroyed = true;
				hsp = lengthdir_x(random_range(3, 8), 180);
			}
			obj_world.game_over();
		}
		*/
		instance_destroy();
	}

});