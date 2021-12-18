//loads game from the save.

var file = file_text_open_read(working_directory + "save.dat");
var save_string = file_text_read_string(file);
file_text_close(file);

save_string = base64_decode(save_string);
var save_data = json_decode(save_string);

var save_room = save_data[? "room"];
if (room != save_room) {
    room_goto(save_room);
}

with (obj_stats) {
    player_xstart = save_data[? "x"];
    player_ystart = save_data[? "y"];
    
    if (instance_exists(obj_player)) {
        obj_player.x = player_xstart;
        obj_player.y = player_ystart;
        
        obj_player.phy_position_x = player_xstart;
        obj_player.phy_position_y = player_ystart;
    } else {
        instance_create(player_xstart, player_ystart, obj_player);
        show_debug_message("Player created!");
    }
    
    health_points = save_data[? "health_points"];
    max_health_points = save_data[? "max_health_points"];
    energy_points = save_data[? "energy_points"];
    max_energy_points = save_data[? "max_energy_points"];
    expr_points = save_data[? "expr_points"];
    max_expr_points = save_data[? "max_expr_points"];
    level = save_data[? "level"];
    attack = save_data[? "attack"];
    level_counter = save_data[? "level_counter"];
}

ds_map_destroy(save_data);
