view_enabled = true;
view_set_visible(0, true);
view_set_wport(0, 1280);
view_set_hport(0, 480);

camera = camera_create_view(0, 0, 1280, 480, 0, -1, -1, -1, 0, 0);
view_set_camera(0, camera);

shake_lerp = 0;
shake_max = 5;

// Interpolation
global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");

global.clock.AddCycleMethod(function()
{
	
	shake_lerp = lerp(shake_lerp, 0, 0.25);
	camera_set_view_pos(view_camera[0], x+shake_lerp*random_range(-shake_max,shake_max), y+shake_lerp*random_range(-shake_max,shake_max));

});