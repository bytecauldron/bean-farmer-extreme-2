current_rail	= floor(obj_world.rail_count/2);
player_speed	= 6;
hsp				= 0;
react_lerp		= 0;

destroyed		= false;
grav			= 0.7;
spin_rate		= -random_range(5, 20);
vsp				= lengthdir_y(-8-irandom(2), -90);


// Upgradables
fire_timer_max	= 15;
fire_timer		= 0;
bullet_speed	= 6;
trishot			= false;


// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");
global.clock.VariableInterpolate("image_angle", "iotaImageAngle");

global.clock.AddCycleMethod(function()
{

	if(!destroyed) {
	
		if (input_check("left") && x > sprite_width)
		{
			hsp = -player_speed;	
		}
	    if (input_check("right") && x < SW) {
			hsp = player_speed;
		}
		
		hsp = lerp(hsp, 0, 0.25);
		x += hsp;

	    if (input_check_pressed("up")) player_move(-1);
	    if (input_check_pressed("down")) player_move(1);

		y = lerp(y,obj_world.rail_anchor+current_rail*obj_world.rail_distance, 0.3);
	
		// Collision/Death
		var _enemy = collision_circle(x,y,sprite_width/5,obj_enemy,false,true);
		if(_enemy && !_enemy.destroyed) {
			
			destroyed = true;
			hsp = lengthdir_x(random_range(3, 8), 180);	
			_enemy.destroyed = true;
			obj_world.game_over();
			
		}
	
		// Shoot
		if(input_check("shoot")) {
			fire_timer--;
			if(fire_timer < 0) {
				if(trishot) {
					with(instance_create_layer(x, y, "Instances", obj_bullet)) hsp = other.bullet_speed;
					with(instance_create_layer(x, y, "Instances", obj_bullet)) {
						vsp = other.bullet_speed/3;
						hsp = other.bullet_speed;
					}
					with(instance_create_layer(x, y, "Instances", obj_bullet)) {
						vsp = -other.bullet_speed/3;
						hsp = other.bullet_speed;
					}
				} else {
					with(instance_create_layer(x, y, "Instances", obj_bullet)) hsp = other.bullet_speed;
				}
				
				audio_play_sound(snd_player_shoot, 0, false, 1, 0, 1);
				fire_timer = fire_timer_max;
				react_lerp = 0.5;
			
			}
		} else if(fire_timer > 0) {
			fire_timer--;
		}
	} else {
		// Death
		vsp += grav;
		y += vsp;
		x += hsp;
		image_angle -= spin_rate;
		if(y >= SH + sprite_width) instance_destroy();
		obj_camera.shake_lerp = 1;
	}
	
	react_lerp = lerp(react_lerp, 0, 0.2);


	// It's a secret to everyone.
	if(keyboard_check_pressed(vk_f7)) {
	
		sprite_index = spr_dawdle;
		if(instance_exists(obj_player_hat)) obj_player_hat.image_index = 1;
	
	}

});

function player_move(_amount) {
	
	if(_amount < 0 && current_rail != 0) {
		current_rail += _amount;
		react_lerp = 1;
		audio_play_sound(snd_player_move,0,false);
		repeat(5) instance_create_layer(x, y, "Instances", obj_fx_dust);
	} else if(_amount > 0 && current_rail != obj_world.rail_count - 1) {
		current_rail += _amount;
		react_lerp = 1;
		audio_play_sound(snd_player_move,0,false);
		repeat(5) instance_create_layer(x, y, "Instances", obj_fx_dust);
	}

}

// Hat
instance_create_layer(x, y, "Instances", obj_player_hat);