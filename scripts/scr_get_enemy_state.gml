//Gets the state of an enemy

if (alarm[0] <= 0) {
    state = choose(scr_enemy_wander_state, scr_enemy_idle_state);
    alarm[0] = room_speed * irandom_range(2, 4);
    target_x = random(room_width);
    target_y = random(room_height);
}
