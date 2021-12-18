/// scr_dash_state()

if (length == 0) player_direction = player_face * 90;
length = player_speed * 4;

// Get dimensional speeds
horizontal_speed = lengthdir_x(length, player_direction);
vertical_speed = lengthdir_y(length, player_direction);

// Move player
phy_position_x += horizontal_speed;
phy_position_y += vertical_speed;

// Display dash effect
var dash = instance_create(x, y, obj_dash_effect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
