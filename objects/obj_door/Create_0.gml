
if (!variable_instance_exists(id, "target_room")) target_room = noone;
if (!variable_instance_exists(id, "door_sound"))  door_sound = noone;
if (!variable_instance_exists(id, "door_id"))     door_id = "";
if (!variable_instance_exists(id, "target_door_id")) target_door_id = "";
if (!variable_instance_exists(id, "is_locked"))   is_locked = false;
if (!variable_instance_exists(id, "key_needed"))  key_needed = "";

// Initialize the global persistence struct
if (!variable_global_exists("door_states")) {
    global.door_states = {};
}
