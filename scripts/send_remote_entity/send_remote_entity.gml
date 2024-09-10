//send_remote_entity(buffer, _socket, CMD.X, _player, _player.x);
function send_remote_entity(_buffer, _socket, _command, _instance, _value){
	//show_debug_message("send_remote_entity | " + string({buffer : _buffer, command : _command, socket : _socket, value : _value, instance : _instance}))
	
	
	//Buffer data stream : PACKET, CMD, INSTANCE, VALUE
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, get_buffer_constant("command"), PACKET.ENTITY);
	buffer_write(_buffer, get_buffer_constant("command"), _command); //second command
	buffer_write(_buffer, get_buffer_constant("instance_id"), _instance); //id of the entity
	
	switch (_command){
		case CMD.X :{
			buffer_write(_buffer, buffer_u16, _value);
		}; break;
		case CMD.Y :{
			buffer_write(_buffer, buffer_u16, _value);
		}; break;
		case CMD.NAME :{
			buffer_write(_buffer, buffer_string, _value);
		}; break;
		case CMD.SPRITE :{
			buffer_write(_buffer, buffer_u16, _value);
		}; break;
		case CMD.DESTROY :{
			buffer_write(_buffer, buffer_u8, _value); //not buffer_boolean?
		}; break;
	}
	//Send to a player
	network_send_packet(_socket, _buffer, buffer_tell(_buffer))
}