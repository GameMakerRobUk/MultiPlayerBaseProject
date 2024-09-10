// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_key(_buffer, _socket, _key, _is_pressed){
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, get_buffer_constant("command"), PACKET.KEY);
	buffer_write(_buffer, get_buffer_constant("key"), _key);
	buffer_write(_buffer, get_buffer_constant("boolean"), _is_pressed);
	
	network_send_packet(_socket, _buffer, buffer_tell(_buffer))
}