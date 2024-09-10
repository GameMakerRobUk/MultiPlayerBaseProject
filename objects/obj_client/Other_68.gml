var _event_id = async_load[? "id"];

if (socket == _event_id){
	var _buffer = async_load[? "buffer"];	
	buffer_seek(_buffer, buffer_seek_start, 0);
	var _cmd = buffer_read(_buffer, get_buffer_constant("command"));
	
	switch (_cmd){
		case PACKET.ENTITY : {
			var _cmd2 = buffer_read(_buffer, get_buffer_constant("command"));
			var _instance = buffer_read(_buffer, get_buffer_constant("instance_id"));
			
			if (ds_map_find_value(entities, _instance) == undefined){
				var _player = instance_create_layer(0, 0, "Instances", obj_remote_entity);
				ds_map_set(entities, _instance, _player);
			}
			var _player = entities[? _instance];
			
			with (_player){
				switch (_cmd2){
					case CMD.X :{
						x = buffer_read(_buffer, get_buffer_constant("x"));
					}; break;
					case CMD.Y :{
						y = buffer_read(_buffer, get_buffer_constant("y"));
					}; break;
					case CMD.NAME :{
						name = buffer_read(_buffer, get_buffer_constant("name"));
					}; break;
					case CMD.SPRITE :{
						sprite_index = buffer_read(_buffer, get_buffer_constant("sprite_index"));
					}; break;
					case CMD.DESTROY :{
						buffer_read(_buffer, get_buffer_constant("destroy")); //not buffer_boolean?
						ds_map_delete(other.entities, _instance);
						instance_destroy();
					}; break;
				}
			}
		};break;
		
	}
}