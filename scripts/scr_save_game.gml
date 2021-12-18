//saves the game

if (!instance_exists(obj_stats)) exit;

var save_data = ds_map_create();
with (obj_stats) {
    save_data[? "room"] = previous_room;
    save_data[? "x"] = player_xstart;
    save_data[? "y"] = player_ystart;
    save_data[? "health_points"] = health_points;
    save_data[? "max_health_points"] = max_health_points;
    save_data[? "energy_points"] = energy_points;
    save_data[? "max_energy_points"] = max_energy_points;
    save_data[? "expr_points"] = expr_points;
    save_data[? "max_expr_points"] = max_expr_points;
    save_data[? "level"] = level;
    save_data[? "attack"] = attack;
    save_data[? "level_counter"] = level_counter;
}

var save_string = json_encode(save_data);
ds_map_destroy(save_data);
save_string = base64_encode(save_string);

var file = file_text_open_write(working_directory + "save.dat");
file_text_write_string(file, save_string);
file_text_close(file);

show_message("Game saved successfully.");
