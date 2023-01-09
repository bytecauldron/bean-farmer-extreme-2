init_lerp = 1;

depth = -999; // lmao
with(obj_crow) {
	
	other.depth = depth - 1;
	
}

randomize();
flip = choose(-1,1);

image_angle = random_range(0,60*flip);

// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");
global.clock.VariableInterpolate("image_angle", "iotaImageAngle");

global.clock.AddCycleMethod(function()
{
	
	init_lerp = lerp(init_lerp, 0, 0.1);
	
	image_angle += sin(current_time/400)/10;
	
});