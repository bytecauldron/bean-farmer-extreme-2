//Input defines the default profiles as a macro called 
//This macro is parsed when Input boots up and provides the baseline bindings for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The root struct called INPUT_DEFAULT_PROFILES contains the names of each default profile
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

INPUT_DEFAULT_PROFILES = {
    
    keyboard_and_mouse:
    {
        up:    [input_binding_key(vk_up),    input_binding_key("W")],
        down:  [input_binding_key(vk_down),  input_binding_key("S")],
        left:  [input_binding_key(vk_left),  input_binding_key("A")],
        right: [input_binding_key(vk_right), input_binding_key("D")],
        
        shoot:  input_binding_key(vk_space),
		select: input_binding_key("E"),
		credits: input_binding_key("C"),
        back: input_binding_key(vk_escape),
		how: input_binding_key("H"),
    },
    
    gamepad:
    {
        up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
        down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
        left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
        right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
        
        shoot:  input_binding_gamepad_button(gp_face3),
		select: input_binding_gamepad_button(gp_face2),
		credits: input_binding_gamepad_button(gp_face1),
        back: input_binding_gamepad_button(gp_face4),
		how: input_binding_gamepad_button(gp_select),

    },
    
};

//Names of the default profiles to use when automatically assigning profiles based on the source that a
//player is currently using. Default profiles for sources that you don't intend to use in your game do
//not need to be defined
#macro INPUT_AUTO_PROFILE_FOR_KEYBOARD     "keyboard_and_mouse"
#macro INPUT_AUTO_PROFILE_FOR_MOUSE        "keyboard_and_mouse"
#macro INPUT_AUTO_PROFILE_FOR_GAMEPAD      "gamepad"
#macro INPUT_AUTO_PROFILE_FOR_MIXED        "mixed"
#macro INPUT_AUTO_PROFILE_FOR_MULTIDEVICE  "multidevice"

//Toggles whether INPUT_KEYBOARD and INPUT_MOUSE should be considered a single source at all times
//For most PC games you'll want to tie the keyboard and mouse together but occasionally having them
//separated out is useful
#macro INPUT_ASSIGN_KEYBOARD_AND_MOUSE_TOGETHER  true

//Whether to allow default profiles (see below) to contain different verbs. Normally every profile
//should contain a reference to every verb, but for complex games this is inconvenient
#macro INPUT_ALLOW_ASSYMMETRIC_DEFAULT_PROFILES  true