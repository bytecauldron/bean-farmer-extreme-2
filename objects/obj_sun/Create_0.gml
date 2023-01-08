react_lerp = 0;
face_timer = 83;

global.clock.VariableInterpolate("x", "iotaX");
global.clock.VariableInterpolate("y", "iotaY");

global.clock.AddCycleMethod(function()
{
	react_lerp = lerp(react_lerp, 0, 0.1);
	
	if(image_index == 1 && instance_exists(obj_ui_gameover)) {
		if(face_timer < 0) {
			image_index = 2;
			react_lerp = 1;
		} else {
			face_timer--;
		}
	}

});