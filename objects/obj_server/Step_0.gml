//Send him data about all other players
for (var i = 0; i < instance_number(obj_player); i ++){
	var _player = instance_find(obj_player, i);	
	for (var j = 0; j < ds_list_size(sockets); j ++){
		var _socket = sockets[| j];
		send_remote_entity(buffer, _socket, CMD.X, _player, _player.x);
		send_remote_entity(buffer, _socket, CMD.Y, _player, _player.y);
	}
}