
// If the player enters the room again after the removing the painting, it should still be gone
if (global.vault_painting_removed) {
    instance_destroy();
}



depth = obj_vault.depth - 10;
click_count = 0;
max_clicks = 3;

shake_amount = 0;
