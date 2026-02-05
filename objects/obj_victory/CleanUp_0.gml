
// Reset the phone and danger
if (instance_exists(obj_phone)) {
    obj_phone.danger_level = 0;
    obj_phone.game_over_triggered = false;
}



// IMPORTANT: Reset vault progress so they can play again!
global.danger_level = 0;
global.vault_unlocked = false;
global.vault_painting_removed = false;
global.inventory = [];
