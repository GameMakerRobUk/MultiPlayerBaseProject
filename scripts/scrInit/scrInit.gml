//Initialise server
#macro PORT 4500
#macro MAX_CLIENTS 4

//packts
enum PACKET {KEY, ENTITY};
enum CMD {X, Y, NAME, SPRITE, DESTROY}

//Game
enum KEY {LEFT, RIGHT, UP, DOWN}

global.buffer_value_constants = {
	x : buffer_u16,
	y : buffer_u16,
	name : buffer_string,
	sprite_index : buffer_u16,
	key : buffer_u8,
	instance_id : buffer_u32,
	command : buffer_u8,
	destroy : buffer_u8,
	boolean : buffer_u8,
}