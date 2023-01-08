event_inherited();

enemy_speed		= random_range(1,4+obj_world.current_wave/10);

hp				= 10;
enemy_speed		= 0.5;
enemy_points	= 500;

image_xscale = 3;
image_yscale = 3;

global.clock.AddCycleMethod(function()
{

	enemy_step();

});