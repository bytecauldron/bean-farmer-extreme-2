event_inherited();

// Different in every child object.
text					= "Fire Rate Up";
function upgrade() {
	
	if(obj_player.fire_timer_max > 1) {
		obj_player.fire_timer_max -= 1;
	}

}

global.clock.AddCycleMethod(function()
{

	run_upgrade_step();
	
});


repeat(5) instance_create_layer(x, y, "Instances", obj_fx_dust);