event_inherited();

// Different in every child object.
text					= "Random Beanstalk";
function upgrade() {
	
	var _random_rail = irandom(obj_world.rail_count-1);
	
	with(instance_create_layer(obj_world.stalk_xoffset+random_range(128,SW/2), obj_world.rail_anchor+_random_rail*obj_world.rail_distance,"Instances",obj_beanstalk)) {
		current_rail = _random_rail;
	}

}

global.clock.AddCycleMethod(function()
{

	run_upgrade_step();
	
});


repeat(5) instance_create_layer(x, y, "Instances", obj_fx_dust);