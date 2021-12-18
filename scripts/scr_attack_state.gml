/// scr_attack_state()

image_speed = .5;
switch (sprite_index) {
    case spr_player_down:
        sprite_index = spr_player_attack_down;
        break;
    case spr_player_up:
        sprite_index = spr_player_attack_up;
        break;
    case spr_player_left:
        sprite_index = spr_player_attack_left;
        break;
    case spr_player_right:
        sprite_index = spr_player_attack_right;
        break;
}

if (image_index >= 3 && !attacked) {
    var damage_x = 0;
    var damage_y = 0;

    switch (sprite_index) {
        case spr_player_attack_down:
            damage_x = x;
            damage_y = y + 12;
            break;
        case spr_player_attack_up:
            damage_x = x;
            damage_y = y - 10;
            break;
        case spr_player_attack_left:
            damage_x = x - 10;
            damage_y = y + 2;
            break;
        case spr_player_attack_right:
            damage_x = x + 10;
            damage_y = y + 2;
            break;
    }

    var damage = instance_create(damage_x, damage_y, obj_damage);
    damage.damage = obj_stats.attack;
    damage.source = id;
    attacked = true;
}
