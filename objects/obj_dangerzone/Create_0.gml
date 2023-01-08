global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");
global.clock.VariableInterpolate("image_angle", "iotaImageAngle");

global.clock.AddCycleMethod(function()
{
	
	var _enemy = collision_rectangle(x,y,x+sprite_width,y+sprite_height,obj_enemy,false,true);
	if(_enemy && !instance_exists(obj_ui_gameover)) {
		with(obj_player) {
			destroyed = true;
			hsp = lengthdir_x(random_range(3, 8), 180);
		}
		obj_world.game_over();
	}

});