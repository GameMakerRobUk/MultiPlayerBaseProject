draw_set_halign(fa_center);

var _x = room_width/2;
var _y = 100;

for (var i = 0; i < array_length(menu); i ++){
	var _col = cur_index == i? c_green : c_white;
	draw_set_colour(_col);
	draw_text(_x, _y, menu[i]);	
	_y += 32;
}