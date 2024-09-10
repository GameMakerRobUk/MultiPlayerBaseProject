server = network_create_server(network_socket_tcp, PORT, MAX_CLIENTS);
buffer = buffer_create(16384, buffer_grow, 1);

clients = ds_map_create();
sockets = ds_list_create();

show_debug_message("obj_server created")