//show_debug_message("obj_server draw_gui")
draw_set_halign(fa_right);
draw_set_valign(fa_top);

var _players = ds_list_size(sockets);
draw_set_color(c_white);
draw_text(room_width, 0, "Players: " + string(_players))