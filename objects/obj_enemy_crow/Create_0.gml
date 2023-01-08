event_inherited();

enemy_speed		= random_range(1,2+obj_world.current_wave/10);

image_xscale = 1;
image_yscale = 1;

global.clock.AddCycleMethod(function()
{

	enemy_step();
	
});