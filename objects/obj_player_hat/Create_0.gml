depth = obj_player.depth - 1;

target_x = obj_player.x;
target_y = obj_player.y;
y_offset = obj_player.sprite_height/2;

randomize();
grav			= 0.7;
spin_rate		= -random_range(5, 20);
hsp				= lengthdir_x(random_range(3, 8), 180);	
vsp				= lengthdir_y(-8-irandom(2), -90);

// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");
global.clock.VariableInterpolate("image_angle", "iotaImageAngle");

global.clock.AddCycleMethod(function()
{

	if(instance_exists(obj_player)) {

		if(obj_player.destroyed) {
			
			vsp += grav;
			y += vsp;
			x += hsp;
			image_angle -= spin_rate;
			if(y >= SH + sprite_width) instance_destroy();
			
		} else {
			
			target_x = obj_player.x;
			target_y = obj_player.y;
	
			x = lerp(x, target_x, 0.2);
			y = lerp(y, target_y-y_offset, 0.3);
			
			image_angle = obj_player.hsp*10;
			
		}

	}
	

});