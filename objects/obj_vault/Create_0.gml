
image_speed = 0; 
image_index = 0; 
is_open = false;
note_spawned = false;



if (global.vault_unlocked)
{
	image_index = 1;   // Vault should already be open
	
    // If the note isn't in inventory and doesn't already exist in the room, spawn it
    if (!array_contains(global.inventory, "vault_secret_document") && !instance_exists(obj_vault_note)) {
        var _cx = x + (sprite_width / 2);
        var _cy = y + (sprite_height / 2);
        instance_create_depth(_cx, _cy, depth - 100, obj_vault_note);
    }
}
