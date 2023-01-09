show_debug_overlay(false);

#macro SW surface_get_width(application_surface)
#macro SH surface_get_height(application_surface)

// Create Event of the controller object
global.clock = new IotaClock();
global.clock.SetUpdateFrequency(60);

// Scribble
scribble_font_set_default("font_press_start");

room_goto(rm_splash);