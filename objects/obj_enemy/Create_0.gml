current_rail	= -1;
hp				= 1;
enemy_speed		= random_range(0.5,2);
enemy_points	= 10;
destroyed		= false;
grav			= 0.7;
spin_rate		= random_range(5, 20);
hsp				= lengthdir_x(random_range(1, 3), 0);
vsp				= lengthdir_y(-8-irandom(2), -90);
enemy_color		= c_white;

flash_lerp = 0;

global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");
global.clock.VariableInterpolate("image_angle", "iota_image_angle");

global.clock.AddCycleMethod(function()
{
	
	enemy_step();
	
});

function enemy_step() {
	
	if(hp <= 0) destroyed = true;
	if(destroyed) {
		
		vsp += grav;
		y += vsp;
		x += hsp;
		image_angle -= spin_rate;
		if(y >= SH + sprite_width) instance_destroy();

	} else {

		x -= enemy_speed;
		if(x < -sprite_width-256) instance_destroy(); // Despawn if off-screen.
	
	}
	
	flash_lerp = lerp(flash_lerp, 0, 0.25);
	
}