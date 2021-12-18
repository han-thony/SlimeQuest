/// scr_move_state()

if (obj_input.dash_key) {
    var x_direction = lengthdir_x(8, player_face * 90);
    var y_direction = lengthdir_y(8, player_face * 90);
    var speaker = instance_place(x + x_direction, y + y_direction, obj_speaker);
    var puzzle = instance_place(x + x_direction, y + y_direction, obj_puzzle);
    
    if (speaker != noone) {
        if (!audio_is_playing(snd_text_scroll)) {
            audio_play_sound(snd_text_scroll, 1, true);
        }
        
        with (speaker) {
            if (!instance_exists(dialog)) {
                dialog = instance_create(x + x_offset, y + y_offset, obj_dialog);
                dialog.text = text;
            } else {
                dialog.text_page++;
                dialog.text_count = 0;
                
                if (dialog.text_page > array_length_1d(dialog.text) - 1) {
                    with (dialog) instance_destroy();
                    audio_stop_sound(snd_text_scroll);
                }
            }
        }
        
        if (room == rm_village && instance_place(x + x_direction, y + y_direction, obj_villager_male) != noone) {
            obj_stats.health_points = obj_stats.max_health_points;
        }
        
        if (room == rm_village && instance_place(x + x_direction, y + y_direction, obj_villager_male_three) != noone && !instance_exists(obj_dialog)) {
            obj_villager_male_three.alarm[0] = room_speed;
        }
    } else if (puzzle != noone && !puzzle.complete) {
        if (instance_exists(obj_player)) {
            obj_player.persistent = false;
        }
        
        obj_stats.previous_room = room;
        room_persistent = true;
        puzzle.complete = true;
        room_goto(rm_puzzle);
    } else if (obj_stats.energy_points >= DASH_COST) {
        audio_stop_sound(snd_footstep);
        state = scr_dash_state;
        alarm[0] = room_speed / 6;
        if mana_cheat = 0{
            obj_stats.energy_points -= 5;
            audio_play_sound(snd_dash, 2, false);
        }
        obj_stats.alarm[0] = room_speed;
    }
}

if (obj_input.attack_key) {
    audio_stop_sound(snd_footstep);
    if (!audio_is_playing(snd_sword_attack)) {
        audio_play_sound(snd_sword_attack, 2, false);
    }
    image_index = 0;
    state = scr_attack_state;
}

// Get player direction
player_direction = point_direction(0, 0, obj_input.x_axis, obj_input.y_axis);

// Get length
if (obj_input.x_axis == 0 && obj_input.y_axis == 0) {
    length = 0;
    audio_stop_sound(snd_footstep);
} else {
    length = player_speed;
    scr_get_face();
    if (!audio_is_playing(snd_footstep)) {
        audio_play_sound(snd_footstep, 2, true);
    }
}

// Get dimensional speeds
horizontal_speed = lengthdir_x(length, player_direction);
vertical_speed = lengthdir_y(length, player_direction);

// Move player
phy_position_x += horizontal_speed;
phy_position_y += vertical_speed;

// Update sprite
image_speed = sign(length) * .2;
if (length == 0) image_index = 0;

switch (player_face) {
    case RIGHT:
        sprite_index = spr_player_right;
        break;
    case UP:
        sprite_index = spr_player_up;
        break;
    case LEFT:
        sprite_index = spr_player_left;
        break;
    case DOWN:
        sprite_index = spr_player_down;
        break;
}
