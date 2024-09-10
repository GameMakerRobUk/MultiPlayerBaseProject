if (keyboard_check_pressed(vk_left)){
	send_key(buffer, socket, KEY.LEFT, true);	
}
if (keyboard_check_released(vk_left)){
	send_key(buffer, socket, KEY.LEFT, false);	
}
if (keyboard_check_pressed(vk_right)){
	send_key(buffer, socket, KEY.RIGHT, true);	
}
if (keyboard_check_released(vk_right)){
	send_key(buffer, socket, KEY.RIGHT, false);	
}