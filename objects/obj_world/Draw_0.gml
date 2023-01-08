draw_set_alpha(0.1);
for(var i = 0; i < rail_count; i++) {
	draw_line_color(0,rail_anchor+i*rail_distance,SW,rail_anchor+i*rail_distance,c_dkgray,c_dkgray);
}

/*
var _perspective_lines = 32;
for(var i = 0; i <= _perspective_lines; i++) {
	draw_line_color(i*SW/_perspective_lines,SH,SW/2,SH/2,c_dkgray,c_dkgray);
}
*/

draw_set_alpha(1);