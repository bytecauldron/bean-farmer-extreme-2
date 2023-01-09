image_xscale = 2;
image_yscale = 2;

damage = 1;

hsp = 6;
vsp = 0;

// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");

global.clock.AddCycleMethod(function()
{
	x += hsp;
	y += vsp;
	
	// Collision Check
	var _enemy = collision_circle(x,y,sprite_width/2,obj_enemy,false,true);
	if(_enemy && !_enemy.destroyed) {
		audio_play_sound(snd_enemy_hurt, 0, false, 1, 0, 1);
		
		_enemy.hp -= damage;
		if(_enemy.hp <= 0) {
			obj_world.current_score += _enemy.enemy_points*obj_world.point_multiplier;
			obj_world.score_lerp = 1;
			_enemy.destroyed = true;
		}
		
		_enemy.flash_lerp = 1;
		repeat(5) instance_create_layer(x, y, "Instances", obj_fx_dust);
		instance_destroy();
	}
	
	// Off-Screen Despawn
	if(x > SW) {
		instance_destroy();
	}
	
});