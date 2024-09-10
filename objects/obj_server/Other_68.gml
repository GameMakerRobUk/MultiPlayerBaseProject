var _event_id = async_load[? "id"];

if (server == _event_id){
	var _type = async_load[? "type"];
	var _socket = async_load[? "socket"];

	//connect
	if (_type == network_type_connect){
		//Create a player, add the socket to the list
		ds_list_add(sockets, _socket);
		
		//Create Player
		var _p = instance_create_layer(100, 100 + (32 * _socket), "Instances", obj_player);
		ds_map_add(clients, _socket, _p);
		
		//Send him data about all other players
		for (var i = 0; i < instance_number(obj_player); i ++){
			var _player = instance_find(obj_player, i);	
			send_remote_entity(buffer, _socket, CMD.X, _player, _player.x);
			send_remote_entity(buffer, _socket, CMD.Y, _player, _player.y);
			send_remote_entity(buffer, _socket, CMD.NAME, _player, _player.name);
			send_remote_entity(buffer, _socket, CMD.SPRITE, _player, _player.sprite_index);
		}
	}
	//Disconnect
	if (_type == network_type_disconnect){
		var _p = clients[? _socket];
		with _p{
			instance_destroy();	
		}
		
		var _pos = ds_list_find_index(sockets, _socket);
		ds_list_delete(sockets, _pos);
		ds_map_delete(clients, _socket);
	}
}else{
	if (_event_id != global.socket){
		var _socket = async_load[? "id"];
		var _buffer = async_load[? "buffer"];
		
		buffer_seek(_buffer, buffer_seek_start, 0);
		var _cmd = buffer_read(_buffer, get_buffer_constant("command"));
		
		var _player = clients[? _socket];
		
		switch (_cmd){
			case PACKET.KEY : {
				with (_player){
					var _key = buffer_read(_buffer, get_buffer_constant("key"));
					var _is_held = buffer_read(_buffer, get_buffer_constant("boolean"));
					keys[_key] = _is_held;
				}
			}; break;
		}
	}
}