if (keyboard_check_pressed(vk_down)){
	cur_index ++;	
}
if (keyboard_check_pressed(vk_up)){
	cur_index --;	
}
cur_index = clamp(cur_index, 0, array_length(menu) - 1);

if (keyboard_check_pressed(vk_enter)){
	switch cur_index{
		case 0 : {
			show_debug_message("Creating Game")
			instance_create_layer(0,0,"Instances", obj_server);	
			room_goto(rm_game);
		}break;
		case 1 : {
			room_goto(rm_game);
		}; break;
		case 2 : {
			game_end();	
		}; break;
	}	
}