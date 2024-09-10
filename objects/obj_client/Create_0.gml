show_debug_message("creating obj_client");

socket = network_create_socket(network_socket_tcp);
global.socket = socket;
buffer = buffer_create(16384, buffer_grow, 1);
connect = network_connect(socket, "127.0.0.1", PORT);


entities = ds_map_create();

show_debug_message("obj_client create finished")