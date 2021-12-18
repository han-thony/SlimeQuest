//Checks if you can see enemies

if (instance_exists(obj_player)) {
    var distance = point_distance(x, y, obj_player.x, obj_player.y);
    if (distance < vision_range) {
        state = scr_enemy_chase_state;
        target_x = obj_player.x;
        target_y = obj_player.y;
    } else {
        scr_get_enemy_state();   
    }
} else {
    scr_get_enemy_state();
}
