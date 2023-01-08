randomize();

timer			= 60;
grav			= -0.01;
hsp				= lengthdir_x(random_range(-1, 1), 0);
vsp				= lengthdir_y(-random_range(0.1,1), -90);
start_size		= random_range(0.5, 3);
start_alpha		= 1;

// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");

global.clock.AddCycleMethod(function()
{
	
	vsp += grav;
	y += vsp;
	x += hsp;
	
	timer--;
	if(timer < 0) instance_destroy();
	
	start_alpha = lerp(start_alpha, 0, 0.1);

});