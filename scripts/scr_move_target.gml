//Moves objects

if (point_distance(x, y, target_x, target_y) > enemy_speed) {
    var player_direction = point_direction(x, y, target_x, target_y);
    var horizontal_speed = lengthdir_x(enemy_speed, player_direction);
    var vertical_speed = lengthdir_y(enemy_speed, player_direction);

    if (horizontal_speed != 0) {
        image_xscale = sign(horizontal_speed);
    }
    
    phy_position_x += horizontal_speed;
    phy_position_y += vertical_speed;
}
