event_inherited();

// Different in every child object.
text					= "3 Bullets";
function upgrade() {
	
	obj_player.trishot = true;
	
	for(var i = 0; i < array_length(obj_world.upgrades); i++) {
		if(obj_world.upgrades[i] == obj_upgrade_trishot) {
			show_debug_message("deleted!")
			array_delete(obj_world.upgrades, i, 1);	
		}
	}

}

global.clock.AddCycleMethod(function()
{

	run_upgrade_step();

});


repeat(5) instance_create_layer(x, y, "Instances", obj_fx_dust);