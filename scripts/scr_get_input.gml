//Controls

right_key = keyboard_check(vk_right);
up_key = keyboard_check(vk_up);
left_key = keyboard_check(vk_left);
down_key = keyboard_check(vk_down);
dash_key = keyboard_check_pressed(ord('C'));
attack_key = keyboard_check_pressed(ord('X'));
pause_key = keyboard_check_pressed(ord('Z'));

// Get axis
x_axis = (right_key - left_key);
y_axis = (down_key - up_key);

// Gamepad input
if (gamepad_is_connected(0)) {
    gamepad_set_axis_deadzone(0, .35);
    x_axis = gamepad_axis_value(0, gp_axislh);
    y_axis = gamepad_axis_value(0, gp_axislv);
    dash_key = gamepad_button_check_pressed(0, gp_face1);
    attack_key = gamepad_button_check_pressed(0, gp_face3);
    pause_key = gamepad_button_check_pressed(0, gp_start);
}
