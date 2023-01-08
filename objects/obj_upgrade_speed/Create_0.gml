event_inherited();

// Different in every child object.
text					= "Left/Right Speed Up";
function upgrade() {
	
	if(obj_player.player_speed < 10) {
		obj_player.player_speed += 0.25;
	}

}

global.clock.AddCycleMethod(function()
{

	run_upgrade_step();
	
});


repeat(5) instance_create_layer(x, y, "Instances", obj_fx_dust);