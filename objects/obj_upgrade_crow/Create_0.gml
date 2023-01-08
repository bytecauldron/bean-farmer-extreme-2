event_inherited();

// Different in every child object.
text					= "crow";
function upgrade() {
	
	instance_create_layer(SW/2+random_range(-SW/3,SW/3), SH+sprite_height*2, "Instances", obj_crow);
	audio_play_sound(snd_crow, 0, false);
	
}

global.clock.AddCycleMethod(function()
{

	run_upgrade_step();

});


repeat(5) instance_create_layer(x, y, "Instances", obj_fx_dust);