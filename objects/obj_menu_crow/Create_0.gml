randomize();
enemy_speed	= random_range(1,2);

image_xscale = 1;
image_yscale = 1;

global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");

global.clock.AddCycleMethod(function()
{

	x -= enemy_speed;
	if(x < -sprite_width-256) instance_destroy(); // Despawn if off-screen.
	
});